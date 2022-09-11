SELECT M.name, M.earnings_rank
FROM movies M, oscars O
WHERE O.movies_id = M.id AND O.type = 'best-picture'
ORDER BY M.earnings_rank ASC
Limit 1;