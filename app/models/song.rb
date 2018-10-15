class Song < ActiveRecord::Base
  validates :title, presence: true #look up scope
  validates_uniqueness_of :title, :scope => [:release_year, :artist_name]
  validates :released, inclusion: { in: [ true, false] }
  validates :artist_name, presence: true


# Optional if released is false
# Must not be blank if released is true
# Must be less than or equal to the current year
  with_options if: :released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  # def release_status?
  #   released
  # end

end
