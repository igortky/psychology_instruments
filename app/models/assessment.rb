class Assessment < ApplicationRecord
  belongs_to :evaluatee
  belongs_to :instrument
end
