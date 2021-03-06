class JobsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new
  end

  def new
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @job = @company.jobs.new
  end

  def create
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      flash[:error] = @job.errors.full_messages
      render :new
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @comment = @job.comments.new
    # binding.pry
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @job.update(job_params)

    redirect_to company_job_path
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @job.destroy

    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
