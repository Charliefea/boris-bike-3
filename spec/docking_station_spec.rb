require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = Bike.new
    subject.docks_bike(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to :docks_bike }

  it "docks bike and gives value of bike" do
    bike = Bike.new
    docked_bike = subject.docks_bike(bike)
    expect(docked_bike).to eq bike
  end

  it "returns docked bike and gives value of last docked bike" do
    bike = Bike.new
    subject.docks_bike(bike)
    expect(subject.bikes[-1]).to eq bike
  end

  it "does not release a bike if there are no bikes available" do
    expect { subject.release_bike }.to raise_error("Sorry there are no bikes")
  end

  it "releases same bike as docked" do
    bike = Bike.new
    subject.docks_bike(bike)
    expect(subject.release_bike).to eq bike
  end

  it "doesn't allow more bikes than spaces to dock" do
    subject.capacity.times {subject.docks_bike Bike.new}
    bikeextra = Bike.new
    expect { subject.docks_bike(bikeextra)}.to raise_error('There are no spaces left')
  end

  it { is_expected.to respond_to :capacity }

  it 'the capacity of the station can be set by the user' do
    station = DockingStation.new 30
    expect(station.capacity).to eq 30
  end

  it 'the capacity of the station defaults to 20' do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

end
