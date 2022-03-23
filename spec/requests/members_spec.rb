require 'rails_helper'

RSpec.describe "Members", type: :request do
  describe "GET /members" do
    it "returns http success" do
      get "/members"
      expect(response.body).to eq('{"status":"online"}')
      expect(response.status).to eq(200)
    end
  end

  describe "POST /members" do
    context "registration new member" do
      it "returns success" do
        params = {
              name: "Membro", 
              birth_date: DateTime.new(1987,9,22), 
              conversion_time: 3
        }
        post "/members", :params => params 
        expect(response.body).to eq('{"message":"membro cadastrado  com sucesso"}')
        expect(response.status).to eq(201)
      end
      it "returns name required" do
        params = {
              name: nil, 
              birth_date: DateTime.new(1987,9,22), 
              conversion_time: 3
        }
        post "/members", :params => params 
        expect(response.body).to include('{"message":{"name":["Nome não pode estar em Branco"]}}')
        expect(response.status).to eq(400)
      end
      it "returns birth_date required" do
        params = {
              name: "Membro", 
              birth_date: nil, 
              conversion_time: 3
        }
        post "/members", :params => params 
        expect(response.body).to include('{"message":{"birth_date":["Data de Nascimento não pode estar em Branco"]}}')
        expect(response.status).to eq(400)
      end
      it "returns conversion_time required" do
        params = {
              name: "Membro", 
              birth_date: DateTime.new(1987,9,22), 
              conversion_time: nil
        }
        post "/members", :params => params 
        expect(response.body).to include('{"message":{"conversion_time":["Tempo de Conversão não pode estar em Branco"]}}')
        expect(response.status).to eq(400)
      end
      it "returns all fields required" do
        params = {
              name: nil, 
              birth_date: nil, 
              conversion_time: nil
        }
        post "/members", :params => params 
        expect(response.body).to eq('{"message":{"name":["Nome não pode estar em Branco"],"birth_date":["Data de Nascimento não pode estar em Branco"],"conversion_time":["Tempo de Conversão não pode estar em Branco"]}}')
        expect(response.status).to eq(400)
      end
    end
  end
end
