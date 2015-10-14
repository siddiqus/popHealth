class MeasurePatient
  include Mongoid::Document

  store_in collection: :measure_patients

  # identifiers
  field :measure_id, type: String
  field :sub_id, type: String
  field :effective_date, type: Integer
  field :provider_id, type: BSON::ObjectId

  field :ipp, type: Integer
  field :numer, type: Integer
  field :denom, type: Integer
  field :antinumerator, type: Integer
  field :denex, type: Integer
  field :denexcep, type: Integer

  # patient attributes
  field :patient_id, type: BSON::ObjectId
  field :medical_record_id, type: BSON::ObjectId
  field :first, type: String
  field :last, type: String
  field :patient_id, type: String
  field :birthdate, type: Integer
  field :gender, type: String

end
