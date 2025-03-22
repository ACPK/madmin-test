class Company < ApplicationRecord
  scope :search, ->(query) {
    where("name LIKE ?", "%#{query}%") # Still safe due to parameterized query
  }

  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }

  validates :name, presence: true


  def to_combobox_display
    name
  end
end
