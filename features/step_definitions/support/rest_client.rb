def send_post(path, json)
  host = TestConfig['host']
  url = URI(host + path)
  http = Net::HTTP.new(url.host, url.port = 3000)
  request = Net::HTTP::Post.new(url)
  request['Content-Type'] = 'application/json'
  # @request = Net::HTTP::Post.new(@path, init_header = {'Content-Type' => 'application/json'})
  request.body = json
  response = http.request(request)
end

def send_delete(path, id)
  host = TestConfig['host']
  url = URI(host + path + '/' + id)
  http = Net::HTTP.new(url.host, url.port = 3000)
  request = Net::HTTP::Delete.new(url)
  request['Content-Type'] = 'application/json'
  response = http.request(request)
end

def send_get (path)
  # url = URI('http://localhost:3000/api/dishes')
  host = TestConfig['host']
  url = URI(host + path)
  http = Net::HTTP.new(url.host, url.port = 3000)
  request = Net::HTTP::Get.new(url)
  request['Content-Type'] = 'application/json'
  # @request = Net::HTTP::Post.new(@path, init_header = {'Content-Type' => 'application/json'})
  response = http.request(request)
end

def send_request(connection, request)
  retry_attempts = 5
  retry_interval = 2
  while retry_attempts > 0 do
    begin
      response = connection.request(request)
      retry_attempts = 0
      return response
    rescue Errno::ECONNRESET => error
      retry_attempts = retry_attempts - 1
      print "\n " + retry_attempts.to_s + " attempts remaining to connect to host\n"
      sleep(retry_interval)
    rescue Net::ReadTimeout => error
      retry_attempts = retry_attempts - 1
      print "\n " + retry_attempts.to_s + " attempts remaining to connect to host\n"
      sleep(retry_interval)
    end
  end
end