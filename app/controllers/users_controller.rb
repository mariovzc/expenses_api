class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create, :login]

  api :POST, "/user", "create a new user"
  param :user, Hash, required: true do
    param :email, String, 'User email', required: true, meta: {anything: "unique value"}
    param :password, String, 'User password', required: true
    param :password_confirmation, String, 'user password confirmation', required: true
    param :first_name, String, 'User first name', required: true
    param :last_name, String, 'User last name', required: true
  end
  formats ['json']
  error 400, "Bad request"
  error 500, "Server crashed for some <%= reason %>", meta: {anything: "you can think of"}
  meta :author => {:name => 'Mario Vizcaino', :username => 'mariovzc'}
  description <<-EOS
    ==body 
      {
        "user": {
          "email": "a@a.com",
          "password": "12345678",
          "password_confirmation": "12345678",
          "last_name": "test",
          "first_name": "user"
        }
      }
    ==Response
      {
        "status": 'User created successfully'
      }
  EOS
  def create
    user = User.new(user_params)

    if user.save
      render json: {status: 'User created successfully'}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  api :POST, "/user/login", "Login"
  param :email, String, 'User email', required: true
  param :password, String, 'User password', required: true    
  formats ['json']
  error 400, "Bad request"
  error 500, "Server crashed for some <%= reason %>", meta: {anything: "you can think of"}
  meta :author => {:name => 'Mario Vizcaino', :username => 'mariovzc'}
  description <<-EOS
    ==body 
      {        
        "email": "a@a.com",
        "password": "12345678",        
      }
    ==Response
      {
        "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzA2NjUxNDYsImlzcyI6Imlzc3Vlcl9uYW1lIiwiYXVkIjoiY2xpZW50IiwidXNlcl9pZCI6MX0.JrQK_xt15Lw_3GtzeiwmhVFJxsi27h-URkDqfF2iyrk",
        "user": {
          "full_name": "user test",
          "email": "a@a.com"
        }
      }
  EOS
  def login
    user = User.find_by(email: params[:email].to_s.downcase)
  
    if user && user.authenticate(params[:password])
        auth_token = JsonWebToken.encode({user_id: user.id})
        render json: {
          auth_token: auth_token,
          user: {
            full_name: user.full_name,
            email: user.email
          }
          }, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
