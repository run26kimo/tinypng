require 'tempfile'

require 'tinypng/client'

module TinyPNG
  class Image
    def initialize params={}
      @params = params
    end

    def input
      @params['input']
    end

    def output
      @params['output']
    end

    def to_file(full_path)

      # Create a new file and write to it  
      File.open(full_path, 'w') do |file|  
        begin
          image_response = TinyPNG::Client.get(output['url'])
        rescue => e
          raise Exception.new("Network error: #{e}")
        end

        file.write image_response
        file.rewind
      end

    end
  end
end
