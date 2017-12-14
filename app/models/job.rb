class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments


  def self.jobs_sort
    b = group(:id, :city).order("city ASC")

    # binding.pry
  end
end
