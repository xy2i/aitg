using Godot;
using System;
using static aitg.lib.Globals;

public partial class AwesomeButton : Button
{
	AnimationPlayer alphaAnimation;
	PackedScene mainScene;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		alphaAnimation = GetNode<AnimationPlayer>("AlphaAnimation");
		mainScene = GD.Load<PackedScene>("res://godot/main-screen/MainScene.tscn");
		MouseEntered += OnMouseEntered;
		MouseExited += OnMouseExited;
		ButtonUp += OnButtonUp;
	}

	private void OnMouseEntered()
	{
		alphaAnimation.Stop();
	}
	private void OnMouseExited()
	{
		alphaAnimation.Play();
	}
	private void OnButtonUp()
	{
		Engine.MaxFps = 40;
		LoadSave("file0");
		GD.Print(save.displayName);
		GetTree().ChangeSceneToPacked(mainScene);
	}
}
