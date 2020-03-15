module Mutations
    class AddBonus < BaseMutation
      argument :km, Int, required: true
      type Int
      def resolve(input)
        service = BonusService.new(context[:user])
        service.add_bonus(input[:km])
        input[:km]
      end
    end
  end