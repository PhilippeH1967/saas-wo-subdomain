require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do # creation d'un user valide
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it "has a unvalid user" do # test si on peut creer un user sans role
    unvalidUser = User.create(first_name: "Andy", last_name: "unvalid", email: "unvalid@gmail.com", fullname: "Andy unvalid")
    expect(unvalidUser).to_not be_valid
  end

  it "has a unvalid user" do # test si on peut creer un user sans mail
    unvalidUser = User.create(first_name: "Andy", last_name: "unvalid", role: "user", fullname: "Andy unvalid")
    expect(unvalidUser).to_not be_valid
  end

  it "has a unvalid user" do # test si on peut creer un user sans fullname
    unvalidUser = User.create(first_name: "Andy", last_name: "unvalid", email: "unvalid@gmail.com", role: "user")
    expect(unvalidUser).to_not be_valid
  end
end