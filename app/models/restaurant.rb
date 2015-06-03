class Restaurant < ActiveRecord::Base

	belongs_to :user
	has_many :pizzas

	validates :name, presence: true, uniqueness: true
    validates :address, presence: true

end
