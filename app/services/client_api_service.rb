require 'faraday'

class ClientApiService

  TIMEOUT = 2

  def initialize(url:)
    @conn = Faraday.new(
      url: url,
      headers: {'Content-Type' => 'application/json'},
    )
    @conn.options.timeout = TIMEOUT
  end

  def get(endpoint:)
    begin
      response = @conn.get endpoint
      JSON.parse(response.body)
    rescue JSON::ParserError
      "An invalid JSON was received: '#{response&.body}'"
    rescue Faraday::TimeoutError, Faraday::ConnectionFailed, Faraday::ConnectionError
      "The API is taking too much time to reply back"
    end
  end
end