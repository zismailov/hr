module Users
  class GoogleOauth
    include Interactor

    delegate :data, to: :context

    def call
      context.user = user || create_user

      context.fail!(message: "Ошибка авторизации") unless user
    end

    private

    def user
      user = User.find_by email: email
      update_user(user) if user

      user
    end

    def update_user(user)
      user.update(full_name: full_name, profile_image: profile_image)
    end

    def create_user
      User.create(email: email,
                  full_name: full_name,
                  profile_image: profile_image,
                  password: Devise.friendly_token[0, 20],
                  confirmed_at: Time.zone.now,
                  role: "employee")
    end

    def email
      data["email"]
    end

    def full_name
      data["name"]
    end

    def profile_image
      data["image"]
    end
  end
end
