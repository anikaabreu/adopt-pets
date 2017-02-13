class User < ApplicationRecord
  belongs_to :favorite
  has_secure_password
end
