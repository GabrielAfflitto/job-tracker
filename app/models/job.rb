class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.order_by_city
    order(:city)
  end

  def self.order_by_level_of_interest
    order(:level_of_interest)
  end

end
