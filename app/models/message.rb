class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader

  def to_json
    { name: user.name,
      created_at: created_at,
      body: body,
      image: image.url }
  end
end
