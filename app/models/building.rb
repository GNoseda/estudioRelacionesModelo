class Building < ApplicationRecord
    has_many :appartments, dependent: :destroy

    def to_s
        name
    end
end
