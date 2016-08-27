class Vent < ApplicationRecord
  attr_accessor :content

  validates :content, presence: true
end
