# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.create(username: 'ashloop', password: 'hello', email: 'ajhofferber@gmail.com')



require 'nokogiri'
require 'open-uri'
require 'json'

url = "http://www.thegardenhelper.com/hpprofiles.html"
doc = Nokogiri::HTML(open(url))

data =  doc.css('tr').map do |row|

  name = row.css('td')[0].css('strong').text() || row.css('td')[0].css('a').text()
  science = row.css('td')[0].css('em').text()
  name = name.gsub(science, '')
  description = row.css('td').last.text().gsub('See Web Page', "")
  # img = row.css('td')[1]

  { name: name,
    science: science,
    description: description
  }
end


require 'rubygems'
require 'nokogiri'
require 'awesome-print'

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'httparty')
require 'pp'

class HtmlParserIncluded < HTTParty::Parser
  def html
    Nokogiri::HTML(body)
  end
end

class Page
  include HTTParty
  parser HtmlParserIncluded
end

pp Page.get('http://www.thegardenhelper.com/hpprofiles.html')


data[29..138].each do |plant|

Plant.create({  name: plant[:name],
  science: plant[:science],
  description: plant[:description]
})

end

data[29..138].each do |plant|

{  name: plant[:name],
  science: plant[:science],
  description: plant[:description]
}

end
