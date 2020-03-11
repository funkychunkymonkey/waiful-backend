module Mutations
    class AddSeries < BaseMutation
      argument :mal_id, Int, required: true
      argument :mal_type, String, required: true
  
      type Types::SeriesType
  
      def resolve(input)
        service = SeriesService.new(User.find(1))
        series = service.get_series(input[:mal_type], input[:mal_id])
        service.add_series(series)
        series
      end
    end
  end