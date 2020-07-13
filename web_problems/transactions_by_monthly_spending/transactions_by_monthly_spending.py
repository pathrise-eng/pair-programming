 
import requests
from datetime import datetime

base_url = "https://jsonmock.hackerrank.com/api/transactions/search"

def getUserTransaction(uid, txnType, monthYear):
    avg_amount = getAverageSpending(uid, monthYear, txnType)
    # No matching transactions found
    if avg_amount < 0:
        return [-1]

    payload = {"txnType":txnType, "userId":uid}
    data = requests.get(base_url, params = payload).json()
    total_pages = data['total_pages']
    page_num = 1
    output_records = []
    
    #check records on all pages
    while page_num<=total_pages:
        payload = {"txnType":txnType, "userId":uid, "page": page_num}
        data = requests.get(base_url, params = payload).json()
        #find transactions with amount > avg_amount
        for record in data["data"]:
            record_date = datetime.utcfromtimestamp(record['timestamp']//1000).strftime('%m-%Y')
            record_amount = convertStringToFloat(record["amount"])
            if record_date==monthYear and record_amount>avg_amount:
                output_records.append(record["id"])
        page_num+=1
    #return result in sorted order
    return sorted(set(output_records)) if output_records else [-1]

def getAverageSpending(uid, monthYear, txnType):
    payload = {"txnType":txnType}
    data = requests.get(base_url, params = payload).json()
    total_pages = data['total_pages']
    page_num = 1
    target_records = 0
    total_spending = 0
    
    #check records on all pages
    while page_num<=total_pages:
        payload = {"txnType":txnType, "userId":uid, "page":page_num}
        data = requests.get(base_url, params = payload).json()
        for record in data["data"]:
            #convert time in UTC milliseconds to MM-YYYY
            record_date = datetime.utcfromtimestamp(record['timestamp']//1000).strftime('%m-%Y')
            #find a record match with monthYear and uid
            if record_date==monthYear and record["userId"]==uid:
                target_records+=1
                #convert the transaction amount from string to float and add to the total spending.
                total_spending+=convertStringToFloat(record["amount"])
        page_num+=1
        
    #if we find matching record
    if target_records>0:
        avg_spending = total_spending/target_records
        return avg_spending
    
    # if no records found
    return -1

def convertStringToFloat(cost_str):
    cost_str = cost_str[1:] #remove $ symbol
    cost_str = cost_str.split(',')
    cost_str = ''.join(cost_str)
    return float(cost_str)
