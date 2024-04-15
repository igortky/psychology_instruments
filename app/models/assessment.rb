class Assessment < ApplicationRecord
  belongs_to :evaluatee
  belongs_to :instrument
  belongs_to :psychologist
  delegate :questions, to: :instrument
  delegate :name, to: :instrument

  def score
    {
      'Option 1' => 3,
      'Option 2' => 2,
      'Option 3' => 1,
      'Option 4' => 0
    }
  end

  def total_score
    return if responses.empty?

    total_score = 0
    responses.each do |option|
      total_score += score[option] if score[option]
    end
    total_score
  end
end
