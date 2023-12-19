class FilesController < ApplicationController

  require 'csv'
  def index

  end

  def create
    uploaded_file = params[:csv_file]
    csv_data = CSV.read(uploaded_file.path,headers: true)

    rows = csv_data.map(&:to_h)
    # puts "rows here",rows
      CsvJob.perform_later(rows)


      # Process or save the data as needed
  
  end

  def file_upload
    
  end


end
