class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  def pets_pending?
    pets.any? do |pet|
      pet.adoption_status == "pending"
    end
  end

  def average_rating
    reviews.average(:rating).to_f
  end

  def pet_count
    pets.count
  end

end
