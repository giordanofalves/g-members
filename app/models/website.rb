class Website < ApplicationRecord
  include ExternalData

  belongs_to :member
  has_many :headings, dependent: :destroy

  validates :url, :url_shortened, presence: true

  before_validation :shorten_url
  after_create :map_headings

  def shorten_url
    bitly = Bitly::API.new
    self.url_shortened = bitly.shorten(url)
  end

  def map_headings
    content  = content(url)
    headings = mapper(content)

    self.headings.create(headings)
  end
end
