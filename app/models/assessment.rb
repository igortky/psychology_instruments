class Assessment < ApplicationRecord
  belongs_to :evaluatee
  belongs_to :instrument
  belongs_to :psychologist
  delegate :questions, to: :instrument
end
