require 'csv'
require 'json'

class Api::V1::PhoneController < ApplicationController
  def csv
    csv_text = File.read('public/table.csv')
    print csv_text
    csv = CSV.parse(csv_text, :headers => true)
    settings_text = File.read('public/configs.json')
    settings = JSON.parse(settings_text)
    csv_text

  end
end
