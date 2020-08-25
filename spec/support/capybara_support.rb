Capybara.configure do |config|
  config.test_id = "data-test-id"
end
Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: %w[
      headless disable-gpu no-sandbox
      --window-size=1920,1080
      --enable-features=NetworkService,NetworkServiceInProcess
    ]

  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
