require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'gets a Bike instance' do
    expect(subject.release_bike).not_to eq nil
  end

  describe '#working?' do
    it 'responds to the working? method of the Bike class' do
      expect(subject.release_bike).to respond_to(:working?)
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks something' do
    bike = Bike.new
    # We want to return the bike we dock
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end
# responds to release_bike" do
# expect(subject).to respond_to :release_bike

# it "release_bike returns a bike" do
#  expect(DockingStation.new.release_bike).is_a?(Bike)
