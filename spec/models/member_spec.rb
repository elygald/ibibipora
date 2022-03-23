require 'rails_helper'

RSpec.describe Member, type: :model do
  it 'is valid with name, birth_date date and conversion_time' do 
    member = Member.new(name: "membro", birth_date:DateTime.new(1987,9,22), conversion_time: 10 )
    expect(member).to be_valid
  end

  it 'is invalid without name' do 
    member = Member.new(name: nil, birth_date:DateTime.new(1987,9,22), conversion_time: 10 )
    member.valid?
    expect(member.errors[:name]).to include("Nome não pode estar em Branco")
  end

  it 'is invalid without birth_date' do 
    member = Member.new(name: "membro", birth_date:nil, conversion_time: 10 )
    member.valid?
    expect(member.errors[:birth_date]).to include("Data de Nascimento não pode estar em Branco")
  end

  it 'is invalid without conversion_time' do 
    member = Member.new(name: "membro", birth_date:DateTime.new(1987,9,22), conversion_time: nil )
    member.valid?
    expect(member.errors[:conversion_time]).to include("Tempo de Conversão não pode estar em Branco")
  end

  it 'return a member with full data' do
    member = Member.new(name: "membro", birth_date:DateTime.new(1987,9,22), conversion_time: 10) 
    expect(member.full_member.keys).to match_array([:id, :name, :birth_date, :conversion_time])
    expect(member.full_member).to match({
            id: member.id, 
            name: member.name, 
            birth_date: member.birth_date, 
            conversion_time: member.conversion_time
    })
  end
end
