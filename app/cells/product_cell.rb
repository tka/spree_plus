class ProductCell < Cell::Rails
  before_filter :set_view_paths
  
  def labels(args)
    @labels = args[:product].labels
    render
  end

  def links(args)
    @links = args[:product].links
    render
  end

  private
  def set_view_paths
    self.view_paths << File.join( File.dirname(__FILE__) )
  end
end
