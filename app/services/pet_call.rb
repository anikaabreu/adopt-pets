
class PetCall
  attr_reader :pets, :random_pet, :name, :image, :description, :sex, :age, :breed, :size

  def self.call(opts)
    url = "http://api.petfinder.com/shelter.getPets?key=b1f6d031483e188e4aa40fe8f98aa1bd&count=500"
    location = "&id=#{self.location_id[opts[:location]]}"
    url << location
    response = HTTParty.get(url)
    response["petfinder"]["pets"]["pet"].map do |pet|
      new(pet)
    end
  end

  def initialize(pet)
    @name = pet["name"]
    @image = pet["media"]["photos"]["photo"][2]["__content__"]
    @description = pet["description"]
    @sex = pet["sex"]
    @age = pet["age"]
    begin
      @breed = pet["breeds"]["breed"].join(' ')
    rescue NoMethodError
      @breed = pet["breeds"]["breed"]
    end
    @size = pet["size"]

    self.save
  end

  def save
    Pet.find_or_create_by(self.instance_values)
  end

  def self.location_id
    {
      "Broward" => 'FL252',
      "Chicago" => 'CHI313'
    }
  end

  def self.random(opts)
    url = "http://api.petfinder.com/shelter.getPets?key=b1f6d031483e188e4aa40fe8f98aa1bd&count=500"
    location = "&id=#{self.location_id[opts[:location]]}"
    url << location
    response = HTTParty.get(url)
    new(response["petfinder"]["pets"]["pet"].shuffle.pop)
  end
end
