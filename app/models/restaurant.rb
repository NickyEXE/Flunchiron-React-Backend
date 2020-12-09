class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def self.get_restaurants_from_yelp(location)
    res = YelpSearch.new(location)
    businesses = res.results["businesses"]
    businesses.each{|business| create_from_yelp_data(business)}
  end

  def self.create_from_yelp_data(business)
    create(
      name: business["name"],
      url: business["url"],
      lat: business["coordinates"]["latitude"],
      long: business["coordinates"]["longitude"],
      image_url: business["image_url"],
      address: business["location"]["display_address"].join(", "),
      kind_of_food: business["categories"].map{|item| item["title"]}.join(", ")
    )
  end

  def self.kinds_of_food
    pluck(:kind_of_food).map{|string| string.split(", ")}.flatten.uniq.sort
  end

end
