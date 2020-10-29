### List all customers (name + email), ordered alphabetically (no extra information)

```sql
SELECT first_name, last_name, email FROM customers
ORDER BY last_name

# Should yield 59 results
```

### List tracks (Name + Composer) of the Classical playlist

```sql
SELECT tracks.composer, tracks.name FROM playlist_tracks
JOIN tracks ON tracks.id = playlist_tracks.track_id
JOIN playlists ON playlists.id = playlist_tracks.playlist_id
WHERE playlists.name = "Classical"

# Should yield 75 results
```

### List the 10 artists mostly listed in all playlist

```sql
SELECT artists.name, COUNT(*) AS occurrences FROM artists
JOIN albums ON artists.id = albums.artist_id
JOIN tracks ON albums.id = tracks.album_id
JOIN playlist_tracks ON tracks.id = playlist_tracks.track_id
GROUP BY artists.name
ORDER BY occurrences DESC
LIMIT 10

# First result should be Iron Maiden with 516 occurrences
```

### List the tracks which have been purchased at least twice, ordered by number of purchases

```sql
SELECT tracks.composer, tracks.name, COUNT(*) AS purchases FROM tracks
JOIN invoice_lines ON invoice_lines.track_id = tracks.id
GROUP BY tracks.id
HAVING purchases >= 2
ORDER BY purchases DESC

# Should yield 265 results, Steve Harris - The Trooper having 5 purchases being the top bought track
```
