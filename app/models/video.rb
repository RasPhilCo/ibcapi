class Video < ActiveRecord::Base
  validates :yt_id, uniqueness: true

  scope :id_range, ->(min, max){where(["id between ? and ?", min, max])}
  scope :non_duplicates, -> {where(duplicate: [false, nil])}
  scope :with_query, ->(title){where("title ilike ?", "%#{title}%")}

  class << self
    def per_page
      30
    end

    #####
    # Clean up Heroku/production duplicates
    #####
    def delete_duplicates
      videos = Video.select("COUNT(yt_id) as total, yt_id")
                    .group(:yt_id)
                    .having("COUNT(yt_id) > 1")
                    .order(:yt_id)
                    .map{|p| {p.yt_id => p.total} }

      videos.each do |v|
        vs = Video.where(yt_id: v.keys[0])
        (vs.count - 1).times do |i|
          vs[(i+1)].destroy
        end
      end 
    end
  end

  def count_vote(vote)
    self.popularity = 0 if self.popularity.nil?
    case vote
    when "up"
      self.popularity += 1 
    when "down"
      self.popularity -= 1
    end
  end
end



