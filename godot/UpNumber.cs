using aitg.lib;
using Godot;
using System;
using static aitg.lib.Globals;

public partial class UpNumber : Label
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		var upNumber = Math.Floor(root.upNumber);
		Text = upNumber.ToString();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
