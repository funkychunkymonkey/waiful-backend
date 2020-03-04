module Mutations
  class CreateUser < BaseMutation
    argument :email, String, required: true

    type Types::UserType

    def resolve(email:)
      User.create!(
        email: email
      )
    end
  end
end