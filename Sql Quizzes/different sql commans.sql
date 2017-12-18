#
# Uncomment one of these QUERY variables at a time by deleting the #.
# Use "Test Run" to run it.
# You'll see the results below.  Then try your own queries as well!
#

QUERY = "select max(name) from animals;"

#QUERY = "select * from animals limit 10;"

#QUERY = "select * from animals where species = 'orangutan' order by birthdate;"

#QUERY = "select name from animals where species = 'orangutan' order by birthdate desc;"

#QUERY = "select name, birthdate from animals order by name limit 10 offset 20;"

QUERY = "select species, min(birthdate) from animals group by species;"


#QUERY = '''
#select name, count(*) as num from animals
#group by name
#order by num desc
#limit 5;
#'''

#
# Write a query that returns all the species in the zoo, and how many animals of
# each species there are, sorted with the most populous species at the top.
# 
# The result should have two columns:  species and number.
#
# The animals table has columns (name, species, birthdate) for each individual.
# 
QUERY = '''
SELECT species, count(*) as num 
FROM animals  
group by species 
order by num desc; '''

#
# Find the one food that is eaten by only one animal.
#
# The animals table has columns (name, species, birthdate) for each individual.
# The diet table has columns (species, food) for each food that a species eats.
#

QUERY = '''
SELECT diet.food, count(*) as num 
FROM animals,diet 
WHERE animals.species = diet.species 
group by diet.food 
having num = 1;
'''
#
# Find the names of the individual animals that eat fish.
#
# The animals table has columns (name, species, birthdate) for each individual.
# The diet table has columns (species, food) for each food that a species eats.
#

QUERY = '''
SELECT animals.name 
FROM animals, diet 
WHERE animals.species = diet.species and diet.food = 'fish';
'''

# Number of mpeg files for pop genre
'''
SELECT Genre.Name, MediaType.Name, COUNT(MediaType.Name) as num
FROM Genre, MediaType, Track
WHERE Genre.GenreId = Track.GenreId and
MediaType.MediaTypeId = Track.MediaTypeId and
MediaType.Name = 'MPEG audio file' and
Genre.Name = 'Pop'
GROUP BY MediaType.Name
ORDER BY num;
'''

# Count no of unique customers for jazz
'''
SELECT Genre.Name, COUNT(DISTINCT Customer.CustomerId) as num
FROM Genre, MediaType, Customer, Track, Invoice, InvoiceLine
WHERE Customer.CustomerId = Invoice.CustomerId and
Invoice.InvoiceId = InvoiceLine.InvoiceId and
InvoiceLine.TrackId = Track.TrackId and
Track.GenreId = Genre.GenreId and
Genre.Name = 'Jazz';
'''

# WHich genre has most songs of below average song length
''' 
SELECT Genre.Name, COUNT(Track.Name) as dis
FROM Genre, Track
WHERE Genre.GenreId = Track.GenreId and Track.Milliseconds <
(SELECT AVG(Track.Milliseconds)
FROM Genre, Track)
GROUP BY Genre.Name
ORDER BY dis DESC
LIMIT 1;
