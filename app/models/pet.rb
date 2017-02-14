class Pet < ApplicationRecord
has_many :favorites

  def self.random
    all.shuffle.pop
  end

end
