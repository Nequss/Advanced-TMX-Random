class CachedImage
{
    string url;
    Resources::Texture@ texture;

    void DownloadFromURLAsync()
    {
        auto request = Net::HttpRequest();
        request.Method = Net::HttpMethod::Get;
        request.Url = url;
        request.Start();

        while (!request.Finished()) 
        {
            yield();
        }

        @texture = UI::LoadTexture(request.Buffer());

        if (texture.GetSize().x == 0) 
        {
            @texture = null;
        }
    }
}

namespace Images
{
    dictionary cachedImages;

    CachedImage@ FindExisting(const string &in url)
    {
        CachedImage@ ret = null;
        cachedImages.Get(url, @ret);
        return ret;
    }

    CachedImage@ CachedFromURL(const string &in url)
    {
        auto existing = FindExisting(url);
        if (existing !is null) 
        {
            return existing;
        }

        auto ret = CachedImage();
        ret.url = url;
        cachedImages.Set(url, @ret);

        startnew(CoroutineFunc(ret.DownloadFromURLAsync));
        return ret;
    }
}