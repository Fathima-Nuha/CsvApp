# spec/controllers/menucard_controller_spec.rb
require 'rails_helper'

RSpec.describe MenucardController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful HTML response' do
      # Creating some sample menu items for testing
      menu_item1 = CsvFileTest.create(dish_name: 'Dish1', dish_description: 'Description1', dish_type: 'Type1', allergens: 'Allergen1', category: 'Category1', price: 'Price1')
      menu_item2 = CsvFileTest.create(dish_name: 'Dish2', dish_description: 'Description2', dish_type: 'Type2', allergens: 'Allergen2', category: 'Category2', price: 'Price2')

      # Simulating HTTP Basic Authentication
      http_login

      # Making a GET request to the index action
      get :index

      # Expecting a successful response
      expect(response).to have_http_status(:ok)

      # Expecting the 'index' template to be rendered
      expect(response).to render_template('index')

      # Expecting the @menu_items instance variable to contain the created menu items
      # expect(assigns(:menu_items)).to match_array([menu_item1, menu_item2])
    end
  end

  private

  def http_login
    # Simulating HTTP Basic Authentication
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('admin', 'password')
  end
end
