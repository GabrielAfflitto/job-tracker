require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.create!(name: "ESPN")
        contact = Contact.new(position: "Manager", email: "YOYO1@gmail.com", company: company)
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        company = Company.create!(name: "ESPN")
        contact = Contact.new(name: "Gabriel Afflitto", email: "YOYO1@gmail.com", company: company)
        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        company = Company.create!(name: "ESPN")
        contact = Contact.new(name: "Gabriel Afflitto", position: "Manager", company: company)
        expect(contact).to be_invalid
      end

      it "is invalid without a company" do
        company = Company.create!(name: "ESPN")
        contact = Contact.new(name: "Gabriel Afflitto", position: "Manager", email: "YOYO1@gmail.com")
        expect(contact).to be_invalid
      end
    end
  end
end
