
class MenucardController < ApplicationController

  http_basic_authenticate_with name: 'admin', password: 'password'

  def index
    @menu_items = CsvFileTest.find_each(batch_size: 10)
  end
end
