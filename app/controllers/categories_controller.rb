class CategoriesController < ApplicationController
  api :GET, "/categories", "Display all the categories"
  formats ['json']
  error :code => 401, :desc => "Unauthorized"
  error 500, "Server crashed for some <%= reason %>", meta: {anything: "you can think of"}
  meta :author => {:name => 'Mario Vizcaino', :username => 'mariovzc'}
  description <<-EOS
    Display all the expenses categories
    ==Response
    
      "list": [
        {
          "name": "Compras"
        }
      ]
    
  EOS
  def index
    @categories = Category.all
  end
end
