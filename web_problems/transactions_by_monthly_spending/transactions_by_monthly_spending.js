let https = require('https');

async function getUserTransaction(uid, txnType, monthYear) {
    let responseArr = [];
    let monthlyAvgSpending;
    let url = `https://jsonmock.hackerrank.com/api/transactions/search?userId=${uid}&txnType=${txnType}`;

    // retrieve all transactions
    const results = await getUserTransactions(url, request);

    // filter out transactions list and only contain transactions in given monthYear
    let monthlyTransactions = await getMonthlyTransactions(results, monthYear);

    // calculate average spending of transaction type txnType in given monthYear
    monthlyAvgSpending = await avgAmountSpent(monthlyTransactions);

    // filter out transactions that have transaction amount > avg amount
    const idsTransactionsGreaterThanAvg = await getTransactionsGreaterThanAvg(monthlyAvgSpending, monthlyTransactions);
    if(idsTransactionsGreaterThanAvg.length === 0){
        return [-1];
    }

    // sort valid transactions in increasing order
    const sortedIds = idsTransactionsGreaterThanAvg.sort((a, b) => a - b);
    return sortedIds;
}

// retrieve transactions on all pages
async function getUserTransactions(url, fn, currPageNumber = 1) {
    let response = null;
    let results = [];
    let totalResults = 0;
    let totalPages = 0;
    do {
        response = await fn(url, currPageNumber);
        totalPages = Number(response.total_pages);
        currPageNumber = Number(response.page) + 1;
        for(let transaction of response.data){
            results.push(transaction);
        }
    } while (currPageNumber <= totalPages);

    return results;
}

async function request(url, currPageNumber=1) {
    url = url + '&page=' + currPageNumber;
    return new Promise((resolve, reject) => {
        https.get(url, res => {
            let response = "";
            res.on('data', chunk => {
                response += chunk;
            })
            
            res.on('end', _ => {
                resolve(JSON.parse(response));
            });
        }).on('error', err => reject(err))
    });
}

// find transactions that have transaction amount > monthly averge spent
async function getTransactionsGreaterThanAvg(monthlyAvgSpending, monthlyTransactions) {
    let transactions = [];
    for(let monthlyTransaction of monthlyTransactions) {
        let monthlyTransactionAmount = await convertAmountToNumber(monthlyTransaction.amount);
        if(monthlyTransactionAmount > monthlyAvgSpending) {
            transactions.push(monthlyTransaction.id);
        }
    }
    return transactions;
}

// convert transaction amount from string to number
async function convertAmountToNumber(stringAmount) {
    let amount = stringAmount.split('');
    amount.splice(0,1);
    amount.splice(1,1);
    amount = amount.join('');
    amount = Number(amount);
    return amount;
}

// calculate average monthly spent
async function avgAmountSpent(monthlyDebitTransactions) {
    let amounts = [];
    let total = 0;
    for(let monthlyDebitTransaction of monthlyDebitTransactions) {
        amounts.push(await convertAmountToNumber(monthlyDebitTransaction.amount));
    }
    for(let amount of amounts) {
        total = total + amount; 
    }
    const avg = total / amounts.length;
    return avg;
}

// filter out transactions list and only contain transactions in given monthYear 
async function getMonthlyTransactions(results, monthYear) {
    let monthlyTransactions = [];
    for (let result of results) {
        let resultDate = new Date(result.timestamp);
        resultDate = resultDate.toISOString();
        resultDate = resultDate.split('-');
        resultDate.pop();
        const monthYearDate = resultDate[1] + '-' + resultDate[0];
        if(monthYearDate === monthYear) {
            monthlyTransactions.push(result);
        }
    }
    return monthlyTransactions;
}