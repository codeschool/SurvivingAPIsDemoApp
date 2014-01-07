module RSpecRequestHelpers
  def json(body)
    JSON.parse(body, symbolize_names: true)
  end
end

RSpec.configure do |config|
  config.include RSpecRequestHelpers, type: :request
end

