module Perfmon
  class Config
    attr_accessor :csv_path, :csv_name


    def initialize
      @csv_name = 'perfmon.csv'
      @csv_path = '/tmp/'
    end
  end
end