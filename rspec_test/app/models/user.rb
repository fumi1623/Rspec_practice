class User < ApplicationRecord
  validates :age, length: { minimum: 1}
end
