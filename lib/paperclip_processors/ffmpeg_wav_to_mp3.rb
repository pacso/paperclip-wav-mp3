require 'paperclip'

module Paperclip
  class FfmpegWavToMp3 < Processor

    attr_accessor :file, :params, :format

    def initialize(file, options = {}, attachment = nil)
      super
      @file = file
      @params = options[:params] || '-y -i'
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
      @format = options[:format] || 'mp3'
    end

    def make
      source = @file
      output = Tempfile.new([@basename, @format ? ".#{@format}" : '' ])

      begin
        parameters = [@params, ':source', ':dest'].flatten.compact.join(' ').strip.squeeze(' ')
        Paperclip.run('ffmpeg', parameters, :source => File.expand_path(source.path), :dest => File.expand_path(output.path))
      rescue PaperclipCommandLineError
        raise PaperclipError, "There was an error converting #{@basename} to mp3"
      end

      output
    end
  end
end
