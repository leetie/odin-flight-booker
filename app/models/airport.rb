class Airport < ApplicationRecord
  has_and_belongs_to_many :outbound_flights, class_name: "Flight", inverse_of: "from"
  has_and_belongs_to_many :inbound_flights, class_name: "Flight", inverse_of: "to" 
  # has_and_belongs_to_many :inbound_flights, class_name: "Flight", inverse_of: "to", foreign_key: "to"
  # has_and_belongs_to_many :outbound_flights, class_name: "Flight", inverse_of: "from", foreign_key: "from"
end
