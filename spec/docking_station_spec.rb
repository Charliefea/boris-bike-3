require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  let (:bike) { double( :bike ) }

  it "releases working bikes" do
    workingbike = double("workingbike", :working? => true)
    subject.docks_bike(workingbike)
    workingbike = subject.release_bike
    expect(workingbike).to be_working
  end

  it { is_expected.to respond_to :docks_bike }

  it "docks bike and gives value of bike" do
    docked_bike = subject.docks_bike(bike)
    expect(docked_bike).to eq bike
  end

  it "does not release a bike if there are no bikes available" do
    expect { subject.release_bike }.to raise_error("Sorry there are no bikes")
  end

  it "releases same bike as docked" do
    workingbike = double("workingbike", :working? => true)
    subject.docks_bike(workingbike)
    expect(subject.release_bike).to eq workingbike
  end

  it "doesn't allow more bikes than spaces to dock" do
    subject.capacity.times {subject.docks_bike bike}
    expect { subject.docks_bike(bike)}.to raise_error('There are no spaces left')
  end

  it { is_expected.to respond_to :capacity }

  it 'the capacity of the station can be set by the user' do
    station = DockingStation.new 30
    expect(station.capacity).to eq 30
  end

  it 'the capacity of the station defaults to 20' do
    station = DockingStation.new
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'the docking station does not release a broken bike to a user' do
    brokenbike = double("brokenbike", :working? => false)
    subject.docks_bike(brokenbike)
    expect { subject.release_bike}.to raise_error('This bike does not work')
  end

  it 'the docking station will accept broken and working bikes' do
    workingbike = double("workingbike", :working? => true)
    brokenbike = double("brokenbike", :working? => false)
    expect(subject.docks_bike(workingbike)).to eq(workingbike)
    expect(subject.docks_bike(brokenbike)).to eq(brokenbike)
  end

  it 'responds to  #release_broken_bikes'do
    is_expected.to respond_to :release_broken_bikes
  end

end
