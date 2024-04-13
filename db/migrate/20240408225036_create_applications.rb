class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :assessments do |t|
      t.string :status
      t.references :psychologist, null: false, foreign_key: true
      t.references :evaluatee, null: false, foreign_key: true
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
