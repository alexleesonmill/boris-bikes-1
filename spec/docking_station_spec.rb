require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe DockingStation do
  let(:bike) { double :bike }
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    allow(bike).to receive(:working?).and_return(true)
    subject.dock bike
    expect(subject.release_bike).to respond_to(:working?)
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'docks something' do
    expect(subject.dock(bike)).to be_instance_of Array
  end

  it 'returns docked bikes' do
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe '#release_bike' do
    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes' do
      # Let's not dock a bike first:
      # remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when the dock is full' do
      # bike = Bike.new
      # subject.dock(bike)
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error 'Dock Full'
    end
  end

  it 'defaults to a specified capacity' do
    expect(subject.capacity).to eq(20)
  end

  it 'allows the controller to set their own capacity if required' do
    station = DockingStation.new(30)
    expect(station.capacity).not_to eq 20
  end

  describe 'the user reporting a broken bike' do
    it { is_expected.to respond_to :broken }

    it 'allows the user to report the bike is broken' do
      station = DockingStation.new
      station.dock bike
      expect(station.broken).to eq station.broken_bikes
    end
  end
end
# it "responds to release_bike" do
# expect(subject).to respond_to :release_bike
