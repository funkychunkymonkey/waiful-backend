module Mutations
    class BuyPersonality < BaseMutation
      argument :personality_id, Int, required: true
      type Boolean
      def resolve(input)
        service = PersonalityService.new(context[:user])
        service.buy(input[:personality_id])
      end
    end
  end