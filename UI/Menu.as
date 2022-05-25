namespace UI
{
    string arrowRight = "\\$fff" + Icons::ArrowRight;
    string arrowLeft = "\\$fff" + Icons::ArrowLeft;
    
    void RenderUI()
    {
        if(Settings::windowVisible && UI::IsGameUIVisible())
        {  
    		UI::SetNextWindowPos(int(Settings::windowPosition.x) - 10, int(Settings::windowPosition.y));
            UI::PushStyleColor(UI::Col::WindowBg , vec4(0,0,0,0.0));
            UI::Begin("TMX Random", Settings::windowFlags);
    
            UI::PushStyleColor(UI::Col::Button, vec4(0,0,0,0.8));
            UI::PushStyleColor(UI::Col::ButtonHovered , vec4(0,0,0,0.9));
            UI::PushStyleColor(UI::Col::ButtonActive  , vec4(0,0,0,1));
            if(UI::Button(Settings::expandedVisible ? arrowLeft : arrowRight, vec2(40,40)))
            {
                Settings::expandedVisible = !Settings::expandedVisible;
                //startnew(TMX::GetMap);
            }
            UI::PopStyleColor(3);
    
            if(UI::IsItemHovered())
            {
            	UI::BeginTooltip();
    			UI::PushTextWrapPos(150);
    			UI::TextWrapped(Settings::expandedVisible ? "Collapse" : "Expand");
    			UI::PopTextWrapPos();
    			UI::EndTooltip();
            }

            Settings::windowPosition = UI::GetWindowPos();

            UI::End();
            UI::PopStyleColor(1);
    
            if(Settings::expandedVisible)
            {
                RenderOption(Icons::Kenney::Search, "Advanced Search", vec2(int(Settings::windowPosition.x) + 40, int(Settings::windowPosition.y)), vec4(0,0,0,0.9));
                RenderOption("T", "Random Tech", vec2(int(Settings::windowPosition.x) + 80, int(Settings::windowPosition.y)), vec4(0,0,0,1));
                RenderOption("D", "Random Dirt", vec2(int(Settings::windowPosition.x) + 120, int(Settings::windowPosition.y)), vec4(132,36,1,0.5));
                RenderOption("R", "Random RPG", vec2(int(Settings::windowPosition.x) + 160, int(Settings::windowPosition.y)), vec4(0,0,255,0.9));
                RenderOption("F", "Random FullSpeed",  vec2(int(Settings::windowPosition.x) + 200, int(Settings::windowPosition.y)), vec4(255,0,0,0.9));
                RenderOption("L", "Random LOL",  vec2(int(Settings::windowPosition.x) + 240, int(Settings::windowPosition.y)), vec4(255,0,60,0.9));
                RenderOption("P", "Random Plastic",  vec2(int(Settings::windowPosition.x) + 280, int(Settings::windowPosition.y)), vec4(255,255,0,0.9));
                RenderOption("I", "Random Ice", vec2(int(Settings::windowPosition.x) + 320, int(Settings::windowPosition.y)), vec4(0,153,255,0.9));
            }
    	}
    }
}