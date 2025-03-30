void Main()
{
   CGameCtnApp@ app = GetApp();

   // Initialize tags correctly
   startnew(InitializePlugin);
}

void InitializePlugin()
{
   // Wait for tags to be retrieved (this call handles waiting for HTTP request)
   array<TMX::Tag@> tags = TMX::GetTags();
   
   // Initialize settings with the fetched tags
   Settings::tags = tags;
   
   // Initialize the chosenTags array with the correct size
   Settings::chosenTags.Resize(tags.Length);
   
   // Set default values for tags
   for(int i = 0; i < Settings::chosenTags.Length; i++)
   {
      Settings::chosenTags[i] = true;
   }
}

void RenderMenu()
{
   if (UI::MenuItem("\\$faf" + Icons::MapO + "\\$z Random TMX Map"))
   {
      startnew(TMX::GetMap);
   }

   if(UI::MenuItem("\\$faf" + Icons::WindowMaximize + "\\$z Show Window", "", Settings::windowVisible)) 
   {
		Settings::windowVisible = !Settings::windowVisible;
	}
}

void Render()
{
   UI::RenderUI();
}
