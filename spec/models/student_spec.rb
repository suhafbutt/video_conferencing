require 'rails_helper'

RSpec.describe Student, type: :model do
  include_examples 'user model common validations', Mentor
end
