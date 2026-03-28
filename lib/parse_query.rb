class ParseQuery
  def initialize(query)
    @query = query
  end

  def run
    key, value = @query.to_s.split('=', 2)
    [ key, value ]
  end
end
