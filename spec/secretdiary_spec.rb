require 'secretdiary'
describe SecretDiary do
  let(:diary) { SecretDiary.new }
  let(:content) { "Hello, world!" }
  let(:password) {"ruby"}

  it 'is a diary object' do
    expect(SecretDiary).to respond_to(:new)
  end

  it 'starts locked' do
    expect(diary.security.locked).to equal(true)
  end

  context 'when locked' do
    it 'raises an error when trying to add an entry' do
      expect{ subject.add_entry(content) }.to raise_error 'Diary locked: cannot add entry'
    end

    it 'raises an error when trying to get an entry' do
      expect{ subject.get_entry }.to raise_error 'Diary locked: cannot get entry'
    end

    it 'can be unlocked' do
      diary.unlock(password)
      expect(diary.security.locked).to eq(false)
    end

    it 'raises an error if you try to lock' do
      expect{ subject.lock(password) }.to raise_error 'Cannot lock: diary already locked'
    end

    it 'raises an error if you do not supply the correct password when locking/unlocking' do
      expect{ subject.unlock("apple") }.to raise_error "wrong password!"
    end
  end

  context 'when unlocked' do
    it 'raises an error if you try to unlock' do
      subject.unlock(password)
      expect{ subject.unlock(password) }.to raise_error 'Cannot unlock: diary already unlocked'
    end

    # it 'can add an entry' do
    #
    # end
  end

end
