class SecretDiary
  attr_reader :security

  def initialize
    @security = Diary_Security.new
    @diary = []
  end

  def add_entry(content)
    fail 'Diary locked: cannot add entry' if locked?
    @diary << Diary_Entry.new(content)
  end

  def get_entry
    fail 'Diary locked: cannot get entry' if locked?
    @diary.each do |entry|
      entry.display
    end
  end

  def unlock(password)
    fail 'Cannot unlock: diary already unlocked' if !locked?
    @security.unlock!(password)
  end

  def lock(password)
    fail 'Cannot lock: diary already locked' if locked?
    @security.lock!(password)
  end

  private
  def locked?
    @security.locked == true
  end
end

# Diary_Entry is a component of SecretDiary ("composition")
class Diary_Entry
  attr_reader :date, :content

  def initialize(content="")
    @content = content
    @date = Time.new
  end

  def display
    puts @date
    puts @content
  end
end

class Diary_Security
    attr_reader :locked

    def initialize(lock=true)
      @locked = lock
    end

    def lock!(password)
      fail "wrong password!" if !password?(password)
      @locked = true
    end

    def unlock!(password)
      fail "wrong password!" if !password?(password)
      @locked = false
    end

    private

    PASSWORD = "ruby"

    def password?(password)
      password == PASSWORD
    end

end
