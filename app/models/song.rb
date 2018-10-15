class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :same_artist_same_year
  validates :released, inclusion:{in: [true,false]}
  validate :release_year_if_released
  validates :artist_name, presence: true


  def same_artist_same_year
    same_song = Song.all.find do |song|
        if self.title == song.title && self.artist_name == song.artist_name && self.release_year == song.release_year
        song
      end
    end
    if same_song != nil
      errors.add(:title, "A song with this title, artist and release year has been created")
    end
  end

  def release_year_if_released
    if self.released
      if self.release_year == nil
        errors.add(:release_year, "Please Enter a release Year")
      elsif self.release_year > Date.today.year
          errors.add(:release_year, "Please Enter a valid release Year")
      else
      end
    end
  end
  
end
