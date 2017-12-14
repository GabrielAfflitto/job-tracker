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

  def self.count_of_jobs_by_level_of_interest
    group(:level_of_interest).order("count_id DESC").count(:id)
  end

  def self.highest_average_level_of_interest_by_company
    company_averages = group(:company_id).average(:level_of_interest).invert.sort
    company_averages[3..5]
  end

end
