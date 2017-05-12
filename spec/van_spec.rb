require 'van'

describe Van do
  it 'checks if a van is created' do
    expect(Van).to respond_to :new
  end
  it 'responds to #pick_up ' do
    expect(subject).to respond_to :pick_up
  end
end
