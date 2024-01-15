CTrackMania@ g_app;
CGameCtnChallenge@ GetCurrentMap()
{
#if MP41 || TMNEXT
	return g_app.RootMap;
#else
	return g_app.Challenge;
#endif
}
vec3 lightColor = vec3(255,0,0);

void Main() {
	@g_app = cast<CTrackMania>(GetApp());
    int i = 0;
	while (true) {
        print(menub);
        if(menub){
            i++;
            ISceneVis@ sceneVis = g_app.GameScene;
            if(sceneVis !is null){
                CScene@ hackScene = sceneVis.HackScene;
                if(hackScene !is null){
                    CSceneLight@ sceneLight = hackScene.Lights[0];
                    if(sceneLight !is null){
                        GxLight@ light = sceneLight.Light;
                        if(light !is null){
                            if(i>255) i = 0;
                            vec3 lightColor = HSVtoRGB(i, 200, 200);
                            light.Color = lightColor;
                        }
                    }
                }
            }
        }else{
            ISceneVis@ sceneVis = g_app.GameScene;
            if(sceneVis !is null){
                CScene@ hackScene = sceneVis.HackScene;
                if(hackScene !is null){
                    CSceneLight@ sceneLight = hackScene.Lights[0];
                    if(sceneLight !is null){
                        GxLight@ light = sceneLight.Light;
                        if(light !is null){
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
    if(UI::MenuItem((menub ? "\\$ff0"+Icons::Star+"\\$z Disable" : Icons::StarO+" Enable") + " Starman effect", "")) {
        menub = !menub;
    }
}

vec3 HSVtoRGB(float h, float s, float v){
    h = h / 255;
    s = s / 255;
    v = v / 255;
    if(s == 0) return vec3(v, v, v);

    float i = Math::Floor(h * 6);
    float f = h * 6 - i;
    float p = v * (1 - s);
    float q = v * (1 - s * f);
    float t = v * (1 - s * (1 - f));

    switch(int(i % 6)){
        case 0: return vec3(v, t, p);
        case 1: return vec3(q, v, p);
        case 2: return vec3(p, v, t);
        case 3: return vec3(p, q, v);
        case 4: return vec3(t, p, v);
        case 5: return vec3(v, p, q);
    }

    return vec3(0, 0, 0);
}