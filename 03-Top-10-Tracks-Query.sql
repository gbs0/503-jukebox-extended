SELECT artists.name, COUNT(*) AS c FROM artists
JOIN playlist_tracks ON tracks.id = playlist_tracks.track_id
JOIN tracks ON albums.id = tracks.album_id
JOIN albums ON artists.id = albums.artist_id
GROUP BY artists.name
ORDER BY c DESC
LIMIT 10;