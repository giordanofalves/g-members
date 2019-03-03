class Member < ApplicationRecord
  has_one :website, dependent: :destroy
  has_many :headings, through: :website
  accepts_nested_attributes_for :website

  validates :website, presence: true
end
