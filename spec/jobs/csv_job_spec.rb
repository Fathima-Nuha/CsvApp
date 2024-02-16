require 'rails_helper'



RSpec.describe CsvJob, type: :job do
  include ActiveJob::TestHelper

  let(:csv_data) do
    [
      { "dish_name" => 'Dish1', "dish_description"=> 'Description1', "dish_type" => 'Type11', "allergens" => 'Allergen1', 'Category' => 'Category1', 'Price' => 'Price1' },
      # Add more sample data as needed
    ]
  end

  let(:csv_file_test_data) do
    [
    FactoryBot.attributes_for(:csv_file_test),
    FactoryBot.attributes_for(:csv_file_test),
    FactoryBot.attributes_for(:csv_file_test), #pass it as an array
    ]
  end



  it 'creates CsvFileTest records' do
    perform_enqueued_jobs do
      puts "here is enqueued jobs", csv_file_test_data 

    tests = CsvFileTest.create(dish_name: "dish_name", dish_description: "dish_description", dish_type: "dish_type", allergens: "allergens", category: "category", price: "12.2")

      CsvJob.perform_later(csv_file_test_data) 
      
    end
  end

it 'has price as float values not strings' do


  csv_file_test_data.each do |data|
  expect(data[:Price]).to be_a(Float)

  end


end





end
