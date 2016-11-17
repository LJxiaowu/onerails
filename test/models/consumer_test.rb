require 'test_helper'

class ConsumerTest < ActiveSupport::TestCase
	def setup
		@consumer = Consumer.new(name: "Example Consumer",email: "consumer@example.com",password: "foobar",password_confirmation: "foobar")

	end

	test "should be valid" do
		assert @consumer.valid?
	end	

	test "name should be valid" do
		@consumer.name = ""
		assert_not @consumer.valid?
	end

	test "email should be valid" do
		@consumer.email = "  "
		assert_not @consumer.valid?
	end

	test "name should not be too long" do
		@consumer.name = "a"*51
		assert_not @consumer.valid?
	end

	test "email should not be too long" do
		@consumer.email = "a"*250 + "@wits.com"
		assert_not @consumer.valid?
	end

	test "email validation should reject invalid addresses" do
		invalid_address = %w[consumer@wits,com consumer_at_foo user.name@wits.]
		invalid_address.each do |noaddress|
			@consumer.email = noaddress
			assert_not @consumer.valid?
		end
	end

	test "email addresses should be unique" do
		duplicate_consumer = @consumer.dup
		@consumer.save
		assert_not duplicate_consumer.valid?
	end

	test "password should be present" do
		@consumer.password = @consumer.password_confirmation = "" * 6
		assert_not @consumer.valid?
	end

	test "password should have a minimum length" do
		@consumer.password = @consumer.password_confirmation = "a"*5
		assert_not @consumer.valid?
	end
  # test "the truth" do
  #   assert true
  # end
end
