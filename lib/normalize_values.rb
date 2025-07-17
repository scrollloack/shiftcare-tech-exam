class NormalizeValues
  def initialize(key, value)
    @key = key
    @value = value
  end

  def run
    case @key
    when 'id'
      @value.to_i
    else
      @value.to_s
    end
  end
end
