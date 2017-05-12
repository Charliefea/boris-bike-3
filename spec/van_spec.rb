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
  it 'should return an array when #bikes is called' do
    expect(subject.bikes.class).to eq Array
  end
  it 'should store the bike which was picked up in bikes' do
    bike = Bike.new
    station = DockingStation.new
    van = subject
    station.docks_bike(bike)
    van.pick_up_bikes_at(station)
    expect(van.bikes[-1]).to eq bike
  end
end
