class RedisStorage
  def self.get_value(key)
    $redis.get(key)
  end

  def self.set_value(key, value)
    $redis.set(key, value)
  end
end
