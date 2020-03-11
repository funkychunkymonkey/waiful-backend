module Mutations
    class FavoriteWaifu < BaseMutation
      argument :mal_id, Int, required: true
      type Boolean
      def resolve(input)
        service = WaifuService.new(context[:user])
        waifu = service.favorite_waifu({mal_id: input[:mal_id]})
        true
      end
    end
  end