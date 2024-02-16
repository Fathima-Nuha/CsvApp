# spec/features/csv_upload_spec.rb
require 'rails_helper'


RSpec.feature "CSV Upload", type: :feature, js: true do


  scenario "User uploads a CSV file" do
    # Write your test scenario here
    # For example:
    visit root_path
    click_button 'Upload a File'

    # visit show_upload_path
    attach_file 'csv_file', Rails.root.join('spec/fixtures/username.csv')
    click_button 'Upload'

    # sleep(5)
    # ActiveRecord::Base.transaction do
    perform_enqueued_jobs
        expect(CsvFileTest.count).to eq(12)
      # end
  # ActiveRecord::Base.connection.commit_db_transaction


    # sleep(5)
    
# expect {
#       perform_enqueued_jobs do
#         click_button 'Upload'
#       end
#     }.to change { Sidekiq::Worker.jobs.size }.by(1)
#      .and change { Sidekiq::Worker.jobs.first&.dig("args", 0) }.to(kind_of(Array))
 # expect {
 #      perform_enqueued_jobs do
 #        click_button 'Upload'
 #      end
 #    }.to change { Sidekiq::Worker.jobs.size }.by(1)
 #     .and change { Sidekiq::Worker.jobs.first["args"].first }.to(kind_of(Array))
    # expect(CsvJob).to have_been_enqueued.with(kind_of(Array))
    # expect {
    #   CsvJob.perform_later(csv_data)
    # }.to change(Sidekiq::Queue.new("default"), :size).by(1)
    # expect(page.current_path).to eq(file_upload_path)
    # expect { CsvJob.perform_later }.to change(CsvJob.jobs, :size).by(1)
      # expect { post file_upload_path, params: { csv_file: csv_file } }.to change { enqueued_jobs.size }.by(1)
  
    # sleep(4)
    # expect(CsvFileTest.count).to eq(1)
    # sleep(4)

    # expect(page).to have_content 'CSV file uploaded successfully.'
  end

  scenario "admin clicks menu" do
    # visit root_path
    # click_button 'Go to Menu Page'

    # visit menu_path(username: 'admin', password: 'password')
    visit "http://admin:password@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/menucard/index"
    # sleep(4)
        expect(CsvFileTest.count).to eq(12)


     # Verify that each menu item is displayed correctly
    CsvFileTest.all.each do |item|
      expect(page).to have_content(item.dish_name)
      expect(page).to have_content(item.dish_description)
      expect(page).to have_content("Category : #{item.category}")
      expect(page).to have_content("Type : #{item.dish_type}")
      # expect(page).to have_content("$#{item.price}")
    end
     # expect(page).to have_current_path(menu_path)
end
end

