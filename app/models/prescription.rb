class Prescription < ApplicationRecord
  belongs_to :customer

  validates :medicine_name, :next_delivery_date, presence: true

  scope :with_customer, -> { includes(:customer).references(:customer) }
  scope :search_term, lambda { |term|
    return all if term.blank?

    sanitized_term = "%#{sanitize_sql_like(term.strip)}%"
    joins(:customer).where(
      "customers.name ILIKE :term OR customers.phone ILIKE :term OR prescriptions.medicine_name ILIKE :term OR prescriptions.notes ILIKE :term",
      term: sanitized_term
    )
  }
  scope :sorted_by_due_date, lambda { |direction = "asc"|
    order(next_delivery_date: direction == "desc" ? :desc : :asc, medicine_name: :asc)
  }
end
