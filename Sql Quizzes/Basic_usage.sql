'''

Welcome to your first Problem Set!  

Problem Sets are here to get you set up and ready to start doing
amazing things using SQL.

In this exercise, there are a bunch of queries for you to try out. 
Feel free to experiment by changing existing queries or writing one all on your own!

Let's jump right in...

Hit Test Run to see the result of your first query!

'''

#QUERY = "SELECT Composer, Name FROM Track WHERE Composer='Van Halen';"

'''

NICE WORK!  Were you able to see the output below?  That's your data :)

Throughout the problem sets in this course you'll be using the Chinook Database.

This database represents a music store you're going to query, explore 
and eventually build all on your own!

SQL is all about answering questions driven by your own curiosity and 
excitement about the data you've collected.  

Let's ask our database another question!

'''

'''QUESTION:Which songs in this dataset were written by AC/DC?'''

# <-- Remove this hashtag from before any QUERY to 'uncomment' it.
# Next hit Test Run to see the result. 

#QUERY = "SELECT Name FROM Track WHERE Composer='AC/DC';"

'''Do you think that query did a good job answering the question?'''


'''

You'll notice the SQL closely resembles spoken language and it's not 
too hard to figure out what a query is asking.  

See if you can figure out what the following questions are hoping to find!

'''


'''QUESTION: How long would it take to listen to all the songs in our 
dataset that were written by Johannes Sebastian Bach?'''

#QUERY = "SELECT Composer, sum(Milliseconds) FROM Track WHERE Composer='Johann Sebastian Bach';"


'''QUESTION: Fill in the question you think could be answered by the following query.'''

#QUERY = "SELECT FirstName, LastName FROM Customer WHERE FirstName='Phil';"

'''Did this query find an employee named Phil?''' 


'''QUESTION: Fill in the question you think could be answered by the following query.'''

#QUERY = "SELECT FirstName, LastName, Title, Birthdate FROM Employee;"


'''
Did running your queries return the type of results you might have expected?  I hope so :)

Let's try something a little different...

Can you change the following query so that it better answers the given question?

QUESTION: Which tracks in our dataset were written by Jimi Hendrix?'''

QUERY = "SELECT Composer, Name FROM Track WHERE Composer = 'Jimi Hendrix';"

'''

Were you able to get a list of songs by Jimi Hendrix?

A great way to start building your own queries is by knowing which  
tables and columns are held in your database.

One way to learn this is by setting up your own local environment, 
and that's what you'll be doing by the end of this problem set!

'''
