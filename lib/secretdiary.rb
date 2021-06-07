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
    fail 'Cannot unlock: diary already unlocked' if !locked?
    @locked = false
  end

  def lock
    fail 'Cannot lock: diary already locked' if locked?
    @locked = true
  end
  
  private

  def locked?
    @locked == true
  end
end
