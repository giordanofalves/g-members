# frozen_string_literal: true

module ExternalData
  extend ActiveSupport::Concern

  def content(url)
    Net::HTTP.get(URI.parse(url))
  end

  def mapper(content)
    doc = Nokogiri::HTML(content)

    doc.css('h1, h2, h3').map do |h|
      { heading_type: h.name, content: h.text.strip }
    end
  end
end
