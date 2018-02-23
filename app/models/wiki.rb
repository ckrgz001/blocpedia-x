class Wiki < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true 
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 300 }

    def markdown
      Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end
  

end
