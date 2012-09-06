class User
  attr_reader :name, :nickname, :uid, :provider, :image

  def self.load cookie
    Marshal.load(cookie) if cookie
  end

  def dump
    Marshal.dump(self)
  end

  def initialize(oauth)
    info = oauth["user_info"]
    @nickname = info['nickname']
    @name     = info['name']
    @image    = info['image']
    @provider = oauth['provider']
    @uid      = oauth['uid']
  end

  def cid
    @uid + @provider
  end
end
