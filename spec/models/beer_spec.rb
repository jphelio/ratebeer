require 'spec_helper'

describe Beer do
  it "has a name and style" do
    beer=Beer.new name:"isoIII", style:"lager"

    beer.name.should=="isoIII"
    beer.style.should=="lager"
  end

  it "fail if no name" do
    beer=Beer.create style:"lager"

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "fail if no style" do
    beer=Beer.create name:"isoIII"

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

end
