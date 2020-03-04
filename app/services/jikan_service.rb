require 'net/http'
class JikanService
    def initialize
    end

    def top(mal_type = nil)
        if(!mal_type) 
            mal_type = rand(2) === 1 ? "anime" : "manga"
        end
        q('/v3/top/' + mal_type)["top"].map{ |series|
            Series.new({
                :name => series["title"],
                :is_anime => mal_type === "anime",
                :mal_id => series["mal_id"],
                :image_url => series["image_url"],
                :url => series["url"]
            })
        }
    end

    def get(mal_type, mal_id)
        q(mal_type == 'anime' ? ('/v3/anime/' + mal_id.to_s + '/characters_staff') : ('/v3/manga/' + mal_id.to_s + '/characters'))["characters"].map { |character| 
            Waifu.new({
                :name => character["name"],
                :mal_id => character["mal_id"],
                :image_url => character["image_url"],
                :url => character["url"]
            })
        }
    end

    private

    def q(url)
        JSON.parse(Net::HTTP.get('api.jikan.moe', url))
    end
end