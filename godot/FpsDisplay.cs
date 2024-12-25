using Godot;
using System;

public partial class FpsDisplay : Label
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		var fps = Engine.GetFramesPerSecond();
		Text = fps.ToString();
		if (fps > 30)
		{
			AddThemeColorOverride("font_color", new Color("00ff00"));
		}
		else if (fps > 20)
		{
			AddThemeColorOverride("font_color", new Color("ffff00"));
		}
		else
		{
			AddThemeColorOverride("font_color", new Color("ff0000"));
		}
	}
}
