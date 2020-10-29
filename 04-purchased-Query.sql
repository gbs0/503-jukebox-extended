SELECT tracks.name, tracks.composer, COUNT(*) AS purchase FROM tracks
JOIN invoice_lines ON invoice_lines.track_id = tracks.id
GROUP BY tracks.id
HAVING purchase >= 2
ORDER BY purchase DESC;