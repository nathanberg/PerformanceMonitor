module Perfmon
  class Config
    attr_writer :csv_path, :csv_name

    def csv_path
      @csv_path ||= '/tmp/'
    end

    def csv_name
      @csv_name ||= 'perfmon.csv'
    end
  end
end