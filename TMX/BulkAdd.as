namespace TMX
{
    array<User@> users;

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

    /* to do
    void GetUserMaps()
    {

    }
    */
}