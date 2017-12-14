require 'rails_helper'

describe "when a user visits a company show page" do
  it "is presented with a form to create a contact" do
    company = Company.create!(name: "ESPN")
    visit company_jobs_path(company)

    expect(page).to have_content("Enter your contact information")
    fill_in "contact[name]", with: "Gabriel Afflitto"
    fill_in "contact[position]", with: "Manager"
    fill_in "contact[email]", with: "YOYO1@gmail.com"
    click_on "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Gabriel Afflitto")
    expect(page).to have_content("Manager")
    expect(page).to have_content("YOYO1@gmail.com")
  end
end
