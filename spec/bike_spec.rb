require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it 'if  the bike is not working then return false' do
    bike = subject.broken
    expect(subject.working?).to eq false
  end

end
