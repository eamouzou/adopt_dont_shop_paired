require 'rails_helper'

RSpec.describe Shelter do
  describe 'relationships' do
    it { should have_many :pets}
  end

  describe 'relationships' do
    it { should have_many :reviews}
  end

  describe '#pets_pending?' do
    it 'returns true if any pets in a shelter are pending adoption' do
      @shelter1 = Shelter.create(name: "Bloke",
      address: "123456 E. Koko St.",
      city: "Aville",
      state: "CO",
      zip: "83504")

      pet1_path = "https://imgix.bustle.com/uploads/getty/2019/11/18/6296727a-d38c-40b4-8ffe-dbec5cd1b289-getty-954967324.jpg?w=1020&h=576&fit=crop&crop=faces&auto=format&q=70"

      @pet1 = Pet.create(image: pet1_path,
      name: "Patra",
      approximate_age: 2,
      sex: "free",
      shelter_id: @shelter1.id,
      shelter_name: @shelter1.name,
      description: "cuddly",
      adoption_status: "adoptable")

      expect(@shelter1.pets_pending?).to eq(false)

      visit "/pets/#{@pet1.id}"
      click_button 'Favorite this pet.'

      visit '/applications/new'

      name = "Heihachi"

      find(:css, "#check-#{@pet1.id}").set(true)

      fill_in "Name", with: name
      fill_in "Address", with: "1234 E. Tokyo St."
      fill_in "City", with: "Los Angeles"
      fill_in "State", with: "CA"
      fill_in "Zip", with: "90224"
      fill_in "Phone Number", with: "435-038-9879";
      fill_in "Describe why you would make a good home:", with: "I love pets."

      click_button "Submit Your Application"

      expect(@shelter1.pets_pending?).to eq(false)
    end
  end
end
