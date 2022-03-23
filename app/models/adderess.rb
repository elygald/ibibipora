class Adderess < ApplicationRecord
    belongs_to :member
    validates :street, :number, :district, :uf, :country, :cep, presence: true

    def as_json 
        {
            id: id, 
            street:street, 
            number:number, 
            district:district, 
            uf:uf, 
            cep:cep,
            country: country, 
            member_id:member_id, 
            complement:complement
        }
    end

    def self.adderess_by_member_id(member_id)
        Adderess.where("member_id= #{member_id}").as_json
    end
end
