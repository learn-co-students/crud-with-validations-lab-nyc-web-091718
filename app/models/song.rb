class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'Artist cannot release the same song more than once in a year'
  }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }

  validate :release_year_must_not_be_nil_if_released
  validate :release_year_must_not_be_in_the_future

  def release_year_must_not_be_nil_if_released
    if released == true && !release_year.present?
      errors.add(:release_year, "release year must be set if the item is released")
    end
  end

  def release_year_must_not_be_in_the_future
    if release_year.present? && release_year >= Date.today.year
      errors.add(:release_year, "release year must not be greater than the current date")
    end
  end



end
