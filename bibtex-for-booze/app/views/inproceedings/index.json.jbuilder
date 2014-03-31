json.array!(@inproceedings) do |inproceeding|
  json.extract! inproceeding, :id
  json.url inproceeding_url(inproceeding, format: :json)
end
