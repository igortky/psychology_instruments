# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Psychologist.create!(
  first_name: 'Soren', last_name: 'Kierkegaard', email: 'admin@email.com',
  password: 'password', password_confirmation: 'password'
)

Instrument.create(
  name: 'Sample Instrument',
  questions: 5.times.map do
    {
      title: 'Sample Question',
      options: 4.times.map do |i|
        {
          name: "Option #{i + 1}",
          score: 3 - i
        }
      end
    }
  end
)
