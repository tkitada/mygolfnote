class Contact < ApplicationRecord
  enum subject: {
    bug_report: 0,
    suggestion: 1,
    question: 2,
    other: 3
  }

  validates :name, presence: true
  validates :email, presence: true
  validates :subject, presence: true
  validates :message, presence: true
end
