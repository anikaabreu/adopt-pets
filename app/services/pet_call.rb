
class PetCall
  attr_reader :pets, :random_pet

  def initialize
    url = "http://api.petfinder.com/shelter.getPets?key=b1f6d031483e188e4aa40fe8f98aa1bd&id=FL252&count=500"
    response = HTTParty.get(url)
    @pets = response["petfinder"]["pets"]["pet"]
  end

  # def get_random_pet
  #   @random_pet = @pets.shuffle.pop
  #   @random_pet
  # end

  def image
    images = @random_pet["media"]["photos"]["photo"]
    pet_image = images[2]["__content__"]
    pet_image
  end

  def name
    pet_name = @random_pet["name"]
    pet_name
  end

  def description
    description = @random_pet["description"]
    description
  end

  def sex
    sex = @random_pet["sex"]
    sex
  end

  def age
    age = @random_pet["age"]
    age
  end

  def breed
    breeds = @random_pet["breeds"]
    breed = breeds["breed"]
    breed
  end

  def size
    size = @random_pet["size"]
    size
  end
end
