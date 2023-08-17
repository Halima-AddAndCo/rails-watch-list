class Signet < ApplicationRecord
  belongs_to :film
  belongs_to :liste

  validates :film_id, presence: true
  validates :liste_id, presence: true

  validates :film, uniqueness: { scope: :liste, message: "Ce film est déjà dans cette liste." }
  validates :comment, length: { minimum: 6 }
end
