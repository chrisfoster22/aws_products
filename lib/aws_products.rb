require "./aws_products/version"
require "time"
require "uri"
require 'base64'
require 'OpenSSL'
require 'httparty'


module AwsProducts

    ENDPOINT = "webservices.amazon.com"
    REQUEST_URI = "/onca/xml"

    def self.search(keywords, options = {})

        aws_secret_key = ENV["AWS_SECRET_ACCESS_KEY"] || options[:aws_secret_key]

      params = {
        "Service" => "AWSECommerceService",
        "Operation" => "ItemSearch",
        "AWSAccessKeyId" => ENV["AWS_ACCESS_KEY_ID"] || options[:aws_access_key_id],
        "AssociateTag" => ENV["AWS_ASSOCIATE_TAG"] || options[:associate_tag],
        "Keywords" => keywords,
        "SearchIndex" => options[:category]|| "",
        "ItemPage" => options[:page] || "1",
        "ResponseGroup" => options[:response_group] || "Images,ItemAttributes,Offers"
      }

      self.generate_request_url(params, aws_secret_key)
  end

  def self.generate_request_url(params, secret)

        params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")
        # Generate the canonical query
        canonical_query_string = params.sort.collect do |key, value|
          [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
        end.join('&')

        # Generate the string to be signed
        string_to_sign = "GET\n#{ENDPOINT}\n#{REQUEST_URI}\n#{canonical_query_string}"

        # Generate the signature required by the Product Advertising API
        signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secret, string_to_sign)).strip()

        # Generate the signed URL
        request_url = "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"

        self.get_results(request_url)
    end

    def self.get_results(url)
        results = HTTParty.get(url)
        results["ItemSearchResponse"]["Items"]["Item"]
    end

end
