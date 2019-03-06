class Heading < ApplicationRecord
  belongs_to :website

  validates :content, :heading_type, presence: true

  enum heading_type: %i[h1 h2 h3]
end
