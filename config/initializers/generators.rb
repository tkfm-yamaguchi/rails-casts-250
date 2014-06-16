Rails.application.configure do
  config.generators do |gen|
    gen.test_framework :rspec, fixture: true
    gen.fixture_replacement :factory_girl,
      dir: "spec/support/factories"

    gen.javascript_engine :coffee
    gen.stylesheet_engine :sass
    gen.template_engine   :haml
  end
end
