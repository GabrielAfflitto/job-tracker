require 'rails_helper'

describe "User can see all categories" do
  it "shows the index page of all categories" do
    category_1 = Category.create!(title: "Music")
    category_2 = Category.create!(title: "Art")
    visit categories_path

    expect(page).to have_content("Music")
    expect(page).to have_content("Art")
  end

  it "each category has a delete link" do
    category_1 = Category.create!(title: "Music")
    visit categories_path

    expect(page).to have_content("Music")
    expect(Category.count).to eq(1)

    click_link "Delete"

    expect(Category.count).to eq(0)
  end

  it "each category has an edit link" do
    category_1 = Category.create!(title: "Music")
    visit categories_path

    click_link "Edit"

    expect(current_path).to eq(edit_category_path(category_1.id))

    fill_in "category[title]", with: "Construction"
    click_button "Update"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Construction")
  end
end
