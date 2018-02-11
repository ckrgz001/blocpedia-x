class Wiki < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 300 }
end
=======
  validates :user_id, presence: true 
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 300 }
  end
>>>>>>> User-One-to-Many
