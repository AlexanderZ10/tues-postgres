-- Question 1: The songs in a given playlist, in order.
-- Returns one row per song in the playlist 'Road Trip':
-- position, title, artist, duration (in seconds), sorted by position.
SELECT ps.position,
       s.title,
       a.name AS artist,
       s.duration_sec
FROM playlist_songs ps
JOIN playlists p ON p.id = ps.playlist_id
JOIN songs s     ON s.id = ps.song_id
JOIN artists a   ON a.id = s.artist_id
WHERE p.name = 'Road Trip'
ORDER BY ps.position;


-- Question 2: The total duration and the number of songs of every playlist.
-- Returns one row per playlist: name, number of songs, total duration (in seconds).
-- LEFT JOIN so that a playlist with no songs still appears (with 0 songs and 0 seconds).
SELECT p.name,
       COUNT(ps.song_id)               AS song_count,
       COALESCE(SUM(s.duration_sec), 0) AS total_duration_sec
FROM playlists p
LEFT JOIN playlist_songs ps ON ps.playlist_id = p.id
LEFT JOIN songs s           ON s.id = ps.song_id
GROUP BY p.id, p.name
ORDER BY p.id;
