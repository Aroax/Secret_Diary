class SecretDiary
  attr_reader :locked

  def initialize(locked=true)
    @locked = locked
  end

  def add_entry
    fail 'Diary locked: cannot add entry' if locked?
  end

  def get_entry
    fail 'Diary locked: cannot get entry' if locked?
  end

  def unlock
    @locked = false if locked?
  end

  private

  def locked?
    @locked = true
  end
end
