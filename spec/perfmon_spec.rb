RSpec.describe Perfmon do
  it "has a version number" do
    expect(Perfmon::VERSION).not_to be nil
  end

  describe 'middleware' do
    before :each do
      Perfmon.configure do |config|
        config.csv_path = '/tmp/'
        config.csv_name = 'test.csv'
      end
      @middleware_instance = Perfmon::Middleware.new(nil)
    end

    it "returns expected csv_path" do
      expect(Perfmon.config.csv_path).to eq('/tmp/')
    end

    it "returns expected csv_name" do
      expect(Perfmon.config.csv_name).to eq('test.csv')
    end

    end
  end
end
