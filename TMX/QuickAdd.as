namespace TMX
{
    void GetTech()
    {
        string url = "https://trackmania.exchange/mapsearch2/search?api=on&tags=3&random=1";
        auto request = GetResponse(url);

        while (!request.Finished())
        {
            yield();
        }

        auto response = Json::Parse(request.String());
        Map@ map = Map(response["results"][0]);
        PlayMap(map._trackID);
    }

    void GetDirt()
    {
        string url = "https://trackmania.exchange/mapsearch2/search?api=on&tags=15&random=1";
        auto request = GetResponse(url);

        while (!request.Finished())
        {
            yield();
        }

        auto response = Json::Parse(request.String());
        Map@ map = Map(response["results"][0]);
        PlayMap(map._trackID);
    }

    void GetRPG()
    {
        string url = "https://trackmania.exchange/mapsearch2/search?api=on&tags=4&random=1";
        auto request = GetResponse(url);

        while (!request.Finished())
        {
            yield();
        }

        auto response = Json::Parse(request.String());
        Map@ map = Map(response["results"][0]);
        PlayMap(map._trackID);
    }

    void GetFS()
    {
        string url = "https://trackmania.exchange/mapsearch2/search?api=on&tags=2&random=1";
        auto request = GetResponse(url);

        while (!request.Finished())
        {
            yield();
        }

        auto response = Json::Parse(request.String());
        Map@ map = Map(response["results"][0]);
        PlayMap(map._trackID);
    }

    void GetLOL()
    {
        string url = "https://trackmania.exchange/mapsearch2/search?api=on&tags=5&random=1";
        auto request = GetResponse(url);

        while (!request.Finished())
        {
            yield();
        }

        auto response = Json::Parse(request.String());
        Map@ map = Map(response["results"][0]);
        PlayMap(map._trackID);
    }

    void GetPlastic()
    {
        string url = "https://trackmania.exchange/mapsearch2/search?api=on&tags=39&random=1";
        auto request = GetResponse(url);

        while (!request.Finished())
        {
            yield();
        }

        auto response = Json::Parse(request.String());
        Map@ map = Map(response["results"][0]);
        PlayMap(map._trackID);
    }

    void GetIce()
    {
        string url = "https://trackmania.exchange/mapsearch2/search?api=on&tags=14&random=1";
        auto request = GetResponse(url);

        while (!request.Finished())
        {
            yield();
        }

        auto response = Json::Parse(request.String());
        Map@ map = Map(response["results"][0]);
        PlayMap(map._trackID);
    }

    void PlayMap(int id)
    {
        if(Settings::chosenController == "Alone")
        {
            CTrackMania@ app = cast<CTrackMania>(GetApp());
            app.BackToMainMenu(); 

            while(!app.ManiaTitleControlScriptAPI.IsReady)
            {
                yield(); 
            }

            app.ManiaTitleControlScriptAPI.PlayMap("https://trackmania.exchange/maps/download/" + id, "", "");
        }
        else
        {
            auto playground = GetApp().CurrentPlayground;

            if (playground is null) 
            {
	        	print("No chat found");
	        	return;
	        }

            playground.Interface.ChatEntry = Settings::addCommand + id;
        }
    }
}