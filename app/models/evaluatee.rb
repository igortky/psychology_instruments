class Evaluatee < ApplicationRecord
  belongs_to :psychologist

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
end
