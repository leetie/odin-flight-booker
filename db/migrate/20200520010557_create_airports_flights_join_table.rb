class CreateAirportsFlightsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :airports_flights, id: false do |t|
      t.integer :outbound_id
      t.integer :inbound_id
      t.belongs_to :flight
      t.belongs_to :airport
      
      # t.integer :from_id
      # t.integer :to_id
      # t.belongs_to :flight
      # t.belongs_to :airport
      # add_index :airports_flights, :from_id
      # add_index :airports_flights, :to_id
    end
  end
end
