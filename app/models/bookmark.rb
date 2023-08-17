class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  has_many :signets, dependent: :restrict_with_error
  has_many :listes, through: :signets
  validates :movie, uniqueness: { scope: :liste, message: "Ce film est déjà dans cette liste." }
  validates :comment, length: { minimum: 6 }


  validates_presence_of :movie
  validates_presence_of :list
  validates_uniqueness_of :movie, scope: :list
  before_destroy :check_dependent_films

  private

  def check_dependent_movies
    if movie.bookmarks.count == 1
      errors.add(:base, "Ce film est lié à un signet au moins. Impossible de le supprimer.")
      throw(:abort)
    end
  end
end
