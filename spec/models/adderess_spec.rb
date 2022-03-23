require 'rails_helper'

RSpec.describe Adderess, type: :model do
  describe "Adderess registration" do
    before(:all) do
      @member = Member.new(name: "membro", birth_date:DateTime.new(1987,9,22), conversion_time: 10 )
      @member.save
    end
    it 'is valid with Street' do 
      adderess = Adderess.new(street: "rua teste", number: "123", district:"Bairro", uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      expect(adderess).to be_valid
    end

    it 'is invalid without Street' do 
      adderess = Adderess.new(street: nil, member_id: @member.id)
      adderess.valid?
      expect(adderess.errors[:street]).to include("Rua não pode estar em Branco")
    end
    
    it 'is valid with number' do 
      adderess = Adderess.new(street: "rua teste", number: "123", district:"Bairro", uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      expect(adderess).to be_valid
    end

    it 'is invalid without number' do 
      adderess = Adderess.new(street: "rua teste", number: nil, district:"Bairro", uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      adderess.valid?
      expect(adderess.errors[:number]).to include("Numero não pode estar em Branco")
    end

    it 'is valid with district' do 
      adderess = Adderess.new(street: "rua teste", number: "123", district:"Bairro", uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      expect(adderess).to be_valid
    end

    it 'is invalid without district' do 
      adderess = Adderess.new(street: "rua teste", number: "123", district: nil, uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      adderess.valid?
      expect(adderess.errors[:district]).to include("Bairro não pode estar em Branco")
    end

    it 'is valid with uf' do 
      adderess = Adderess.new(street: "rua teste", number: "123", district:"Bairro", uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      expect(adderess).to be_valid
    end

    it 'is invalid without uf' do 
      adderess = Adderess.new(street: "rua teste", number: "123", district: "Bairro", uf: nil, country: "Brasil", cep: "00000-000", member_id: @member.id)
      adderess.valid?
      expect(adderess.errors[:uf]).to include("UF não pode estar em Branco")
    end

    it 'is valid with country' do 
      adderess = Adderess.new(street: "rua teste", number: "123", district:"Bairro", uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      expect(adderess).to be_valid
    end

    it 'is invalid without country' do 
      adderess = Adderess.new(street: "rua teste", number: "123", district: "Bairro", uf: "SP", country: nil, cep: "00000-000", member_id: @member.id)
      adderess.valid?
      expect(adderess.errors[:country]).to include("País não pode estar em Branco")
    end

    it 'is valid with cep' do 
      adderess = Adderess.new(street: "rua teste", number: "123", district:"Bairro", uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      expect(adderess).to be_valid
    end

    it 'is invalid without cep' do 
      adderess = Adderess.new(street: "rua teste", number: "123", district: "Bairro", uf: "SP", country: "Brasil", cep: nil, member_id: @member.id)
      adderess.valid?
      expect(adderess.errors[:cep]).to include("CEP não pode estar em Branco")
    end

    it 'return a adderess with full data by member' do
      adderess = Adderess.new(street: "rua teste", number: "123", district:"Bairro", uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      adderess.save
      expect(Adderess.adderess_by_member_id(@member.id)[0].keys).to match_array([:id, :street, :number, :district, :uf, :cep, :country, :member_id, :complement])
      expect(Adderess.adderess_by_member_id(@member.id)[0]).to match({
              id: adderess.id, 
              street:adderess.street, 
              number:adderess.number, 
              district:adderess.district, 
              uf:adderess.uf, 
              cep:adderess.cep, 
              country:adderess.country,
              member_id:adderess.member_id, 
              complement: adderess.complement
      })
    end
    
    it 'return a adderesses with full data by member' do
      adderess =  Adderess.new(street: "rua teste", number: "123", district:"Bairro", uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      adderess2 = Adderess.new(street: "rua teste2", number: "1234", district:"Bairro2", uf: "SP", country: "Brasil", cep: "00000-000", member_id: @member.id)
      adderess.save
      adderess2.save
      expect(Adderess.adderess_by_member_id(@member.id)[0].keys).to match_array([:id, :street, :number, :district, :uf, :cep, :country, :member_id, :complement])
      expect(Adderess.adderess_by_member_id(@member.id)).to match([{
              id: adderess.id, 
              street:adderess.street, 
              number:adderess.number, 
              district:adderess.district, 
              uf:adderess.uf, 
              cep:adderess.cep, 
              country:adderess.country,
              member_id:adderess.member_id, 
              complement: adderess.complement
      }, 
      {
              id: adderess2.id, 
              street:adderess2.street, 
              number:adderess2.number, 
              district:adderess2.district, 
              uf:adderess2.uf, 
              cep:adderess2.cep, 
              country:adderess2.country,
              member_id:adderess2.member_id, 
              complement: adderess2.complement
       }])
    end
  end
end
