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

  #  TEST no longer valid as bikes is now a private method
  #it "returns docked bike" do
  #   bike = Bike.new
  #   subject.docks_bike(bike)
  #   expect(subject.bikes).to eq bike
  # end

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

  it 'the docking station does not release a broken bike' do
    bike1 = Bike.new
    subject.docks_bike(bike1.broken)
    expect { subject.release_bike}.to raise_error('This bike does not work')
  end

  it 'the docking station will accept broken and working bikes' do
    bikeworking = Bike.new
    expect(subject.docks_bike(bikeworking)).to eq(bikeworking)
    biketobebroken = Bike.new
    expect(subject.docks_bike(biketobebroken.broken)).to eq(biketobebroken)
  end




end
