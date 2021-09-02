--Query the PoKi database using SQL SELECT statements to answer the following questions:


--What grades are stored in the database?
-- Response: 1st-5th Grades

--SELECT Name
--FROM Grade


--What emotions may be associated with a poem?
-- Response: Anger, Fear, Sadness, Joy

--SELECT Name
--FROM Emotion

--How many poems are in the database?
-- Response:32842

--SELECT Count(Id)
--FROM Poem

--Sort authors alphabetically by name. What are the names of the top 76 authors?
--Response: .lilly, .morgan, .tyler.t and julian.c., a, a, a, a, a friend, a llison, a.

--SELECT TOP (10)
--Name
--FROM Author
--ORDER BY Name ASC


--Starting with the above query, add the grade of each of the authors.
-- Response: 

--SELECT TOP (10)
--a.Name, g.Name
--FROM Author a
--INNER JOIN Grade g
--	ON g.Id = a.GradeId
--ORDER BY a.Name ASC


--Starting with the above query, add the recorded gender of each of the authors.

SELECT TOP (10)
a.Name, gr.Name, ge.Name
FROM Author a
INNER JOIN Grade gr
	ON gr.Id = a.GradeId
INNER JOIN Gender ge
	ON ge.Id = a.GenderId
ORDER BY a.Name ASC


--What is the total number of words in all poems in the database?
--Which poem has the fewest characters?
--How many authors are in the third grade?
--How many total authors are in the first through third grades?
--What is the total number of poems written by fourth graders?
--How many poems are there per grade?
--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
--What is the title of the poem that has the most words?
--Which author(s) have the most poems? (Remember authors can have the same name.)
--How many poems have an emotion of sadness?
--How many poems are not associated with any emotion?
--Which emotion is associated with the least number of poems?
--Which grade has the largest number of poems with an emotion of joy?
--Which gender has the least number of poems with an emotion of fear?