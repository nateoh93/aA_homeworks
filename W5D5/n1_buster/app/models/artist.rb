class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO: your code here
    albums = self
      .albums
      .select('albums.*, COUNT(*) AS song_count')
      .joins(:tracks)
      .group('album.id')

    hash = {}
    albums.map do |album|
      hash[album.title] = album.song_count
    end

    hash
  end
end
