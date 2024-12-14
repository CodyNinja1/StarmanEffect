CTrackMania@ g_app;
CGameCtnChallenge@ GetCurrentMap()
{
	return g_app.RootMap;
}
vec3 lightColor = vec3(255,0,0);

void Main() {
	@g_app = cast<CTrackMania>(GetApp());
	int i = 0;
	while (true) 
	{
		print(menub);
		if(menub)
		{
        		i++;
            		ISceneVis@ sceneVis = g_app.GameScene;
            		if(sceneVis !is null)
			{
                		CScene@ hackScene = sceneVis.HackScene;
                		if(hackScene !is null)
				{
                    			CSceneLight@ sceneLight = hackScene.Lights[0];
                    			if(sceneLight !is null)
					{
                        			GxLight@ light = sceneLight.Light;
                        			if(light !is null){
                            				if(i>255) i = 0;
                            				vec3 lightColor = UI::HSV(i, 0.78, 0.78);
                            				light.Color = lightColor;
                        			}
                    			}
                		}
            		}
        	}
		else
		{
	        	ISceneVis@ sceneVis = g_app.GameScene;
	        	if(sceneVis !is null)
			{
	                	CScene@ hackScene = sceneVis.HackScene;
	        		if(hackScene !is null)
				{
	                    		CSceneLight@ sceneLight = hackScene.Lights[0];
	                    		if(sceneLight !is null)
					{
	                			GxLight@ light = sceneLight.Light;
	                        		if(light !is null)
						{
	                            			light.Color = vec3(1,1,1);
	                        		}
	                    		}
	                	}
	            	}
	        }
		yield();
	}
}

bool menub = false;
void RenderMenu()
{
    if(UI::MenuItem((menub ? "\\$ff0"+ Icons::Star + "\\$z Disable" : Icons::StarO + " Enable") + " Starman effect", "", menub)) {
        menub = !menub;
    }
}
