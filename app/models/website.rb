class Website < ApplicationRecord
  include ExternalData

  belongs_to :member
  has_many :headings, dependent: :destroy

  before_create :shorten_url
  before_create :map_headings

  def shorten_url
    bitly = Bitly::API.new
    self.url_shortened = bitly.shorten(url)
  end

  def map_headings
    content  = content(url)
    headings = mapper(content)

    self.headings.build(headings)
  end
end
