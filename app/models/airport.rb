class Airport < ApplicationRecord
  has_and_belongs_to_many :outbound_flights, class_name: "Flight", inverse_of: "from", association_foreign_key: "outbound_id"
  has_and_belongs_to_many :inbound_flights, class_name: "Flight", inverse_of: "to", association_foreign_key: "inbound_id"
  # has_and_belongs_to_many :inbound_flights, class_name: "Flight", inverse_of: "to", foreign_key: "to"
  # has_and_belongs_to_many :outbound_flights, class_name: "Flight", inverse_of: "from", foreign_key: "from"
end
