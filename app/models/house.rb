class House <ApplicationRecord
validates :location, presence: true
validates :Rent, presence: true
validates :Address, presence: true
validates :Description, presence: true, length: { minimum: 5, maximum: 500 }
validates :seller_id,presence:true

belongs_to :seller
end