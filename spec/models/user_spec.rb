require 'spec_helper'

describe User do
	before do
    @user = User.new(email: "user@example.com",
                     password: "foobar")
  end

  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
end
