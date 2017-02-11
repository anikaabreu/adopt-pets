json.extract! pet, :id, :name, :image, :species, :breed, :gender, :age, :size, :description, :created_at, :updated_at
json.url pet_url(pet, format: :json)