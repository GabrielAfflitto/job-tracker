class Category < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  has_many :jobs
end
