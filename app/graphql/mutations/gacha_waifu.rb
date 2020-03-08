module Mutations
    class GachaWaifu < BaseMutation
      type Types::WaifuType
      def resolve
        service = WaifuService.new(User.find(1))
        waifu = service.gacha
        if(waifu === false)
          GraphQL::ExecutionError.new("Insufficient gems.")
        else
          waifu
        end
      end
    end
  end