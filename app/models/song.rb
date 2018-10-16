class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true
  validate :was_it_released
  validate :is_release_year_in_the_future


  def was_it_released
    if released == true && !release_year.present?
      errors.add(:release_year, "missing release year")
    end
  end

  def is_release_year_in_the_future
    if release_year.present? && release_year > Time.now.year
      errors.add(:release_year, "can't be released if the release year is in the future")
    end
  end

end
