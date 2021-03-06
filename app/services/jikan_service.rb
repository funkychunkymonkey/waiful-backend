require 'net/http'
class JikanService
    def initialize
    end

    def search(mal_type, search)
        q('/v3/search/' + mal_type + '?q=' + search)["results"].map{ |series| mal_to_series(mal_type, series) }
    end

    def top(mal_type = nil)
        if(!mal_type) 
            mal_type = rand(2) === 1 ? "anime" : "manga"
        end
        q('/v3/top/' + mal_type)["top"].map{ |series| mal_to_series(mal_type, series) }
    end

    def get(mal_type, mal_id)
        mal_to_series(mal_type, q(mal_type == 'anime' ? ('/v3/anime/' + mal_id.to_s) : ('/v3/manga/' + mal_id.to_s)))
    end

    def get_waifu(mal_id)
        mal_to_waifu get_character_info(mal_id)
    end

    def get_characters(mal_type, mal_id)
        q(mal_type == 'anime' ? ('/v3/anime/' + mal_id.to_s + '/characters_staff') : ('/v3/manga/' + mal_id.to_s + '/characters'))["characters"].map{ |character| mal_to_waifu character }
    end

    def get_character_info(mal_id)
        q('/v3/character/' + mal_id.to_s)
    end

    def get_character_images(mal_id)
        result = q('/v3/character/' + mal_id.to_s + '/pictures')["pictures"]
        puts "-------------------"
        puts result
        result
    end

    private

    def mal_to_series(mal_type, series)
        started_at = '';
        ended_at = '';

        if(series['aired']) 
            if(series['aired']['from'])
                started_at = DateTime.parse(series['aired']['from']).strftime('%b %Y')
            end
            if(series['aired']['to'])
                ended_at = DateTime.parse(series['aired']['to']).strftime('%b %Y')
            end
        elsif(series['published'])
            if(series['published']['from'])
                started_at = DateTime.parse(series['published']['from']).strftime('%b %Y')
            end
            if(series['published']['to'])
                ended_at = DateTime.parse(series['published']['to']).strftime('%b %Y')
            end
        else 
            started_at = series['start_date']
            ended_at = series['end_date']
        end
        Series.new({
            :name => series["title"],
            :is_anime => mal_type === "anime",
            :mal_id => series["mal_id"],
            :image_url => series["image_url"],
            :url => series["url"],
            :started_at => started_at,
            :ended_at => ended_at,
            :score => series["score"],
            :episodes => series["episodes"] ? series["episodes"] : series["volumes"],
            :description => series["synopsis"],
        })
    end
    def mal_to_waifu(character)
        Waifu.new({
            :name => character["name"],
            :mal_id => character["mal_id"],
            :image_url => character["image_url"],
            :url => character["url"],
            :description => character["about"],
            :role => character["role"] 
        })
    end

    def q(url)
        JSON.parse(Net::HTTP.get('api.jikan.moe', url))
    end
end