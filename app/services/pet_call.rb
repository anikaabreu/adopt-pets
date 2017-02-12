
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


# run get_pets only if pets is nil
# pets ||= get_pets

# examine data

# keys_of_interest = [
#   ['id'],
#   ['shelterId'],
#   ['name'],
#   ['animal'],
#   ['breeds', 'breed'],
#   ['age'],
#   ['sex'],
#   ['description'],
#   ['media', 'photos', 'photo', '__content__'],
# ]
# max_key_count = keys_of_interest.map {|array| array.length}.max
#
# example.fetch('description') or "None"
#
# def flatten(data, index, keys_of_interest)
#   [
#     keys_of_interest,
#     data
#   ].zip([
#     "data",
#     "keys_of_interest",
#   ]).each do |arg, message|
#       raise ArgumentError.new [message, "is nil"].join(' ') if arg.nil?
#     end
#
#   # return top level data
#   if index == 0
#     datum = data.first
#     return keys_of_interest.map do |keys|
#       column = keys.slice(0, 1)
#       column.map {|key| datum.fetch(key) or 'None'}
#     end.flatten
#   end
#
#   # handle child data
#   flattened_data = keys_of_interest.zip(data).map do |keys, parent_value|
#     column = keys.slice(index, 1)
#     unless (column.nil? or column.empty?)
#       # slice the array where the index of parent_value is
#       # side effect of full flatten is that arrays are lost
#       begin
#         column.map {|key| parent_value.fetch(key) or 'None'}
#       rescue TypeError  # parent_value is an array and not a hash
#         column.map do |key|
#           parent_value.map do |value|
#             value.fetch(key) or 'None'
#           end
#         end.flatten  # removes nested mapping
#       end
#     else
#       [parent_value]
#     end
#   end.compact # removes nils
#
#   # do not do a full flatten, flatten by one level a la Python's itertools.chain
#   # to preserve arrays of hashes from parent data
#   # taken from my stackoverflow answer at http://stackoverflow.com/a/37922795/1913726
#   items = []
#   flattened_data.each do |item|
#     item.each do |item_|
#       items << item_
#      end
#   end
#   items
# end
#
# new_keys = [
#   ['id'],
#   ['shelterId'],
#   ['name'],
#   ['animal'],
#   ['breed'],
#   ['age'],
#   ['sex'],
#   ['description'],
#   ['pnt', 'fpm', 'x', 'pn', 't']
# ].flatten  # defined nested just for housekeeping purposes
#
# pet_data = pets.map do |pet|
#   parents = flatten([pet], 0, keys_of_interest)  # pet has to be conained in an iterable
#   children = flatten(parents, 1, keys_of_interest)
#   # let the max of nested key count drive the depth of iterations
#   (2...max_key_count).each do |i|
#     children = flatten(children, i, keys_of_interest)  # children value is overwritten with each iteration
#   end
#   raise RuntimeError "keys and value lengths are not equal" unless new_keys.length == children.length
#   # zip keys and values together into a Hash
#   Hash[new_keys.zip(children)]
# end
#
# # print random samples of pets
# pet_samples = []
# sample_size = 10
# until pet_samples.length == sample_size
#     pet_samples << pet_data.sample
#     pet_samples.uniq!
# end
# raise RuntimeError("sample length not as expected") unless pet_samples.uniq.length == sample_size
#
# divider = Array.new(20, '-').join
# pet_samples.each do |item|
#   puts item
#   puts divider
# end
