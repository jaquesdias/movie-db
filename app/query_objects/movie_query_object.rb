class MovieQueryObject
  def initialize(params)
    @params = params
  end

  def execute
    movies = Movie

    if filter[:where].present?
      movies = movies.where(filter[:where])
    end

    if filter[:like].any?
      movies = movies.where(filter[:like])
    end

    movies.order(:title).page(@params[:page])
  end

  private

  def filter
    filters = {}
    like = []

    if @params[:category_id].present?
      filters.merge!(category_id: @params[:category_id])
    end

    if @params[:rating].present?
      filters.merge!(rating_average: @params[:rating])
    end

    if @params[:q].present?
      like = ['movies.title ILIKE ? ', "%#{@params[:q]}%"]
    end

    { where: filters, like: like }
  end
end
