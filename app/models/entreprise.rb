# == Schema Information
#
# Table name: entreprises
#
#  id                     :integer          not null, primary key
#  name                   :string           default(""), not null, unique
#  address                :string
#  town                   :string           not null
#  state                  :string
#  country                :string           not null
#  zipcode                :string           not null
#  taxconfig              :integer
#  subdomain              :string           default(""), not null, unique
#  owner_id               :integer          default(""), not null

class Entreprise < ApplicationRecord

  RESTRICTED_SUBDOMAINS = %w(www)

  belongs_to :owner, class_name: 'User', foreign_key: :user_id

 # validates :owner, presence: true
  validates :owner_id, presence: true

  validates :name, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false},
            format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'}
  validates :town, presence: true
  validates :country, presence: true
  validates :zipcode, presence: true

  #validates :subdomain, presence: true,
  #          uniqueness: { case_sensitive: false},
  #          format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'},
  #          exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted'}



      validates :subdomain,
                uniqueness: { case_sensitive: false},
                format: { with: /\A[\w\-]+\Z/i, allow_blank: true, message: 'contains invalid characters'},
                exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted'}

      before_validation :downcase_subdomain


  before_validation :downcase_name

  has_many :users

  private

  def downcase_name
    self.name = name.try(:downcase)
  end

  def downcase_subdomain
    self.subdomain = subdomain.try(:downcase)
  end

end
