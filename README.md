# AwsProducts

This gem allows you to easily search the Amazon Product Advertising API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aws_products'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws_products

## Usage

Make sure you have signed up for the Product Advertising API: https://affiliate-program.amazon.com/gp/advertising/api/detail/main.html

Once signed up, you should get a secret access key, an access key ID, and an associate tag. to streamline the use of this gem, save those three keys as environment variables: 

```
AWS_SECRET_ACCESS_KEY
AWS_ACCESS_KEY_ID
AWS_ASSOCIATE_TAG
```

This is not a necessary step, but eliminates the need to manually pass them into the search method. If you do not have these environment variables, you will need to pass in your keys like so: 

```ruby
AwsProducts.search(keyword, aws_secret_access_key: "2293r0q43j0923429", aws_access_key_id: "23r94r439i2", aws_associate_tag: "my-cool-site-20")
```

You can then use the search like this: 

```ruby
AwsProducts.search(keyword)
```

This will run a search for your keyword on all of Amazon.

You can also pass options to the method. Try out `category, response_group,` and `page`. `category` refers to the SearchIndex from the Amazon product API documentation (http://docs.aws.amazon.com/AWSECommerceService/latest/DG/localevalues.html). `response_group` refers to the ResponseGroup field from the API documentation (http://docs.aws.amazon.com/AWSECommerceService/latest/DG/CHAP_ResponseGroupsList.html).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/aws_products. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

