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

--SELECT TOP (76) Name
--FROM Author
--ORDER BY Name ASC


--Starting with the above query, add the grade of each of the authors.
-- Response: 

--SELECT TOP (76) a.Name, g.Name
--FROM Author a
--INNER JOIN Grade g
--	ON g.Id = a.GradeId
--ORDER BY a.Name ASC


--Starting with the above query, add the recorded gender of each of the authors.

--SELECT Top(76)
--a.Name, gr.Name, ge.Name
--FROM Author a
--INNER JOIN Grade gr
--	ON gr.Id = a.GradeId
--INNER JOIN Gender ge
--	ON ge.Id = a.GenderId
--ORDER BY a.Name ASC


--What is the total number of words in all poems in the database?
-- Response 374584
--SELECT SUM (WordCount) as TotalCharCount
--FROM Poem


--Which poem has the fewest characters?
-- Response: Hi

--SELECT Top(1)
--Title, CharCount
--FROM Poem
--ORDER BY CharCount ASC



--How many authors are in the third grade?
-- Response 2344

--SELECT Count(Name)
--FROM Author
--WHERE GradeId = 3

--How many total authors are in the first through third grades?
--SELECT GradeId, Count(Id) as NumberOfAuthors 
--FROM Author
--Group BY GradeId
--HAVING GradeId BETWEEN 1 AND 3


--What is the total number of poems written by fourth graders?

--SELECT a.GradeId, Count(p.Id) as NumOfPoems
--FROM Poem p
--INNER JOIN Author a
--	ON a.Id = p.AuthorId
--WHERE a.GradeId = 4
--GROUP BY a.GradeId


--How many poems are there per grade?

--SELECT a.GradeId, Count(p.Id) as NumOfPoems
--FROM Poem p
--INNER JOIN Author a
--	ON a.Id = p.AuthorId
--GROUP BY a.GradeId


--How many authors are in each grade? (Order your results by grade starting with 1st Grade)

--SELECT g.Name, Count(DISTINCT p.AuthorId) as 'NumOfAuthors'
--FROM Poem p
--INNER JOIN Author a
--	ON a.Id = p.AuthorId
--INNER JOIN Grade g
--	ON a.GradeId = g.Id
--GROUP BY g.Name
--ORDER By g.Name ASC


--What is the title of the poem that has the most words?

--SELECT TOP(1) Title, WordCount
--FROM Poem
--ORDER BY WordCount DESC


--Which author(s) have the most poems? (Remember authors can have the same name.)

--SELECT a.Id as AuthorId, a.Name, Count(p.AuthorId) as 'Number of Poems by Author'
--FROM Poem p
--INNER JOIN Author a
--	ON p.AuthorId = a.Id
--Group BY a.Id, a.Name
--Order BY 'Number of Poems by Author' DESC

--OR --

--SELECT a.Id, a.Name, Count(*) 'number of poems'
--FROM Author a
--JOIN Poem p on p.authorId = a.Id
--GROUP BY a.Id, a.Name
--ORDER BY 'number of poems' DESC

--How many poems have an emotion of sadness?

--SELECT e.Name, COUNT(p.Id) 'Number of Poems'
--FROM Poem p
--JOIN PoemEmotion pe ON p.Id = pe.PoemId
--JOIN Emotion e ON pe.EmotionId = e.Id
--WHERE e.Name = 'sadness'
--GROUP BY e.Name

--How many poems are not associated with any emotion?
--SELECT pe.PoemId as 'Poem Emotion', Count(p.Id) 'Number of Poems'
--FROM Poem p
--LEFT JOIN PoemEmotion pe ON p.Id = pe.PoemId
--WHERE pe.PoemId IS NULL
--GROUP BY pe.PoemId


--Which emotion is associated with the least number of poems?

--SELECT TOP 1 a.Name, Count(*) 'NumOfPoems'
--FROM Emotion e
--LEFT JOIN PoemEmotion pe ON e.ID = pe.EmotionId 
--Left JOIN poem p ON pe.PoemId = p.Id 
--GROUP BY e.Name
--Order by 'NumberOfPoems';


--Which grade has the largest number of poems with an emotion of joy?

--SELECT TOP 1 g.Name, Count(p.Id) 'Number of Poems'
--FROM Grade g 
--JOIN Author a ON g.ID = a.GradeId 
--JOIN Poem p ON p.AuthorID = a.Id
--JOIN PoemEmotion pe ON p.Id = pe.PoemId
--JOIN Emotion e ON e.Id = pe.EmotionId
--WHERE e.Name = 'joy'
--Group BY g.Name 
--ORDER BY 'Number of Poems' DESC


--Which gender has the least number of poems with an emotion of fear?
--SELECT TOP 1 g.Name, Count(p.Id) 'Number of Poems'
--FROM Gender g 
--JOIN Author a ON g.ID = a.GenderId 
--JOIN Poem p ON p.AuthorID = a.Id
--JOIN PoemEmotion pe ON p.Id = pe.PoemId
--JOIN Emotion e ON e.Id = pe.EmotionId
--WHERE e.Name = 'fear'
--Group BY g.Name 
--ORDER BY 'Number of Poems' 