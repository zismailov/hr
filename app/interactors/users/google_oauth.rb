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
      user.update(full_name: name, profile_image: image)
    end

    def create_user
      User.create(email: email,
                  full_name: name,
                  profile_image: image,
                  password: Devise.friendly_token[0, 20],
                  confirmed_at: Time.zone.now,
                  role: "employee")
    end

    %w[email name image].each do |meth|
      define_method(meth) { data[meth.to_sym] }
    end
  end
end
