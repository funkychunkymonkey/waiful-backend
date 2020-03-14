module Mutations
    class AddPersonality < BaseMutation
      argument :personality_id, Int, required: true
      argument :waifu_id, Int, required: true
      type Boolean
      def resolve(input)
        service = PersonalityService.new(context[:user])
        service.add(input[:waifu_id], input[:personality_id])
      end
    end
  end