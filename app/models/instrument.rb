class Instrument < ApplicationRecord
  has_many :assessments
  has_many :evaluatees, through: :assessments
end
