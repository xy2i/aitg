using aitg.lib;
using Godot;
using System;
using static aitg.lib.Globals;

public partial class TitleText : Label
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Text = save.userTitle;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
