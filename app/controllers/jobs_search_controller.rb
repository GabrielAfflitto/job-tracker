class JobsSearchController < ApplicationController

  def index
    @jobs = Job.all
    binding.pry
    # if params[:sort] = "location"

  end
end
