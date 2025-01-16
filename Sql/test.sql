SELECT  tracks.TrackId,
        tracks.Name,
        albums.Title
    
FROM    tracks
JOIN    albums
ON      tracks.AlbumId = albums.AlbumId