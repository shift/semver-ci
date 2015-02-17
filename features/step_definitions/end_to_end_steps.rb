require "json_spec/cucumber"
require "open-uri"

Given(/^the web server is running$/) do
  true
end

When(/^I request the page with version '(.*)' and a '(.*)' increment$/) do |arg1, arg2|
  @resp = JSON.parse(open("http://localhost:8000/?version=#{arg1}&incr=#{arg2}").read)
end

Then(/^the text that comes back contains '(.*)'$/) do |arg1|
  expect(@resp['version']).to eq(arg1)
end
