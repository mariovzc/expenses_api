class ExpensesTypesController < ApplicationController
  api :GET, "/expenses_types", "Display all the expenses types"
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
    @expenses_types = ExpenseType.all
  end

end
