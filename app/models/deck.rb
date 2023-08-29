class Deck < ApplicationRecord
  include Level
  has_many :questions
end
