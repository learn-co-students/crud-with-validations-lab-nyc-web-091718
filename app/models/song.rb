class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, :uniqueness => {:scope => [:release_year, :artist_name]}
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_cannot_be_in_the_future
  validate :released_release_year

  def released_release_year
    if released == true && release_year == nil
      errors.add(:release_year, "Need release year when released is checked")
    end
  end

  def release_year_cannot_be_in_the_future
    if release_year.present? && release_year > Time.now.year
      errors.add(:release_year, "can't be in the future")
    end
  end


end ### End of Song Class
