class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true,false] }
  validates :title, uniqueness: {
  scope: [:release_year, :artist_name],
  message: 'already released this year'}
  validates :artist_name, presence: true
  validate :release_year_validations



  private

  def release_year_validations
    if released
      if release_year == nil
        errors.add(:release_year, "If released, must include release year.")
      end
    end

    if release_year.to_i > Time.now.year.to_i
      errors.add(:release_year, "Can't be in the future!")
    end


  end

end
