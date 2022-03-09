require_relative '../corrector'

describe Corrector do
  before :each do
    @corrector = Corrector.new
  end

  it 'Creates an instance of Corrector' do
    expect(@corrector).to be_a Corrector
  end

  it 'Should cut a name larger than 10 letters' do
    new_name = @corrector.correct_name('schifffahrtsgesellschaft')
    expect(new_name).to eq 'Schifffahr'
  end

  it 'Should capitalize the first letter' do
    new_name = @corrector.correct_name('schifffahrtsgesellschaft')
    expect(new_name).to eq 'Schifffahr'
  end
end
