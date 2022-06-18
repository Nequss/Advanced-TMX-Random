namespace UI
{
    void RenderOption(string text, string description, vec2 position, vec4 color)
    {
            UI::SetNextWindowPos(int(position.x), int(position.y));
            UI::PushStyleColor(UI::Col::WindowBg, vec4(0,0,0,0));
            UI::Begin(text, Settings::windowFlags);
    
            UI::PushStyleColor(UI::Col::Button, vec4(0,0,0,0.8));
            UI::PushStyleColor(UI::Col::ButtonHovered, color);
            UI::PushStyleColor(UI::Col::ButtonActive, color);

            if(UI::Button("\\$fff" + text, vec2(40,40)))
            {
                if(description == "Advanced Search")
                {
                    startnew(TMX::GetMap);
                }

                if(text == "T")
                {
                    startnew(TMX::GetTech);
                }

                if(text == "D")
                {
                    startnew(TMX::GetDirt);
                }

                if(text == "R")
                {
                    startnew(TMX::GetRPG);
                }

                if(text == "F")
                {
                    startnew(TMX::GetFS);
                }

                if(text == "L")
                {
                    startnew(TMX::GetLOL);
                }

                if(text == "P")
                {
                    startnew(TMX::GetPlastic);
                }

                if(text == "I")
                {
                    startnew(TMX::GetIce);
                }
            }

            UI::PopStyleColor(3);
    
            if(UI::IsItemHovered())
            {
            	UI::BeginTooltip();
    			UI::PushTextWrapPos(150);
    			UI::TextWrapped(description);
    			UI::PopTextWrapPos();
    			UI::EndTooltip();
            }
                
            UI::End();
            UI::PopStyleColor(1);
    }
}