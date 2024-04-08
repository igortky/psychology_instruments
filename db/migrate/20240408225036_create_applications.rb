class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :status
      t.references :psychologists, null: false, foreign_key: true
      t.references :evaluatees, null: false, foreign_key: true
      t.references :instruments, null: false, foreign_key: true

      t.timestamps
    end
  end
end
