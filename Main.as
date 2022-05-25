void Main()
{
   CGameCtnApp@ app = GetApp();

   TMX::GetTags();

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
