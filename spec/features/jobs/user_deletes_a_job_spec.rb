require 'rails_helper'

  describe "User can delete a job" do
    scenario "user can delete a job and redirect to company jobs page" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Web Development")
      company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
      # company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City")

      visit company_jobs_path(company.id)

      expect(current_path).to eq(company_jobs_path(company.id))
      expect(company.jobs.count).to eq(1)

      click_link "Delete"

      expect(current_path).to eq(company_jobs_path(company.id))
      expect(company.jobs.count).to eq(0)
    end
  end
