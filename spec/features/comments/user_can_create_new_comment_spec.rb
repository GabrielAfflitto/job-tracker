require 'rails_helper'

describe "When a user visits a single job page" do
  it "is presented with a form to create a comment about job" do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "Web Development")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category_1)
    visit company_job_path(company, company.jobs.first)
    # binding.pry
    expect(page).to have_content("Leave a Comment")
    fill_in "comment[content]", with: "This is awesome"
    click_on "Create Comment"

    expect(current_path).to eq(company_job_path(company, company.jobs.first))
    expect(page).to have_content("This is awesome")
  end
end
