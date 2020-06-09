class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.date :date
      t.integer :to_id
      t.integer :from_id
    end
  end
end
