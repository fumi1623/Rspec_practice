class User < ApplicationRecord
  # validates :age, length: { minimum: 1}
  validates :name, :email, presence: true
end
