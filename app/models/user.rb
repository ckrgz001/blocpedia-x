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

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def gravatar_index(user, options = { size: 80 })
  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  size = options[:size]
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  image_tag(gravatar_url, alt: user.username)
end

end
