class Contact < ApplicationRecord
    belongs_to :member
    validates :fhone, presence: true
    before_validation :strip_fhone
    with_options if: :email_is_nil? do |contact|
        contact.validates :email,format: { with: URI::MailTo::EMAIL_REGEXP } 
    end

    def self.contact_by_member_id(member_id)
        Contact.where("member_id= #{member_id}").as_json
    end

    def as_json 
        {
            id: id, 
            fhone: fhone, 
            email: email, 
            member_id: member_id
        }
    end

    def email_is_nil?
        email != nil
    end

    def strip_fhone
        if self.fhone != nil 
           return self.fhone.gsub!(/[^0-9]/, '')
        end
        self.fhone.blank?
    end
end
