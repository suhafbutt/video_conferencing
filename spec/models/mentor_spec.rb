require 'rails_helper'

RSpec.describe Mentor, type: :model do
  include_examples 'user model common validations', Mentor
end
