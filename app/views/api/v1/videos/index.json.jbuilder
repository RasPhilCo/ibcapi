json.results do |json|
  json.partial! 'video', collection: @videos, as: :video
end
json.meta do |json|
 json.total_count @videos.count
 json.page @page
 json.results_per_page @results_per_page
 json.url request.url
 json.next_page @next_page
end
