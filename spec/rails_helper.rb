# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.default_cassette_options = { re_record_interval: 7.days }
  config.configure_rspec_metadata!
end

def user_data
  @user_1 = {:name=>"Alec", :email=>"amk@gmail.com", :google_id=>"123345", :auth_token=>"hjgu.734764g34734h347hdf7d7d6444"}
  @user_2 = {:name=>"Steve", :email=>"kcl@gmail.com", :google_id=>"123645", :auth_token=>"sdrf.1244h2342454kj5l5k6"}
  @user_3 = {:name=>"George", :email=>"mjm@gmail.com", :google_id=>"123745", :auth_token=>"drsr.1244hjgjh234959525l5k6"}
  @user_4 = {:name=>"Ted", :email=>"tct@gmail.com", :google_id=>"123945", :auth_token=>"plrd.1244hjgjh234959525l5k6"}

  @users = [@user_1, @user_2, @user_3, @user_4]

  @users.each do |user|
    DraftMadnessService.new.register_user(user)
  end
end

def too_many_participants
  @user_1 = {:name=>"Alec", :email=>"amk@gmail.com", :google_id=>"123345", :auth_token=>"hjgu.734764g34734h347hdf7d7d6444"}
  @user_2 = {:name=>"Steve", :email=>"kcl@gmail.com", :google_id=>"123645", :auth_token=>"sdrf.1244h2342454kj5l5k6"}
  @user_3 = {:name=>"George", :email=>"mjm@gmail.com", :google_id=>"123745", :auth_token=>"drsr.1244hjgjh234959525l5k6"}
  @user_4 = {:name=>"Ted", :email=>"tct@gmail.com", :google_id=>"123945", :auth_token=>"plrd.1244hjgjh234959525l5k6"}
  @user_5 = {:name=>"Katie", :email=>"123@gmail.com", :google_id=>"123045", :auth_token=>"hjgp.734764g34734h347hdf7d7d6444"}
  @user_6 = {:name=>"Sally", :email=>"4576@gmail.com", :google_id=>"123605", :auth_token=>"serf.1244h2342454kj5l5k6"}
  @user_7 = {:name=>"Georgia", :email=>"kdr@gmail.com", :google_id=>"123740", :auth_token=>"drsr.124hhjgjh234959525l5k6"}
  @user_8 = {:name=>"Tina", :email=>"ppp@gmail.com", :google_id=>"023945", :auth_token=>"plrd.1244hjgjh234959525p5k6"}
  @user_9 = {:name=>"Karen", :email=>"2many@gmail.com", :google_id=>"223945", :auth_token=>"nono.1244hjgjh234959525p5k6"}
end

def params
  @complete_params = {"authenticity_token"=>"MGTxscYtvcBohWxdibkiMyhAQSKbfF_8yJEqvjtTV5jKii-M-Z1PLTbbCuN4mpZplPM1WBT4YD_aicnZHONIxQ", 
    "name"=>"Katie", 
    "participants"=>["1"], 
    "day(1i)"=>"2023", 
    "day(2i)"=>"6", 
    "day(3i)"=>"5", 
    "time(1i)"=>"2023", 
    "time(2i)"=>"6", 
    "time(3i)"=>"5", 
    "time(4i)"=>"21", 
    "time(5i)"=>"04", 
    "commit"=>"Submit", 
    "controller"=>"leagues", 
    "action"=>"create"}

  @incomplete_params = {"authenticity_token"=>"MGTxscYtvcBohWxdibkiMyhAQSKbfF_8yJEqvjtTV5jKii-M-Z1PLTbbCuN4mpZplPM1WBT4YD_aicnZHONIxQ", 
    "name"=>"", 
    "participants"=>["1"], 
    "day(1i)"=>"2023", 
    "day(2i)"=>"6", 
    "day(3i)"=>"5", 
    "time(1i)"=>"2023", 
    "time(2i)"=>"6", 
    "time(3i)"=>"5", 
    "time(4i)"=>"21", 
    "time(5i)"=>"04", 
    "commit"=>"Submit", 
    "controller"=>"leagues", 
    "action"=>"create"}
end