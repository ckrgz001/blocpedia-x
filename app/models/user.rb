class User < ApplicationRecord

  before_save { self.email = email.downcase if email.present? }
  has_many :wikis

  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :standard
  end

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

  def current_user_downgrade_wikis
    privatewikis = self.wikis.where(private: true)
    privatewikis.each do |privatewiki|
      privatewiki.update_attribute(:private, false)
    end
  end

end
