json.extract! prescription, :id, :medicine_name, :notes, :next_delivery_date, :customer_id, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
