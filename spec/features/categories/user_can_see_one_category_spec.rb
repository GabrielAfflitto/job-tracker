require 'rails_helper'

describe "when the user visits a specific category page" do
  it "user sees a list of jobs in the category" do
    company = Company.create!(name: "Cash Money")
    category_1 = Category.create!(title: "Music")
    company.jobs.create!(title: "Rapper", description: "spit hot fyaa", level_of_interest: 4, city: "Denver", category_id: category_1.id)
    company.jobs.create!(title: "Producer", description: "beatz", level_of_interest: 4, city: "Denver", category_id: category_1.id)
    company.jobs.create!(title: "Hype Man", description: "free money", level_of_interest: 4, city: "Denver", category_id: category_1.id)
    visit category_path(category_1)


    expect(category_1.jobs.count).to eq(3)
    expect(page).to have_content("Rapper")
    expect(page).to have_content("Producer")
    expect(page).to have_content("Hype Man")
  end
end
