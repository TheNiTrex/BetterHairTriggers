class X2Ability_BetterHairTriggers extends X2Ability
	config (Game);

var config int HAIRTRIGGER_BSC_DAMAGE_VALUE;
var config int HAIRTRIGGER_ADV_DAMAGE_VALUE;
var config int HAIRTRIGGER_SUP_DAMAGE_VALUE;

static function array<X2DataTemplate> CreateTemplates() {

	local array<X2AbilityTemplate> Templates;

	Templates.AddItem(HairTrigger_Bsc());
	Templates.AddItem(HairTrigger_Adv());
	Templates.AddItem(HairTrigger_Sup());

	return Templates;

}

static function X2AbilityTemplate HairTrigger_Bsc() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;
	local X2AbilityTrigger Trigger;
	local X2Effect_BonusReactionFireDamage BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HairTrigger_Bsc');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.bUniqueSource = false; 

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// + Damage with Reaction Fire:
		BonusEffect = new class'X2Effect_BonusReactionFireDamage';
		BonusEffect.BonusDmg = default.HAIRTRIGGER_BSC_DAMAGE_VALUE;
		BonusEffect.BuildPersistentEffect(1, true, false, false);
		BonusEffect.DuplicateResponse = eDupe_Allow;
		BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
		
	Template.AddTargetEffect(BonusEffect);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;

}

static function X2AbilityTemplate HairTrigger_Adv() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;
	local X2AbilityTrigger Trigger;
	local X2Effect_BonusReactionFireDamage BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HairTrigger_Adv');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.bUniqueSource = false;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// + Damage with Reaction Fire:
		BonusEffect = new class'X2Effect_BonusReactionFireDamage';
		BonusEffect.BonusDmg = default.HAIRTRIGGER_ADV_DAMAGE_VALUE;
		BonusEffect.BuildPersistentEffect(1, true, false, false);
		BonusEffect.DuplicateResponse = eDupe_Allow;
		BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
		
	Template.AddTargetEffect(BonusEffect);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;

}

static function X2AbilityTemplate HairTrigger_Sup() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;
	local X2AbilityTrigger Trigger;
	local X2Effect_BonusReactionFireDamage BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HairTrigger_Sup');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.bUniqueSource = false;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// + Damage with Reaction Fire:
		BonusEffect = new class'X2Effect_BonusReactionFireDamage';
		BonusEffect.BonusDmg = default.HAIRTRIGGER_SUP_DAMAGE_VALUE;
		BonusEffect.BuildPersistentEffect(1, true, false, false);
		BonusEffect.DuplicateResponse = eDupe_Allow;
		BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
		
	Template.AddTargetEffect(BonusEffect);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;

}