module Mutations
    class BuyWaifu < BaseMutation
        argument :waifu_mal_id, Int, required: true
        argument :series_mal_type, String, required: true
        argument :series_mal_id, Int, required: true
      type Types::WaifuType
      def resolve(input)
        series_service = SeriesService.new(context[:user])
        series = series_service.get_series(input[:series_mal_type], input[:series_mal_id])
        
        waifu_service = WaifuService.new(context[:user])
        waifu = waifu_service.get_waifu(series, input[:waifu_mal_id])
        waifu = waifu_service.buy_waifu(waifu)

        if(waifu === false)
          GraphQL::ExecutionError.new("Insufficient gems.")
        else
          waifu
        end
      end
    end
  end