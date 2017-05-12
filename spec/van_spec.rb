require 'van'

describe Van do
  it 'checks if a van is created' do
    expect(Van).to respond_to :new
  end

  
end
