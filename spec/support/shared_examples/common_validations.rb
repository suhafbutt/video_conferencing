RSpec.shared_examples 'user model common validations' do |klass|

  describe "Validations" do
    it " is valid if all the required attributes are present" do
      expect(FactoryBot.build(klass.name.underscore.to_sym)).to be_valid
    end

    it " is not valid if time zone is not present" do
      expect(FactoryBot.build(klass.name.underscore.to_sym, time_zone: nil)).to_not be_valid
    end

    it " is not valid if first name is not present" do
      expect(FactoryBot.build(klass.name.underscore.to_sym, first_name: nil)).to_not be_valid
    end

    it " is not valid if last name is not present" do
      expect(FactoryBot.build(klass.name.underscore.to_sym, last_name: nil)).to_not be_valid
    end

    it " is not valid if email is not present" do
      expect(FactoryBot.build(klass.name.underscore.to_sym, email: nil)).to_not be_valid
    end

    it " is not valid if type is not present" do
      expect(FactoryBot.build(klass.name.underscore.to_sym, type: nil)).to_not be_valid
    end

    it " is valid if all the required attributes are present" do
      expect(FactoryBot.build(klass.name.underscore.to_sym)).to be_valid
    end
  end
end