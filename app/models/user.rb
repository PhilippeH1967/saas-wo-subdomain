# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  fullname               :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default("")
#  capacity               :integer
#  cost                   :integer
#  employee               :boolean
#  active                 :boolean
#  image                  :string
#  admin                  :boolean
#  role                   :string           ne peut etre vide - defini le role de l'utilisateur dans l'app. Un seul role possible


class User < ApplicationRecord

  ROLES = %i[user banned admin] # defini les roles possibles pour cancancan

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :fullname, presence: true, length: {maximum: 50}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  has_attached_file :avatar, :style => { :medium => "300x300", :thumb => "100x100"},
                    :default_url => "/assets/default_image.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
