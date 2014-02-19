# paperclip-wav-mp3

[![Gem Version](https://badge.fury.io/rb/paperclip-wav-mp3.png)](http://badge.fury.io/rb/paperclip-wav-mp3)

Paperclip processor to convert .wav files to .mp3 using ffmpeg

## Requirements

### Paperclip

This is a processor written for the quite excellent [Paperclip](https://github.com/thoughtbot/paperclip) gem by [ThoughtBot](https://github.com/thoughtbot). You will need to be using Paperclip to use it.

### FFmpeg

FFmpeg is used to convert WAV audio to MP3. It must be installed within your environment and available on your PATH.

#### OS X

If you're developing on OS X, you can install FFmpeg using homebrew:

```
brew install ffmpeg
```

#### Ubuntu Linux

I've not tested on other linux distributions, but you can install FFmpeg and the required codecs with the following:

```
apt-get install ffmpeg libavcodec-extra-52 libavdevice-extra-52 libavfilter-extra-0 libavformat-extra-52 libavutil-extra-49 libpostproc-extra-51 libswscale-extra-0
```

## Installation

This processor is distributed as a gem, which is how it should be used in your app.

Include the gem in your Gemfile:

```
gem 'paperclip-wav-mp3', '~> 0.0'
```

Once you've installed the gem, update the model which uses Paperclip to attach audio to add the processor:

```
class Voicemail < ActiveRecord::Base
  has_attached_file :audio,
                    styles: {
                        mp3: {
                            params: '-y -i',
                            format: 'mp3'
                        }
                    },
                    processors: [:ffmpeg]
end
```

Now, when you attach a new `WAV` audio file, you will also create an `MP3` version.

To generate the missing `MP3` versions for files you've already attached you can use this paperclip rake task:

```
rake paperclip:refresh:missing_styles
```

## Contributing

Feel free to raise any issues you have [here](https://github.com/pacso/paperclip-wav-mp3/issues), or if you're feeling generous then just send a [pull request](https://github.com/pacso/paperclip-wav-mp3/compare/) with your new feature/bugfix.

## License

Copyright (c) 2014 Jon Pascoe.

This is free software and may be redistributed under the terms and conditions of The MIT License (MIT). Full details are available in the LICENSE file.
