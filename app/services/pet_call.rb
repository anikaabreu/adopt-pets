
class PetCall
  attr_reader :pets, :random_pet, :name, :image, :description, :sex, :age, :breed, :size

  def self.call(opts)
    key = ENV['PET_KEY']
    url = "http://api.petfinder.com/shelter.getPets?key=#{key}&count=500"
    location = "&id=#{self.location_id[opts[:location]]}"
    url << location
    response = HTTParty.get(url)
    response["petfinder"]["pets"]["pet"].map do |pet|
      new(pet)
    end
  end

  def initialize(pet)
    @name = pet["name"]
    @image = pet["media"]["photos"]["photo"][2]["__content__"] if pet["media"]
    @description = pet["description"]
    @sex = pet["sex"]
    @age = pet["age"]
    begin
      @breed = pet["breeds"]["breed"].join(' ')
    rescue NoMethodError
      @breed = pet["breeds"]["breed"]
    end
    @size = pet["size"]
    save
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
    key = ENV['PET_KEY']
    url = "http://api.petfinder.com/shelter.getPets?key=#{key}&count=500"
    location = "&id=#{self.location_id[opts[:location]]}"
    url << location
    response = HTTParty.get(url)
    new(response["petfinder"]["pets"]["pet"].shuffle.pop)
  end
end
