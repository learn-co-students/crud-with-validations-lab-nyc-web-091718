class Song < ActiveRecord::Base
  validate :title_validator
  validates :released, presence: true
  validates :artist_name, presence: true
  validate :release_year_validator


  def release_year_validator
    if released == true
      errors.add(:release_year, "Release Year cannot be in the future") if release_year > Time.new.year
      errors.add(:release_year, "Release year is required.") if release_year == nil
    end
  end

  def title_validator
    errors.add(:title, "Title cannot be blank") if !title.present?
    errors.add(:title, "A song with this title and artist from the current year already exists.") if !Song.where(artist_name: artist_name, title: title, release_year: Time.new.year).empty?
  end


end
