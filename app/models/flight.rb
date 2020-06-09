class Flight < ApplicationRecord
  has_and_belongs_to_many :from, class_name: "Airport", inverse_of: "outbound_flight", foreign_key: "outbound_id"
  has_and_belongs_to_many :to, class_name: "Airport", inverse_of: "inbound_flight", foreign_key: "inbound_id"
end
