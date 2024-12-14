GxLight@ GetLight(CTrackMania@ App)
{
	ISceneVis@ GameScene = App.GameScene;
	if (GameScene !is null)
	{
		CScene@ HackScene = GameScene.HackScene;
		if (HackScene !is null)
		{
			CSceneLight@ SceneLight = HackScene.Lights[0];
			if (SceneLight !is null)
			{
				GxLight@ Light = SceneLight.Light;
				if (Light !is null)
				{
					return Light;
				}
			}
		}
	}
	return null;
}
void Main() {
	auto App = GetApp();
	int Hue = 0;
	while (true) 
	{
		GxLight@ Light = GetLight(App);
		if (Light !is null)
		{
			if (Hue > 255) Hue = 0;
			vec3 LightColor = UI::HSV(i / 255, 0.78, 0.78);
			Light.Color = Enabled ? LightColor : vec3(1, 1, 1);
		}
		yield();
	}
}

bool Enabled = false;
void RenderMenu()
{
    if(UI::MenuItem((Enabled ? "\\$ff0" + Icons::Star + "\\$z Disable" : Icons::StarO + " Enable") + " Starman effect", "", Enabled)) {
        Enabled = !Enabled;
    }
}
