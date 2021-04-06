require 'rails_helper'

RSpec.describe User, type: :model do
  include_examples 'user model common validations', User
end
