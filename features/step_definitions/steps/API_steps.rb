Given(/^I want to create a dish$/) do
  dish = Dishes.new
  @json = dish.to_json
end

When(/^I create a dish$/) do
  @response = send_get('/api/dishes')
end

Then(/^A dish is created$/) do
  p @response.code
  # expect(JSON.parse(@response.body)['name']).to eq('Pie')
  # p JSON.parse(@response.body)['name']

end

When(/^I create a new dish$/) do
  @response = send_post('/api/dishes', @json)
  @id = JSON.parse(@response.body)['id']
end

Then(/^A new dish is created$/) do
  send_get("/api/dishes/#{@id}")
  p @response.code
  p JSON.parse(@response.body)['id']
  expect(JSON.parse(@response.body)['id']).to eq(@id)
end