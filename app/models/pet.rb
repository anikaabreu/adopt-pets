class Pet < ApplicationRecord
  belongs_to :favorite

  def self.random
    all.shuffle.pop
  end

end
