//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_BetterHairTriggers.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_BetterHairTriggers extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame() {}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState) {}

static event OnPostTemplatesCreated() {

	UpdateHairTriggers();

}

static function UpdateHairTriggers() { // Set base-game Hair Trigger attributes to 0/none values, add new abilities

	local X2ItemTemplateManager ItemTemplateManager;
	local X2WeaponUpgradeTemplate WeaponUpgradeTemplate;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	 
	// GetBonusAmountFn | Empower bonus
	// BonusAbilities | Abilities that come with the template (only the crit chance upgrades seem to have these by default)
	// FreeFireChance | Free shot chance
	// FreeFireCostFn | Checks if free shot chance succeeds or not

	// Update Basic Hair Trigger:
		WeaponUpgradeTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('FreeFireUpgrade_Bsc'));
		WeaponUpgradeTemplate.GetBonusAmountFn = none;
		WeaponUpgradeTemplate.BonusAbilities.AddItem('HairTrigger_Bsc');
		WeaponUpgradeTemplate.FreeFireChance = 0;
		WeaponUpgradeTemplate.FreeFireCostFn = none;

	// Update Advanced Hair Trigger:
		WeaponUpgradeTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('FreeFireUpgrade_Adv'));
		WeaponUpgradeTemplate.GetBonusAmountFn = none; 
		WeaponUpgradeTemplate.BonusAbilities.AddItem('HairTrigger_Adv');
		WeaponUpgradeTemplate.FreeFireChance = 0; 
		WeaponUpgradeTemplate.FreeFireCostFn = none; 

	// Update Superior Hair Trigger:
		WeaponUpgradeTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('FreeFireUpgrade_Sup'));
		WeaponUpgradeTemplate.GetBonusAmountFn = none;
		WeaponUpgradeTemplate.BonusAbilities.AddItem('HairTrigger_Sup');
		WeaponUpgradeTemplate.FreeFireChance = 0;
		WeaponUpgradeTemplate.FreeFireCostFn = none;

}

static function bool AbilityTagExpandHandler(string InString, out string OutString) { // Dynamic Localization

	local name TagText;

	TagText = name(InString);
	switch (TagText) {
	
		case 'BONUSREACTIONFIREDAMAGEBSC':

			OutString = string(class'X2Ability_BetterHairTriggers'.default.HAIRTRIGGER_BSC_DAMAGE_VALUE + AreUpgradesEmpowered() ? class'X2Effect_BonusReactionFireDamage'.default.HAIRTRIGGER_BONUS_VALUE : 0);
			return true;

		case 'BONUSREACTIONFIREDAMAGEADV':

			OutString = string(class'X2Ability_BetterHairTriggers'.default.HAIRTRIGGER_ADV_DAMAGE_VALUE + AreUpgradesEmpowered() ? class'X2Effect_BonusReactionFireDamage'.default.HAIRTRIGGER_BONUS_VALUE : 0);
			return true;

		case 'BONUSREACTIONFIREDAMAGESUP':

			OutString = string(class'X2Ability_BetterHairTriggers'.default.HAIRTRIGGER_SUP_DAMAGE_VALUE + AreUpgradesEmpowered() ? class'X2Effect_BonusReactionFireDamage'.default.HAIRTRIGGER_BONUS_VALUE : 0);
			return true;

		default: // Else

			return false;

	}
}

static function bool AreUpgradesEmpowered() { // Check if upgrades are empowered (Inside Knowledge)

	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

	return XComHQ.bEmpoweredUpgrades;

}