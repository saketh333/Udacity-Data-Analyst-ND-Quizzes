##  Alright, now that you're warmed up let's get down to business!

##  In this problem set we'll pretend the Chinook database is the data for your own personal music shop!
##  We'll be marketing your shop and hosting Music Festival using answers we get from 
##  the data stored in your database.
##  Let's get started :)

##  First, you'd like to run a promotion targeting the 3 countries with the 
##  highest number of invoices.  

##  Write a query that returns the 3 countries with the highest number of invoices, along with the number ##  of invoices for these countries.


QUERY = '''
SELECT BillingCountry, COUNT(*) as num
FROM Invoice
GROUP BY BillingCountry
ORDER BY num DESC
LIMIT 3;
'''

'''
---VISUAL GUIDE--- 
(The visual guides are meant to help show you how your queries are interacting with the database)

Before Query...

#################
#   Invoice     #              <----- FROM
################# 
| BillingCountry|  COUNT(*)   <----- SELECT
+===============+

After Query...

################################
#           Invoice            #   <----- RESULT!
################################  
| BillingCountry|   COUNT(*)   |  
+===============+==============+
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

##  The customer who has spent the most money will be declared your best customer.
##  They definitely deserve an email thanking them for their patronage :)  

##  Build a query that returns the person who has the highest sum of all invoices,
##  along with their email, first name, and last name.


QUERY ='''
SELECT Customer.Email, Customer.FirstName, Customer.LastName,  sum(Invoice.Total)
FROM Customer, Invoice
WHERE Customer.CustomerId = Invoice.CustomerId
GROUP BY Invoice.CustomerId
ORDER BY sum(Invoice.Total) DESC
LIMIT 1;

'''

'''
---VISUAL GUIDE---

Before Query...

###############         ####################   
#  Customer   #         #     Invoice      #  
###############         ####################   
|  CustomerId | = ON  = | CustomerId       |  <-----  FROM/JOIN
+=============+         +==================+  
|  FirstName  |         | Total            |  <-----  sum Total and limit
+=============+         +==================+          to highest sum
|  LastName   |    
+=============+    
|  Email      |               
+=============+

After Query...

###################################################   
#             CustomerInvoice                     #   <-----  RESULT!
###################################################   
|  Email  |  FirstName | LastName    |    Total   |
+=========+============+=============+============+

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

##  Now that we know that our customers love rock music, we can decide which musicians to 
##  invite to play at the concert. 

##  Let's invite the artists who have written the most rock music in our dataset.
##  Write a query that returns the Artist name and total track count of the top 10 rock bands. 


QUERY = '''
SELECT Artist.Name, COUNT(Track.GenreId)
FROM Genre, Track, Album, Artist
WHERE Genre.GenreId = Track.GenreId and
Track.AlbumId = Album.AlbumId and 
Album.ArtistId = Artist.ArtistId and
Genre.Name = 'Rock'
GROUP BY Artist.Name
ORDER BY COUNT(Track.GenreId) DESC
LIMIT 10;
'''

'''
---Visual Guide---

Before Query...

#############      #############      #############      ############
#    Genre  #      #   Track   #      #   Album   #      #  Artist  #
#############      #############      #############      ############
|  GenreId  | ---> |  GenreId  |      |  ArtistId  | --->| ArtistId |
+-----------+      +-----------+      +-----------+      +----------+
|  Name     |      |  AlbumId   |---> |  AlbumId  |      |  Name    |
+-----------+      +-----------+      +-----------+      +----------+

After Query...

#######################################
#             GenreArtist             #
#######################################
|  Artist.Name  |  COUNT(Genre.Name)  |
+---------------+---------------------+

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

##  The show was a huge hit! Congratulations on all your hard work :)  
##  After the popularity of your first show you've decided to jump on the
##  railway for an Alternative & Punk tour through France!  

##  What does the alternative punk scene look like throughout French 
##  cities in your dataset?

##  Return the BillingCities in France, followed by the total number of 
##  tracks purchased for Alternative & Punk music.
##  Order your output so that the city with the highest total number of
##  tracks purchased is on top.


QUERY = '''
SELECT Invoice.BillingCity, COUNT(Track.GenreId) as num
FROM Invoice, InvoiceLine, Track, Genre
WHERE Invoice.InvoiceId = InvoiceLine.InvoiceId and
InvoiceLine.TrackId = Track.TrackId and
Track.GenreId = Genre.GenreId and
Genre.Name = 'Alternative & Punk' and
Invoice.BillingCountry = 'France'
GROUP BY Invoice.BillingCity
ORDER BY num DESC;
'''


'''
---Visual Guide---

Before Query...

#################       #################       #############      #############
#    Invoice    #       #  InvoiceLine  #       #   Track   #      #   Genre   #
#################       #################       #############      #############
|  InvoiceId    | --->  |  InvoiceId    |       |  GenreId  | ---> |  GenreId  |
+---------------+       +---------------+       +-----------+      +-----------+
|  BillingCity| |       |  TrackId      |  ---> |  TrackId  |      |  Name     |  
+---------------+       +---------------+       +-----------+      +-----------+
| BillingCountry|
+---------------+

After Query..

###############################
#        InvoiceGenre         #
###############################
|  BillingCity  |  NumTracks  |
+---------------+-------------+

'''

