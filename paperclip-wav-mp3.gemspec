Gem::Specification.new do |s|
  s.name        = 'paperclip-wav-mp3'
  s.version     = '0.0.1'
  s.author      = 'Jon Pascoe'
  s.email       = 'jon.pascoe@me.com'
  s.homepage    = 'https://github.com/pacso/paperclip-wav-mp3'
  s.summary     = 'Paperclip WAV to MP3 Processor'
  s.description = 'Paperclip processor to convert WAV format audio to MP3 using ffmpeg'

  s.add_dependency "paperclip", "~> 2.3"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.license     = 'MIT'
end
