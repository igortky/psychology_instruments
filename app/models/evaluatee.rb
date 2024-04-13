class Evaluatee < ApplicationRecord
  belongs_to :psychologist

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, format: { with: /\A[0-9]+\z/ }
end
