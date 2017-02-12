class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :image
      t.string :breed
      t.string :sex
      t.string :age
      t.string :size
      t.string :description

      t.timestamps
    end
  end
end
