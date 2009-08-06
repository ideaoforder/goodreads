require 'rubygems'
require 'httparty'

module Goodreads
  include HTTParty
  
  @defaults = YAML::load(File.open("#{RAILS_ROOT}/config/goodreads.yml")) if File.exist? "#{RAILS_ROOT}/config/goodreads.yml" 
  base_uri 'http://www.goodreads.com'
  default_params :key => @defaults[:api_key] if (@defaults and @defaults[:api_key])
  format :xml

  @@user_id = @defaults[:user_id] if (@defaults and @defaults[:user_id])

  # page:  1
  # per_page: 1-200
  # shelf:  read, currently-reading, to-read, etc
  # key: Needed for private profiles. Different from developer key, and is unique to each member. Obtained from the member's rss link on the "my books page" or the lookup via email method.
  # order: a, d
  # sort: position, votes, rating, shelves, avg_rating, isbn, comments, author, title, notes, cover, review, random, date_read, year_pub, date_added, num_ratings, date_updated
  def self.reviews(opts={})
    defaults = {:page => 1, :per_page => 10, :shelf => 'read', :sort => 'date_read', :order => 'd'}
    opts = defaults.merge(opts)
    user_id = opts[:user_id] || @@user_id
    opts.delete(:user_id)
    result = self.get("/review/list_rss/#{user_id}", :query => opts)
    result["rss"]["channel"]["item"].map { |data| Goodreads::Review.new(data) }
    # now...what to do with these...
  end
  
  class Review
    attr_accessor :book_small_image_url, 
                  :user_date_created, 
                  :user_shelves, 
                  :average_rating, 
                  :book_image_url, 
                  :book_medium_image_url, 
                  :user_read_at, 
                  :guid, 
                  :pubDate, 
                  :title, 
                  :author_name, 
                  :isbn, 
                  :book_published,
                  :user_review,
                  :user_name,
                  :user_date_added,
                  :link,
                  :book_id,
                  :book_description,
                  :description,
                  :book,
                  :book_large_image_url,
                  :user_rating
    def initialize(data)
      data.each do |k, v|
        if v and v.is_a? String
          val = v.gsub(/\n/, '').gsub(/\t/, '').strip 
        else
          val = v
        end
        send(:"#{k}=", val)
      end
    end
  end
end
