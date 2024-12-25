using Godot;
using System;
using System.Collections.Generic;
using System.Linq;
using aitg.lib;
using aitg.lib.feature.ba;


public partial class Node2d : Node2D
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GD.Print(Items.craftWeapon[2].name);
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
