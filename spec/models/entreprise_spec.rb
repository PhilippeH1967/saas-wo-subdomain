require 'rails_helper'


RSpec.describe Entreprise, type: :model do

  it "has a valid factory" do # creation d'une entreprise valide
    entreprise = FactoryBot.create(:entreprises)
    expect(entreprise).to be_valid
  end


  it "has a valid subdomain" do # test si on peut creer une entreprise sans respect des conditons du subdomain
    unvalidUser = Entreprise.create(name: "entreprises",  street: "street", zipcode: "h12345", country: "canada", subdomain: "tester@12", owner_id: 1)
    expect(unvalidUser).to_not be_valid
  end

  describe "validations" do
    it { should validate_presence_of :owner_id }
    it { should validate_presence_of :name }

    it { should allow_value("defacto").for(:subdomain) }
    it { should_not allow_value("www").for(:subdomain) }
    it { should_not allow_value(".test").for(:subdomain) }
    it { should_not allow_value("test/").for(:subdomain) }

    it "should validate case non valid characters" do
      unvalidUser = Entreprise.create(name: "entreprise122",  street: "street", zipcode: "h12345", country: "canada", subdomain: "tester@12", owner_id: 1)
      expect(unvalidUser).to_not be_valid
    end

    it "should validate case insensitive uniqueness" do
      create(:entreprises, name: "defacto")
      expect(build(:entreprises, name: "DeFacto")).to_not be_valid
    end

    it "should validate case insensitive uniqueness" do
      create(:entreprises, subdomain: "defacto")
      expect(build(:entreprises, subdomain: "Defacto")).to_not be_valid
    end

    it "downcases subdomains" do
      account = create(:entreprises, subdomain: "Defactor")
      expect(account.subdomain).to eq("defactor")
    end
  end
end
