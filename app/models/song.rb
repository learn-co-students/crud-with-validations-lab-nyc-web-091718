class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true


  def released?
    released
  end

end
