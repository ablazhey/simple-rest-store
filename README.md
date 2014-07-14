
# StudyTube

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'StudyTube'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install StudyTube

## Usage

TODO: Write usage instructions here

                              Initalize:

                               @foo = StudyTube::StudyTube.new(TYPE, FILE_PATH)
                                
                                  TYPE takes values 'REST' or 'FILES' or 'RestFiles'
                                  FILE_PATH takes values 'file.txt'

                              @foo.create(key, value) - create rows 

                              @foo.update(key, value) - update rows

                              @foo.delete(key)  - delete rows

                              @foo.show(key)

                              @foo.list

                                key - String
                                value - String     

## Contributing

1. Fork it ( https://github.com/[my-github-username]/StudyTube/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
=======
simple-rest-store
=================

