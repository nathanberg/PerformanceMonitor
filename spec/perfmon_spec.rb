require 'tempfile'
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

    describe '#call' do
      before(:each) do
        @tmp_file = Tempfile.new
        before :each do
          Perfmon.configure do |config|
            config.csv_path = File.dirname(@tmp_file.path)
            config.csv_name = File.basename(@tmp_file.path)
          end
          @middleware_instance = Perfmon::Middleware.new(nil)
        end
      end

      after(:each) do
        File.delete(@tmp_file.path)
      end

      xit 'writes a line to csv' do
        Perfmon::Middleware.call(test)
        filename = "somefile.txt"
        count = IO.readlines(filename).size
      end

      xit 'has correct time' do

      end
    end
  end
end
