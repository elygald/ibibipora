require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "contact registration" do
    before(:all) do
      @member = Member.new(name: "membro", birth_date:DateTime.new(1987,9,22), conversion_time: 10 )
      @member.save
    end
    it 'is valid with telefone' do 
      contact = Contact.new(fhone: "(11)99999-9999", member_id: @member.id)
      expect(contact).to be_valid
    end

    it 'is invalid without telefone' do 
      contact = Contact.new(fhone: nil, member_id: @member.id)
      contact.valid?
      expect(contact.errors[:fhone]).to include("telefone não pode estar em Branco")
    end
    
    it 'is valid with email' do 
      contact = Contact.new(fhone: "(11)99999-9999", member_id: @member.id, email: "teste@test.com.br")
      expect(contact).to be_valid
    end

    it 'is invalid without email' do 
      contact = Contact.new(fhone: "(11)99999-9999", member_id: @member.id, email: "dsfdfsdfsdfsdfsefd")
      contact.valid?
      expect(contact.errors[:email]).to include("email invalido")
    end

    it 'return a contact with full data by member' do
      contact = Contact.new(fhone: "(11)99999-9999", member_id: @member.id)
      contact.save
      expect(Contact.contact_by_member_id(@member.id)[0].keys).to match_array([:id, :fhone, :email, :member_id])
      expect(Contact.contact_by_member_id(@member.id)[0]).to match({
              id: contact.id, 
              fhone: contact.fhone, 
              email: contact.email,
              member_id: contact.member_id
      })
    end
    
    it 'return a contacts with full data by member' do
      contact = Contact.new(fhone: "(11)99999-9999", member_id: @member.id)
      contact2 = Contact.new(fhone: "(11)99999-9998", member_id: @member.id)
      contact.save
      contact2.save
      expect(Contact.contact_by_member_id(@member.id)[0].keys).to match_array([:id, :fhone, :email, :member_id])
      expect(Contact.contact_by_member_id(@member.id)).to match([{
        id: contact.id, 
        fhone: contact.fhone, 
        email: contact.email,
        member_id: contact.member_id
      },
      {
        id: contact2.id, 
        fhone: contact2.fhone, 
        email: contact2.email,
        member_id: contact2.member_id
      }])
    end
  end

end
