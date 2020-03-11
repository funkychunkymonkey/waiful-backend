module Mutations
    class SellWaifu < BaseMutation
      argument :mal_id, Int, required: true
      type Int
      def resolve(input)
        service = WaifuService.new(context[:user])
        service.sell_waifu(Waifu.where(mal_id: input[:mal_id]).first)
      end
    end
  end