# class Api::V1::UsersSerializer
#   include JSONAPI::Serializer
#   #data, type, id ya estan incluidos con el gem!!!
#   attributes :email, :api_key
# type and data are in the wrong order. Search how can I change that to use the gem?
# end

class Api::V1::UsersSerializer
  def self.formated_data(user)
    {
      data: {
        type: "users",
        id: user.id,
        attributes: {
          email: user.email,
          api_key: user.api_key
        }
      }
    }
  end
end
