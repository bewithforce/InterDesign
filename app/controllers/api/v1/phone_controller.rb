require 'csv'
require 'json'

class Api::V1::PhoneController < ApplicationController
  def csv
    csv_text = File.read('public/table.csv')
    csv = CSV.parse(csv_text, :headers => true)
    settings_text = File.read('public/configs.json')
    settings = JSON.parse(settings_text)


  end
end
