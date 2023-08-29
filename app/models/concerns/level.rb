module Level
  extend ActiveSupport::Concern

  included do
    enum :level, {
      beginner: 1,
      intermediate: 2,
      advanced: 3
    }, default: :beginner
  end
end
