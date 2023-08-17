class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
  validates :preview, presence: true

  has_many :bookmarks

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    if bookmarks.any?
      errors.add(:base, "Cannot delete movie with associated bookmarks")
      throw(:abort)
    end
  end
end
