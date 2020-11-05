require 'byebug'
RSpec.describe Perfmon do
  it "has a version number" do
    expect(Perfmon::VERSION).not_to be nil
  end

  describe 'middleware' do
    before :each do
      @perfmon_instance = Perfmon::Middleware.new(nil)
      @perfmon_instance.configure do |config|
        config.csv_path = '/test/'
        config.csv_name = 'test.csv'
      end
    end

    it "returns expected csv_path" do
      expect(@perfmon_instance.config.csv_path).to eq('/test/')
    end

    it "returns expected csv_name" do
      expect(@perfmon_instance.config.csv_name).to eq('test.csv')
    end
  end
end
