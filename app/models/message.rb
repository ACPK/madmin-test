class Message < ApplicationRecord
  encrypts :content
  encrypts :encrypted_user_id, deterministic: true
  
  has_rich_text :content, encrypted: true

  validates :title, presence: true, length: { maximum: 255 }
end
