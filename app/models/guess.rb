class Guess < ApplicationRecord
  belongs_to :post
  validates :guess_text, presence: true

  def score_up
    self.score += 1
  end
  def score_down
    self.score -= 1
  end
end
