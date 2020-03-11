module Mutations
    class RemoveSeries < BaseMutation
      argument :mal_id, Int, required: true
      argument :mal_type, String, required: true
  
      type Boolean
  
      def resolve(input)
        service = SeriesService.new(User.find(1))
        series = service.get_series(input[:mal_type], input[:mal_id])
        service.remove_series(series)
        true
      end
    end
  end