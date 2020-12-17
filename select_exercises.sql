#Exercises
#Create a new file called select_exercises.sql. Do your work for this exercise in that file.

#Use the albums_db database.


#Explore the structure of the albums table.
 


#Write queries to find the following information.

#The name of all albums by Pink Floyd
	SELECT name
	FROM `albums`
	WHERE `artist` = 'Pink Floyd';

#The year Sgt. Pepper's Lonely Hearts Club Band was released
	SELECT `release_date` 
	FROM albums 
	WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";


#The genre for the album Nevermind
	SELECT `genre` 
	FROM albums
	WHERE name = 'Nevermind';
	
#Which albums were released in the 1990s
	SELECT name 
	FROM albums
	WHERE `release_date` BETWEEN 1990 AND 1999;
	
#Which albums had less than 20 million certified sales
	SELECT name
	FROM `albums`
	WHERE `sales` < 20;
	
#All the albums with a genre of "Rock".
	SELECT name
	FROM `albums` 
	WHERE genre = 'Rock';
# Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
The query searches for albums where "Rock" is the only genre, not one of the genres associated with the albums.


