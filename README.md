# OpenBD

An API client library for openBD API, written in Ruby.

Please refer to the following for more information

[openBD](https://openbd.jp/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_bd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install open_bd

## Usage

```ruby
client = OpenBD::Client.new
# Pass the value of isbn to isbns
res = client.search(isbns: [])

res.empty?
res.body
res.status

# [OpenBD::Resource]
res.resources.each do |resource|
  res.author
  res.content
  res.content_detail
  res.contributors       # [OpenBD::Contributor]
  res.cover_image
  res.hastameshiyomi
  res.height
  res.isbn
  res.main_title
  res.paper_size
  res.paper_size_detail
  res.publisher
  res.release_date
  res.sub_title
  res.table_of_contents
  res.title
  res.width
end

# Get openbd coverage
client.coverage
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
