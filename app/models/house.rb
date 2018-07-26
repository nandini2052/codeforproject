class House <ApplicationRecord
validates :apartmentname, presence: true
validates :location, presence: true
validates :Rent, presence: true
validates :Address, presence: true
validates :Description, presence: true, length: { minimum: 5, maximum: 500 }
validates :user_id,presence:true
has_one_attached :photo

belongs_to :user
end
