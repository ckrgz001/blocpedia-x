class User < ApplicationRecord

  before_save { self.email = email.downcase if email.present? }
  has_many :wikis

  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :authentication_keys => [:username]
  

  
  
  validates :username, presence: true, uniqueness: { case_sensitive: false },   
  length: { minimum: 3, maximum: 25 }

  validates :email, uniqueness: { case_sensitive: false }

end
