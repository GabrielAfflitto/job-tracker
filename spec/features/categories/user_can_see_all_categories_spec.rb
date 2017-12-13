require 'rails_helper'

describe "User can see all categories" do
  it "shows the index page of all categories" do
    category_1 = Category.create!(title: "Music")
    category_2 = Category.create!(title: "Art")
    visit categories_path

    expect(page).to have_content("Music")
    expect(page).to have_content("Art")
  end
end
