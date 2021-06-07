require 'secretdiary'
describe SecretDiary do
  it 'is a diary object' do
    expect(SecretDiary).to respond_to(:new)
  end

  it 'starts locked' do
    expect(subject.locked).to equal(true)
  end

  context 'while locked' do
    it 'raises an error when trying to add an entry' do
      expect{ subject.add_entry }.to raise_error 'Diary locked: cannot add entry'
    end

    it 'raises an error when trying to get an entry' do
      expect{ subject.get_entry }.to raise_error 'Diary locked: cannot get entry'
    end

    it 'can be unlocked' do
      subject.unlock
      expect(subject.locked).to eq(false)
    end
  end


end
