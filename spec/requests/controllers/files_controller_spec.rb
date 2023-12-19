# spec/requests/controllers/files_controller_spec.rb
require 'rails_helper'

RSpec.describe "FilesController", type: :request do
  include ActiveJob::TestHelper # Include the module here

  describe 'POST #create' do
    it 'queues CsvJob with correct data' do
      csv_file_path = Rails.root.join('spec/fixtures/username.csv')
      csv_file = fixture_file_upload(csv_file_path, 'text/csv')

      # Print information for debugging
      puts "Before post: CsvFileTest count = #{CsvFileTest.count}"

      expect { post file_upload_path, params: { csv_file: csv_file } }.to change { enqueued_jobs.size }.by(1)

      # Print information for debugging
      puts "After post: CsvFileTest count = #{CsvFileTest.count}"

      perform_enqueued_jobs

      # Add more assertions or debug statements as needed

      # expect(CsvJob).to have_been_enqueued.with(csv_data)
    end
  end
end
