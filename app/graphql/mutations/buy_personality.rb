module Mutations
    class BuyPersonality < BaseMutation
      argument :personality_id, Int, required: true
      argument :price, Int, required: false
      type Boolean
      def resolve(input)
        service = PersonalityService.new(context[:user])
        service.buy(input[:personality_id], input[:price])
      end
    end
  end