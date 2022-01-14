require 'rspec/retry'

RSpec.configure do |config|
  config.default_retry_count = ENV['TEST_RETRIES'] || 0
  config.verbose_retry = true
end
