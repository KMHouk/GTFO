require 'sabre_dev_studio'
require 'sabre_dev_studio-flight'


class PagesController < ApplicationController

    def home
    end

    before_action :require_user, :except => [:index]

    def locations
    end

    def flights
        @city = params[:city]
        @flights = {
          OriginLocation: "NYC",
          Destinations: [{
              Rank: 1,
              Destination: {
                  DestinationLocation: "CHI",
                  CountryCode: "US",
                  CountryName: "United States",
                  RegionName: "North America",
                  MetropolitanAreaName: "Chicago",
                  Links: [{
                      rel: "airportsInCity",
                      href: "https://api.sabre.com/v1/lists/supported/cities/CHI/airports"
                  }],
                  Type: "City"
              }
          }, {
              Rank: 2,
              Destination: {
                  DestinationLocation: "CUN",
                  AirportName: "Cancun",
                  CityName: "Cancun",
                  CountryCode: "MX",
                  CountryName: "Mexico",
                  RegionName: "Latin America",
                  Type: "Airport"
              }
          }, {
              Rank: 3,
              Destination: {
                  DestinationLocation: "LAS",
                  AirportName: "McCarran International Airport",
                  CityName: "Las Vegas",
                  CountryCode: "US",
                  CountryName: "United States",
                  RegionName: "North America",
                  Type: "Airport"
              }
          }, {
              Rank: 4,
              Destination: {
                  DestinationLocation: "ORL",
                  CountryCode: "US",
                  CountryName: "United States",
                  RegionName: "North America",
                  MetropolitanAreaName: "Orlando",
                  Links: [{
                      rel: "airportsInCity",
                      href: "https://api.sabre.com/v1/lists/supported/cities/ORL/airports"
                  }],
                  Type: "City"
              }
          }, {
              Rank: 5,
              Destination: {
                  DestinationLocation: "MIA",
                  AirportName: "Miami International Airport",
                  CityName: "Miami",
                  CountryCode: "US",
                  CountryName: "United States",
                  RegionName: "North America",
                  Type: "Airport"
              }
          }],
          LookBackWeeks: 8,
          Links: [{
              rel: "self",
              href: "https://api.sabre.com/v1/lists/top/destinations?origin=NYC&lookbackweeks=8&topdestinations=5"
          }, {
              rel: "linkTemplate",
              href: "https://api.sabre.com/v1/lists/top/destinations?origin=<origin>&origincountry=<origincountry>&topdestinations=<topdestinations>&destinationtype=<destinationtype>&theme=<theme>&destinationcountry=<destinationcountry>®ion=<region>&lookbackweeks=<lookbackweeks>"
          }]
      }

    end

    def results
    end

end
