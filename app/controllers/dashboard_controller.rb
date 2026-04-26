class DashboardController < ApplicationController
  def index
    @query = params[:query].to_s.strip
    @upcoming_prescriptions = Prescription.with_customer
                                         .search_term(@query)
                                         .sorted_by_due_date
  end
end
