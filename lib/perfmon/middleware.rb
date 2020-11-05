module Perfmon
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      # Time request came
      initial_request = Time.now
      request = Rack::Request.new(env)
      # Request URI
      request_uri = request.path
      # Parameters
      params = request.params.map{ |key, value| key + "==>" + value }.join('; ')
      # PID
      pid = Process.pid
      # Thread ID
      tid = Thread.current.object_id
      status, headers, response = @app.call(env)
      response_time = Time.now
      # Response Body MD%
      response_md5 = Digest::MD5.hexdigest(response.body)
      # Time spent
      total_time = response_time - initial_request

      CSV.open('/tmp/test.csv', "a+") do |csv|
        if File.empty?('/tmp/test.csv')
          csv << ["Initial Request Time", "Request Completed Time", "Time Taken", "Request URI", 'Request GET Params', 'PID', 'TID', 'MD5']
        end
        csv << [initial_request, response_time, total_time, request_uri, params, pid, tid, response_md5]
      end

      return status, headers, response
    end
  end
end
