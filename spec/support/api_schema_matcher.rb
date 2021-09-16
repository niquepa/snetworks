RSpec::Matchers.define :match_response_schema do |schema|
  match do |response|
    schema_path = "#{Dir.pwd}/spec/support/schemas/#{schema}.json"
    JSON::Validator.validate!(schema_path, response.body, strict: true)
  end
end