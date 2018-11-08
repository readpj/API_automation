Given(/^I want to create a dish$/) do
  @dish = Dishes.new
  @json = @dish.to_json
end

When(/^I create a dish$/) do
  @response = send_get('/api/dishes')
end

Then(/^A dish is created$/) do
  p @response.code
  expect(JSON.parse(@response.body)['name']).to eq(@dish.name)
  expect(JSON.parse(@response.body)['price']).to eq(@dish.price)
  # p JSON.parse(@response.body)['name']

end

When(/^I create a new dish$/) do
  @dish = Dishes.new
  @json = @dish.to_json
  @response = send_post('/api/dishes', @json)
  @id = JSON.parse(@response.body)['id']
end

Then(/^A new dish is created$/) do
  send_get("/api/dishes/#{@id}")
  p @response.code
  p JSON.parse(@response.body)['id']
  expect(JSON.parse(@response.body)['id']).to eq(@id)
end

When(/^I delete a dish$/) do
  @response = send_post('/api/dishes', @json)
  @id = JSON.parse(@response.body)['id']
  @response = send_delete('/api/dishes', @id)

end

Then(/^the dish is deleted$/) do
  p @response.code
  p @response.message
end

And(/^the dish cannot be found$/) do
  @response = send_get("/api/dishes/#{@id}")
  p @response.code
  p @response.message
  expect(JSON.parse(@response.body)['error']['code']).to eq("MODEL_NOT_FOUND")
  p JSON.parse(@response.body)['error']['code']
end

When(/^I find the dish$/) do
  @response = send_get_with_parameter('/api/dishes/count?where=', "%7B%22name%22%3A%22#{@dish.name}%22%7D")
end

Then(/^the dishes are found$/) do
  p JSON.parse(@response.body)['count']

end