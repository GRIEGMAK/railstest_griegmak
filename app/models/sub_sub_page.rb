class SubSubPage < ApplicationRecord
    before_save :refactor_text
    before_update :refactor_text
    validates :sublink, presence: true, uniqueness: true, format: { with: /\A[а-яА-ЯёЁa-zA-Z0-9_]+\z/, message: 'Только цифры, буквы и _' }
    validates :title, :body, presence: true

    private

    def refactor_text
        self.body = body.gsub(/\*\*(?<string>.*)\*\*/, '<b>\k<string></b>')
        self.body = body.gsub(/\\\\(?<string>.*)\\\\/, '<i>\k<string></i>')
        self.body = body.gsub(/\(\((?<site>.*) (?<string>.*)\)\)/, '<a href="/\k<site>">\k<string></a>')
    end
end
