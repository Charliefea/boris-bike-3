require 'van'

describe Van do
  it 'checks if a van is created' do
    expect(Van).to respond_to :new
  end
  it 'responds to #pick_up_bikes_at ' do
    expect(subject).to respond_to(:pick_up_bikes_at).with(1).argument
  end
  it 'responds to #bikes' do
    expect(subject).to respond_to(:bikes)
  end
end
