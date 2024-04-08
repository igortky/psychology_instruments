class Psychologist < ApplicationRecord
  has_many :evaluatees

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
