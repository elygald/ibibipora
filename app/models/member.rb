class Member < ApplicationRecord
    has_many :contacts
    has_many :adderesses

    validates :name, :birth_date, :conversion_time, presence: true

    def full_member 
        self.as_json
    end

    def as_json 
        {
            id: id, 
            name: name, 
            birth_date: birth_date, 
            conversion_time: conversion_time
    }
    end
end
