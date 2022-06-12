namespace TMX
{
    Net::HttpRequest@ GetResponse(const string &in url)
    {
        Net::HttpRequest@ request = Net::HttpRequest();

        request.Method = Net::HttpMethod::Get;
        request.Url = url;
        request.Start();

        return request;
    }

    array<Tag@> GetTags()
    {
        auto request = GetResponse("https://trackmania.exchange/api/tags/gettags");
        auto response = Json::Parse(request.String());

        array<Tag@> tags;

        for(int i = 0; i < response.get_Length(); i++)
        {
            tags.InsertLast(Tag(response[i]));
        }

        return tags;
    }

    void GetMap()
    {
        int mapID;
        auto playground = GetApp().CurrentPlayground;

        if (playground is null) 
        {
	    	print("No chat found");
	    	return;
	    }

        bool found = false;

        while(!found)
        {
            string url = GenerateUrl();
            auto request = GetResponse(url);

            while (!request.Finished())
            {
                yield();
            }

            auto response = Json::Parse(request.String());
            Map@ map = Map(response);
        
            if(!Settings::novalued)
            {
                if(map._trackValue > 0)
                {
                    found = true;
                }
                else
                {
                    found = false;
                    continue;
                }
            }
            else
            {
                found = true;
            }

            if(!Settings::awarded)
            {
                if(map._awardCount > 0)
                {
                    found = true;
                }
                else
                {
                    found = false;
                    continue;
                }
            }
            else
            {
                found = true;
            }

            mapID = map._trackID;
        }

        playground.Interface.ChatEntry = "//tmx add " +  mapID;
    }

    string GenerateUrl()
    {
        string baseUrl = "https://trackmania.exchange/mapsearch2/search?api=on";

        if(Settings::chosenLength != "Anything")
        {
            for(int i = 0; i < Settings::searchLengths.Length; i++)
            {
                if(Settings::searchLengths[i] == Settings::chosenLength)
                {
                    baseUrl += "&length=" + (i - 1);
                }
            } 

            if(Settings::chosenOperator != "Exacts")
            {
                for(int i = 0; i < Settings::searchOperators.Length; i++)
                {
                    if(Settings::searchOperators[i] == Settings::chosenOperator)
                    {
                        baseUrl += "&lengthop=" + (i - 1);
                    }
                }
            }
        }

        if(Settings::chosenDiff != "Anything")
        {      
            for(int i = 0; i < Settings::searchDiff.Length; i++)
            {
                if(Settings::searchDiff[i] == Settings::chosenOperator)
                {
                    baseUrl += "&difficulty=" + (i - 1);
                }
            }
        }

        string tags = "&tags=";
        string etags = "&etags=";

        for(int i = 0; i < Settings::chosenTags.Length; i++)
        {
            if(Settings::chosenTags[i])
            {
                if(i != 0)
                {
                    tags += "," + (i + 1);
                }
                else
                {
                    tags += "" + (i + 1);
                }
            }
            else
            {
                if(i != 0)
                {
                    etags += "," + (i + 1);
                }
                else
                {
                    etags += "" + (i + 1);
                }
            }
        }

        if(tags.Length > 6)
        {
            baseUrl += tags;
        }

        if(etags.Length > 7)
        {
            baseUrl += etags;
        }

        return baseUrl + "&random=1";
    }
}