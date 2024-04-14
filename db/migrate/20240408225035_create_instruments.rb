class CreateInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments do |t|
      t.string :name
      t.jsonb :questions, default: [], null: false
      t.string :status, default: 'open'

      t.timestamps
    end
  end
end
