namespace TMX
{
    array<User@> users;
    array<Map@> maps;

    void SearchUsers()
    {
        users.Resize(0);

        string url = "https://trackmania.exchange/api/user/search?query=" + Settings::author;
        auto request = GetResponse(url);
        auto response = Json::Parse(request.String());
        
        if(response.get_Length() > 0)
        {
            for(int i = 0; i < response.get_Length(); i++)
            {
                users.InsertLast(User(response[i]));
            }
        }
    }

    void GetUserMaps()
    {
        string url = "https://trackmania.exchange/mapsearch2/search?api=on&authorid=" + Settings::authorid + "&limit=100";
        auto request = GetResponse(url);

        while (!request.Finished())
        {
            yield();
        }

        auto response = Json::Parse(request.String());

        Settings::totalcount = response["totalItemCount"];

        if(Settings::totalcount > 0)
        {
            if(Settings::totalcount > 100)
            {
                int total = Settings::totalcount;
                int modulo = Settings::totalcount % 100;
                int rest = Settings::totalcount - modulo;
                int times = rest / 100;

                for(int i = 1; i <= times + 1; i++)
                {
                    string url = "https://trackmania.exchange/mapsearch2/search?api=on&authorid=" + Settings::authorid + "&limit=100&page=" + i;
                    auto request = GetResponse(url);

                    while (!request.Finished())
                    {
                        yield();
                    }

                    auto response = Json::Parse(request.String());

                    if(total > 100)
                    {
                        for(int j = 0; j < 100; j++)
                        {
                            maps.InsertLast(Map(response["results"][j]));
                            total--;
                        }
                    }
                    else
                    {
                        for(int j = 0; j < total; j++)
                        {
                            maps.InsertLast(Map(response["results"][j]));
                        }
                    }
                }   
            }
            else
            {
                for(int i = 0; i < Settings::totalcount; i++)
                {
                    maps.InsertLast(Map(response["results"][i]));
                }
            }
        }  

        print(maps.Length);
        Settings::finished = true; 
    }
}