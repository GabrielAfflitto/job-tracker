require 'rails_helper'

describe "User can edit a job" do
  scenario "user sees the form page for one company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit edit_company_job_path(job.company, job)
    expect(current_path).to eq(edit_company_job_path(job.company, job))


    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "Not fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Lakewood"

    click_button "Update Job"

    expect(current_path).to eq(company_job_path(job.company_id, job.id))
    expect(page).to have_content("Not fun!")
    expect(page).to have_content("80")
    expect(page).to have_content("Lakewood")
    expect(page).to have_content("Developer")
  end
end
