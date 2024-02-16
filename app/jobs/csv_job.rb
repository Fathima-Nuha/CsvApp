class CsvJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    # This block will be executed after the job is performed
    puts "CsvJob completed for job ID: #{job.job_id}"

    # You can add your logic here to notify the frontend or perform other actions
  end

def perform(csv_data)
  # ActiveRecord::Base.transaction do
    puts "Inside perform method"
  
  csv_data.each do |row|
    # puts "Processing row: #{row}"
    # puts "type of row",row.class

    if row[:dish_name]
    dish_name = row[:dish_name]
    dish_description = row[:dish_description]
    dish_type = row[:dish_type]
    allergens = row[:allergens]
    category = row[:Category]
    price = row[:Price]

  else
    dish_name = row["dish_name"]
    dish_description = row["dish_description"]
    dish_type = row["dish_type"]
    allergens = row["allergens"]
    category = row["Category"]
    begin
  price = Float(row["Price"])
  rescue ArgumentError, TypeError
  next # Skip to the next iteration or add your error-handling logic
  end
    end
    
    

    puts "Creating CsvFileTest with values: #{dish_name}, #{dish_description}, #{dish_type}, #{allergens}, #{category}, #{price}"
    
    CsvFileTest.create!(dish_name: dish_name, dish_description: dish_description, dish_type: dish_type, allergens: allergens, category: category, price: price)
  # end

  # ActiveRecord::Base.connection.commit_db_transaction

  rescue StandardError => e
  # Handle the exception, log it, or re-raise if needed
  Rails.logger.error("Error in transaction: #{e.message}")
  raise e
  end
  
end

 
end

