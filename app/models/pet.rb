class Pet < ApplicationRecord

  def self.random
    all.shuffle.pop
  end

end
