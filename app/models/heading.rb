class Heading < ApplicationRecord
  belongs_to :website

  validates :content, :heading_type, presence: true
end
