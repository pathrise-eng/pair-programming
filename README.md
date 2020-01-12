# Internal Pair Programming Resources

Below is as documented of a process for doing Pair Programming sessions as I could muster to make. :) 

## Emails Before Pair Programming Session

* Templated emails are sent out the day that pair programming sessions happen (Tue/Thur @ 1pm, Sun @ 10am)
* The templated email links to the our contentful doc on [what pair programming is](https://fellows.pathrise.com/knowledge/guides/what-is-pair-programming) and when the sessions are (this will have to be updated if/when the sessions times change
* The emails also state clearly that fellows should arrive within 5 minutes or will be locked out of the room
* The templates are in the Streaks Gmail shared Pathrise account

## What To Do Before A Pair Programming Session
* Find a question to ask for the session. I do this by...
  * Going to leetcode and filtering questions by tags (looking for POPULAR questions that have high frequency)
  * The reason for looking at the tags is to make sure I don't always end up picking a question with the same answer type (I found that I was doing a lot of DFS questions because that's an answer for a lot of leetcode mediums)
  * I ensure that I have a solution that I understand. Sometimes I write it myself, sometimes I just find a decent one that someone wrote in the discussion section on leetcode.
  * Go to the pair programming question folder, copy a doc that has a previous question, and edit the copy to contain a new question
  * Go to the [pair programming hackerpair worksheet](https://docs.google.com/spreadsheets/d/1s5CFJVw-wMcHUDaSYzeD6npqdC-2mUJhBlR4atHR7Ks/edit#gid=0) and wipe the names off the excel sheet and reset the hackerpair links if needed (details on how to do so are below in another section)
  

## What To Do During A Pair Programming Session - Setup
* I start off showing [this link about pair programming](https://www.agilealliance.org/glossary/pairing/) and explain that...
  * Pair programming was a paradignm invented in the 90's to increase programmer efficiency and decrease bugs
  * Driver = person typing at keyboard, Navigator = person thinking about the problem in a broader context and watching for mistakes
* I give the link to the [pair programming hackerpair worksheet](https://docs.google.com/spreadsheets/d/1s5CFJVw-wMcHUDaSYzeD6npqdC-2mUJhBlR4atHR7Ks/edit#gid=0) after the 5 min mark has passed and I'm not going to let anyone else in the google hangouts (to avoid having to repair everyone)
* I explain that people have to type their name in the excel sheet **and press enter**. This sounds dumb but if I don't say it some people will type their name and then I can't see it and don't pair them properly
* After a minute or so I pair everyone together, if there is one person by themselves I give them to go solo or join as a third with another group. Pairing shown below...


![Pairing image](https://i.imgur.com/YIUfYcu.png)

## What To Do During A Pair Programming Session - Setup Cont. (15 min total)
* After they are paired I tell them to go to their hackerranks to the right of their name
* I then demo where the hackerrank conference button is because many fellows don't know.

![Demo Conference Button image](https://i.imgur.com/PspLQES.png)

## What To Do During A Pair Programming Session - Question Time (30 min total)
* After setup is complete I simply present the question and give a minute for them to ask clarifying questions
* I re-emphasize that this is one of the only sessions where *we don't care if they solve the problem* and that what we're mostly trying to develop here is rock-solid communication. If they are stuck they should be able to articulate where they are stuck and if they understand it they should be able to articulate clearly to their partner how to solve the problem.
* I share a direct link to the question as a google doc. Lots of folks prefer to drop off my call and come back in 30 min – especially the folks with bad internet/machines and can stream my hangouts call and a hackerrank call simultaneously
* I set a timer for 30 min and leave them alone

## What To Do During A Pair Programming Session - Solutions (15 min total)
* After 30 min are up I ask if anyone has solved the problem, if yes I have them walk through their solution
* People are usually eager to share so if anyone wants to share any part of what they have I let them during this time
* I leave 5 min to discuss my saved solution from earlier if I feel I need to still explain anything or if I think anyone may still be confused on the problem
* I end the session and thank everyone for coming

## What To Do After A Pair Programming Session - Solutions (30 min total)
* This script is currently saved in a REPL [here](https://repl.it/repls/EmbarrassedMedicalSeahorse) for me to be able to easily execute from any machine - it gives me fresh hackerpair links when run
* Erase all the names and the used hackerpair links from the hackerpair sheet
* Replace the hackerpair links with new ones from the above script
* **NOTE** It's much preferred to create new hackerpair sessions each time rather than going into them and just deleting the code. This is because a) it saves the chat history of fellows and we shouldn't really be letting other fellows see that and b) it looks cleaner and is easy to miss plus c) if you have more than like 3 links to clear it's faster to run the script 

## Languages Used

* Python - predominately
* Java - occasionally
* JavaScript - rarely
* Ruby - uncommonly


## Authors

* **Michael Mroczka** - *Most questions, solutions, recordings, and answers*
* **Justin Hoyt** - *Questions/solutions*
* **Erik Griffin** - *Initial work & first dozen questions*
