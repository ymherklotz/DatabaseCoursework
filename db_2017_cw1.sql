-- Q1 returns (name,dod)
SELECT person_b.name, person.dod
FROM person JOIN person AS person_b
ON person.name = person_b.mother
AND person.dod IS NOT NULL
;

-- Q2 returns (name)
SELECT name
FROM person
WHERE gender = 'M'
EXCEPT
SELECT father
FROM person
ORDER BY name
;

-- Q3 returns (name)
SELECT mother AS name
FROM person
GROUP BY mother
HAVING COUNT(DISTINCT gender) = (SELECT COUNT(DISTINCT gender)
       		      	      	 FROM person)
AND mother IS NOT NULL
;

-- Q4 returns (name,father,mother)
SELECT person.name, person.father, person.mother
FROM person
WHERE person.dob <= ALL (SELECT person_b.dob
                         FROM person AS person_b
                         WHERE person.mother = person_b.mother
                         AND father = person_b.father)
AND person.father IS NOT NULL
AND person.mother IS NOT NULL
ORDER BY person.name
;

-- Q5 returns (name,popularity)
SELECT p.name, COUNT(p.name) AS popularity
FROM (SELECT SUBSTRING(name FROM '^[a-zA-Z]+') AS name
      FROM person) AS p
GROUP BY p.name
HAVING COUNT(p.name) > 1
ORDER BY popularity DESC, p.name
;

-- Q6 returns (name,forties,fifties,sixties)
SELECT father
       COUNT(CASE WHEN dob >= '19400101' AND dob < '19500101'
                  THEN name ELSE NULL END) AS forties,
       COUNT(CASE WHEN dob >= '19500101' AND dob < '19600101'
                  THEN name ELSE NULL END) AS fifties,
       COUNT(CASE WHEN dob >= '19600101' AND dob < '19700101'
                  THEN name ELSE NULL END) AS sixties
FROM person
GROUP BY father
;


-- Q7 returns (father,mother,child,born)

;

-- Q8 returns (father,mother,male)

;

