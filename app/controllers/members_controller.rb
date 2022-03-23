require 'json'
class MembersController < ApplicationController
    def index 
        #byebug
        render json: { status: 'online' }, status: 200
    end
    def create
       member = Member.new(name: params["name"], birth_date: params["birth_date"], conversion_time: params["conversion_time"])
       if member.save 
            render json: { message: 'membro cadastrado  com sucesso' }, status: 201
       else
            render json: { message: member.errors }, status: 400
       end
    end
end
