class JobsSearchController < ApplicationController

  def index
    @jobs = Job.all
    if params[:sort] == "location"
      @jobs = Job.order_by_city
    elsif params[:sort] == "interest"
      @jobs = Job.order_by_level_of_interest
    elsif params[:location]
      @jobs = Job.where(city: params[:location])
    else
      @jobs = Job.all
    end
  end

  def dashboard
    @jobs = Job.all
  end
end
