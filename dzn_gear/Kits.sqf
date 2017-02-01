// ***********************************
// Gear Kits 
// ***********************************

// ******** USEFUL MACROSES *******
// Maros for Empty weapon
#define EMPTYKIT	[["","","","",""],["","","","",""],["","","","",""],["","","","",""],[],[["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0]],[["",0],["",0],["",0],["",0],["",0],["",0]],[]]
// Macros for Empty weapon
#define EMPTYWEAPON	"","",["","","",""]
// Macros for the list of items to be chosen randomly
#define RANDOM_ITEM	["H_HelmetB_grass","H_HelmetB"]
// Macros to give the item only if daytime is in given inerval (e.g. to give NVGoggles only at night)
#define NIGHT_ITEM(X)	if (daytime < 9 || daytime > 18) then { X } else { "" }

#define	COMMON_UITEMS	["ACE_fieldDressing",5],["ACE_packingBandage",5],["ACE_elasticBandage",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_epinephrine",2],["ACE_quikclot",5],["ACE_CableTie",2],["ACE_Flashlight_XL50",1],["ACE_EarPlugs",1]
#define	COMMON_AITEMS	"ItemMap","ItemCompass","ItemWatch","ItemRadio", NIGHT_ITEM("NVGoggles_INDEP")

kit_vehicle = [
	[],[],[],[]
];

/*
	US ARMY OCP (USOCP)
*/

kit_usocp_random = [
	"kit_usocp_ftl"
	, "kit_usocp_ar"
	, "kit_usocp_g", "kit_usocp_g"
	, "kit_usocp_r", "kit_usocp_r"	
];

kit_usocp_sl =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_cu_ocp","rhsusf_iotv_ocp_Squadleader","tf_bussole","rhsusf_ach_helmet_headset_ocp",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_m4a1_carryhandle_grip","rhs_mag_30Rnd_556x45_Mk318_Stanag",["","rhsusf_acc_anpeq15side","rhsusf_acc_ACOG2_USMC",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","CUP_hgun_M9","CUP_15Rnd_9x19_M9",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS, "ACE_Vector"],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS, ["ACE_MapTools",1] ]],
	["<VEST ITEMS >> ",[["HANDGUN MAG",2],["30Rnd_556x45_Stanag",8],["rhs_mag_an_m8hc",2],["Chemlight_green",2],["SmokeShellGreen",1],["SmokeShellRed",1],["HandGrenade",2],["SmokeShellOrange",2]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_usocp_ftl =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_cu_ocp","rhsusf_iotv_ocp_Teamleader","","rhsusf_ach_helmet_headset_ocp",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_m4a1_carryhandle_m203","rhs_mag_30Rnd_556x45_Mk318_Stanag",["","rhsusf_acc_anpeq15side","rhsusf_acc_ACOG2",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["rhs_mag_an_m8hc",2],["Chemlight_green",2],["HandGrenade",2],["30Rnd_556x45_Stanag",9],["rhs_mag_M433_HEDP",8]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_usocp_g =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_cu_ocp","rhsusf_iotv_ocp_Grenadier","","rhsusf_ach_helmet_headset_ocp",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_m4a1_carryhandle_m203","rhs_mag_30Rnd_556x45_Mk318_Stanag",["","rhsusf_acc_anpeq15side","rhsusf_acc_eotech_552",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["rhs_mag_an_m8hc",2],["Chemlight_green",2],["HandGrenade",2],["30Rnd_556x45_Stanag",8],["rhs_mag_M433_HEDP",10]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_usocp_r =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_cu_ocp","rhsusf_iotv_ocp_Rifleman","B_AssaultPack_cbr","rhsusf_ach_helmet_headset_ocp",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_m4a1_carryhandle_grip","rhs_mag_30Rnd_556x45_Mk318_Stanag",["","rhsusf_acc_anpeq15side","CUP_optic_CompM4",""]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_M136_hedp","rhs_m136_hedp_mag",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["rhs_mag_an_m8hc",2],["Chemlight_green",2],["HandGrenade",2],["30Rnd_556x45_Stanag",10]]],
	["<BACKPACK ITEMS >> ",[["rhsusf_100Rnd_556x45_soft_pouch",4]]]
];

kit_usocp_ar =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_cu_ocp","rhsusf_iotv_ocp_SAW","B_AssaultPack_cbr","rhsusf_ach_helmet_headset_ocp",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_m249_pip_L","rhs_200rnd_556x45_M_SAW",["","rhsusf_acc_anpeq15side","rhsusf_acc_eotech_552",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","CUP_hgun_M9","CUP_15Rnd_9x19_M9",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["rhs_mag_an_m8hc",2],["Chemlight_green",2],["HandGrenade",2],["rhsusf_100Rnd_556x45_soft_pouch",2],["HANDGUN MAG",3]]],
	["<BACKPACK ITEMS >> ",[["rhsusf_100Rnd_556x45_soft_pouch",3]]]
];  

kit_usocp_pl =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_cu_ocp","rhsusf_iotv_ocp_Squadleader","tf_bussole","H_Beret_Colonel","TRYK_TAC_EARMUFF_Gs"],
	["<PRIMARY WEAPON >>  ","rhs_weap_m4a1_carryhandle_grip","rhs_mag_30Rnd_556x45_Mk318_Stanag",["","rhsusf_acc_anpeq15side","rhsusf_acc_ACOG3_USMC","rhsusf_acc_grip1"]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","CUP_hgun_M9","CUP_15Rnd_9x19_M9",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS, "ACE_Vector"],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS, ["ACE_MapTools",1] ]],
	["<VEST ITEMS >> ",[["ACE_MapTools",1],["HANDGUN MAG",2],["30Rnd_556x45_Stanag",8],["rhs_mag_an_m8hc",2],["Chemlight_green",2],["SmokeShellGreen",1],["SmokeShellRed",1],["HandGrenade",2],["SmokeShellOrange",2]]],
	["<BACKPACK ITEMS >> ",[]]
];

/*
	RU VV
*/

kit_ruvv_random = [
	"kit_ruvv_ftl"
	, "kit_ruvv_ar"
	, "kit_ruvv_g", "kit_ruvv_g"
	, "kit_ruvv_r", "kit_ruvv_r"
];

kit_ruvv_sl =
	[
	["<EQUIPEMENT >>  ","TRYK_U_pad_hood_Cl","TRYK_V_ArmorVest_green","tf_bussole","rhs_6b47_bala","TRYK_TAC_EARMUFF_Gs"],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m_camo_npz","rhs_30Rnd_545x39_AK",["rhs_acc_dtk1","rhs_acc_perst1ik","rhsusf_acc_SpecterDR_OD",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS, "ACE_Vector"],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS, ["ACE_MapTools",1] ]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",9],["rhs_mag_rgn",2],["rhs_mag_rdg2_white",1],["rhs_mag_rdg2_black",1],["SmokeShellBlue",1]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ruvv_ftl =
	[
	["<EQUIPEMENT >>  ","TRYK_U_pad_hood_Cl","TRYK_V_ArmorVest_green","TRYK_B_Belt_CYT","rhs_6b47_bala","TRYK_TAC_EARMUFF_Gs"],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m_fullplum_gp25_npz","rhs_30Rnd_545x39_AK",["rhs_acc_dtk1","","rhsusf_acc_SpecterDR",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["rhs_mag_rgd5",2],["rhs_mag_rdg2_black",2],["PRIMARY MAG",9]]],
	["<BACKPACK ITEMS >> ",[["rhs_VOG25P",10]]]
];

kit_ruvv_g =
	[
	["<EQUIPEMENT >>  ","TRYK_U_pad_hood_Cl","TRYK_V_ArmorVest_green","TRYK_B_Belt_CYT","rhs_6b47_bala","TRYK_TAC_EARMUFF_Gs"],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m_fullplum_gp25_npz","rhs_30Rnd_545x39_AK",["rhs_acc_dtk1","","CUP_optic_MRad",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["rhs_mag_rgd5",2],["rhs_mag_rdg2_black",2],["PRIMARY MAG",9]]],
	["<BACKPACK ITEMS >> ",[["rhs_VOG25P",10]]]
];

kit_ruvv_ar =
	[
	["<EQUIPEMENT >>  ","TRYK_U_pad_hood_Cl","TRYK_V_ArmorVest_green","B_AssaultPack_rgr","rhs_6b47_bala","TRYK_TAC_EARMUFF_Gs"],
	["<PRIMARY WEAPON >>  ","CUP_arifle_RPK74","CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",["","","CUP_optic_Kobra",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["rhs_mag_rdg2_black",2],["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",2],["rhs_mag_rgd5",2]]],
	["<BACKPACK ITEMS >> ",[["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",4]]]
];

kit_ruvv_r =
	[
	["<EQUIPEMENT >>  ","TRYK_U_pad_hood_Cl","TRYK_V_ArmorVest_green","B_AssaultPack_rgr","rhs_6b47_bala","TRYK_TAC_EARMUFF_Gs"],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak105_npz","rhs_30Rnd_545x39_AK",["rhs_acc_dtk","rhs_acc_perst1ik","CUP_optic_MRad",""]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_rpg26","rhs_rpg26_mag",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["rhs_mag_rdg2_black",2],["rhs_mag_rgd5",2],["PRIMARY MAG",9]]],
	["<BACKPACK ITEMS >> ",[["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",4],["SECONDARY MAG",1]]]
];

kit_ruvv_pl =
	[
	["<EQUIPEMENT >>  ","TRYK_U_pad_hood_Cl","TRYK_V_ArmorVest_green","tf_bussole","rhs_beret_milp","TRYK_TAC_EARMUFF_Gs"],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m_camo_npz","rhs_30Rnd_545x39_AK",["rhs_acc_dtk1","rhs_acc_perst1ik","rhsusf_acc_SpecterDR_OD",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS, "ACE_Vector"],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS, ["ACE_MapTools",1] ]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",9],["rhs_mag_rgn",2],["rhs_mag_rdg2_white",1],["rhs_mag_rdg2_black",1],["SmokeShellBlue",1]]],
	["<BACKPACK ITEMS >> ",[]]
];


/*
	UK
*/

kit_ukaf_random = [
	"kit_ukaf_ftl"
	, "kit_ukaf_ar"
	, "kit_ukaf_g", "kit_ukaf_g"
	, "kit_ukaf_r", "kit_ukaf_r"
];

#define	UKAF_UNI		["CUP_U_B_BAF_DPM_S1_RolledUp","CUP_U_B_BAF_DPM_Tshirt"]
#define	UKAF_HEAD		["CUP_H_BAF_Helmet_Net_2_DPM","CUP_H_BAF_Helmet_3_DPM","CUP_H_PMC_Cap_PRR_Grey","CUP_H_PMC_Cap_EP_Grey"]
#define	UKAF_FACE		["","","","","G_Bandanna_khk"]

kit_ukaf_pl =
	[
	["<EQUIPEMENT >>  ",UKAF_UNI,"CUP_V_BAF_Osprey_Mk2_DPM_Soldier2","","CUP_H_BAF_Officer_Beret",""],
	["<PRIMARY WEAPON >>  ","CUP_arifle_L85A2_G","30Rnd_556x45_Stanag",["","rhsusf_acc_anpeq15_bk_top","rhsusf_acc_SpecterDR_A",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS, "ACE_Vector"],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS, ["ACE_MapTools",1] ]],
	["<VEST ITEMS >> ",[["ACE_MapTools",1],["HandGrenade",2],["rhs_mag_an_m8hc",2],["PRIMARY MAG",9]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ukaf_sl =
	[
	["<EQUIPEMENT >>  ",UKAF_UNI,"CUP_V_BAF_Osprey_Mk2_DPM_Soldier2","",UKAF_HEAD,UKAF_FACE],
	["<PRIMARY WEAPON >>  ","CUP_arifle_L85A2_G","30Rnd_556x45_Stanag",["","rhsusf_acc_anpeq15_bk_top","rhsusf_acc_SpecterDR_A",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS, "ACE_Vector"],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS, ["ACE_MapTools",1] ]],
	["<VEST ITEMS >> ",[["ACE_MapTools",1],["HandGrenade",2],["rhs_mag_an_m8hc",2],["PRIMARY MAG",9]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ukaf_ftl =
	[
	["<EQUIPEMENT >>  ",UKAF_UNI,"CUP_V_BAF_Osprey_Mk4_MTP_Rifleman","",UKAF_HEAD,UKAF_FACE],
	["<PRIMARY WEAPON >>  ","CUP_arifle_L85A2_GL","30Rnd_556x45_Stanag",["","rhsusf_acc_anpeq15_bk_top","rhsusf_acc_SpecterDR_A",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["ACE_MapTools",1],["HandGrenade",2],["rhs_mag_an_m8hc",2],["PRIMARY MAG",9],["1Rnd_HE_Grenade_shell",8]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ukaf_ar =
	[
	["<EQUIPEMENT >>  ",UKAF_UNI,"CUP_V_BAF_Osprey_Mk4_MTP_MachineGunner","",UKAF_HEAD,UKAF_FACE],
	["<PRIMARY WEAPON >>  ","CUP_lmg_L110A1","CUP_200Rnd_TE4_Red_Tracer_556x45_M249",["","rhsusf_acc_anpeq15side_bk","rhsusf_acc_SpecterDR_A",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["HandGrenade",2],["PRIMARY MAG",2],["rhs_mag_an_m8hc",2]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ukaf_g =
	[
	["<EQUIPEMENT >>  ",UKAF_UNI,"CUP_V_BAF_Osprey_Mk2_DPM_Grenadier","",UKAF_HEAD,UKAF_FACE],
	["<PRIMARY WEAPON >>  ","CUP_arifle_L85A2_GL","30Rnd_556x45_Stanag",["","rhsusf_acc_anpeq15side_bk","rhsusf_acc_eotech_xps3",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["rhs_mag_an_m8hc",1],["HandGrenade",2],["PRIMARY MAG",10],["1Rnd_HE_Grenade_shell",9]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ukaf_r =
	[
	["<EQUIPEMENT >>  ",UKAF_UNI,["CUP_V_BAF_Osprey_Mk2_DPM_Soldier1","CUP_V_BAF_Osprey_Mk4_MTP_Rifleman"],"B_AssaultPack_mcamo",UKAF_HEAD,UKAF_FACE],
	["<PRIMARY WEAPON >>  ","CUP_arifle_L85A2_G","30Rnd_556x45_Stanag",["","rhsusf_acc_anpeq15side_bk","rhsusf_acc_eotech_xps3",""]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_M136_hedp","rhs_m136_hedp_mag",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],	
	["<VEST ITEMS >> ",[["30Rnd_556x45_Stanag",10],["rhs_mag_an_m8hc",2],["HandGrenade",2]]],
	["<BACKPACK ITEMS >> ",[["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",3]]]
];


/*
	REBELS AI 
*/

kit_rebels_random = [
	"kit_rebels_r"
	,"kit_rebels_gr"
	,"kit_rebels_rheavy"
	,"kit_rebels_r"
	,"kit_rebels_gr"
	,"kit_rebels_rheavy"
	,"kit_rebels_mg"
];

#define INS_UNI	["CUP_U_O_Partisan_VSR_Mixed2","CUP_U_O_Partisan_VSR_Mixed1","CUP_U_O_Partisan_TTsKO_Mixed","CUP_U_O_Partisan_TTsKO","CUP_U_I_GUE_Woodland1","CUP_U_I_GUE_Flecktarn","CUP_U_I_GUE_Flecktarn3","CUP_U_I_GUE_Flecktarn2"]
#define INS_HEAD	["H_Bandanna_cbr","H_Bandanna_camo", "H_MilCap_dgtl"]
kit_rebels_r =
	[
	["<EQUIPEMENT >>  ",INS_UNI,"TRYK_V_harnes_od_L","",INS_HEAD,"G_Bandanna_oli"],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m","rhs_30Rnd_545x39_AK",["rhs_acc_dtk","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio"],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4],["PRIMARY MAG",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",8],["HandGrenade",3],["rhs_mag_rdg2_black",2]]],
	["<BACKPACK ITEMS >> ",[]]
];
kit_rebels_gr =
	[
	["<EQUIPEMENT >>  ",INS_UNI,"TRYK_V_harnes_od_L","",INS_HEAD,"G_Bandanna_oli"],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m_gp25","rhs_30Rnd_545x39_AK",["rhs_acc_dtk","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio"],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4],["PRIMARY MAG",1]]],
	["<VEST ITEMS >> ",[["HandGrenade",1],["rhs_mag_rdg2_black",2],["PRIMARY MAG",6],["rhs_VOG25",8]]],
	["<BACKPACK ITEMS >> ",[]]
];
kit_rebels_rheavy =
	[
	["<EQUIPEMENT >>  ",INS_UNI,"TRYK_V_harnes_od_L","",INS_HEAD,"G_Bandanna_oli"],
	["<PRIMARY WEAPON >>  ","rhs_weap_akms","rhs_30Rnd_762x39mm",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio"],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4],["PRIMARY MAG",3]]],
	["<VEST ITEMS >> ",[["HandGrenade",2],["rhs_mag_rdg2_black",2],["PRIMARY MAG",8]]],
	["<BACKPACK ITEMS >> ",[]]
];
kit_rebels_mg =
	[
	["<EQUIPEMENT >>  ",INS_UNI,"TRYK_V_harnes_od_L","CUP_B_AlicePack_Khaki",INS_HEAD,"G_Bandanna_oli"],
	["<PRIMARY WEAPON >>  ","CUP_lmg_PKM","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemCompass","ItemWatch","ItemRadio"],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",8],["ACE_packingBandage",4]]],
	["<VEST ITEMS >> ",[["HandGrenade",2],["rhs_mag_rdg2_black",2],["PRIMARY MAG",1]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",2]]]
];


/*
 *	US Green
 */
kit_ussf_random = [
	"kit_ussf_ftl"
	,"kit_ussf_ar"
	,"kit_ussf_g","kit_ussf_g"
	,"kit_ussf_r","kit_ussf_r"	
];

kit_ussf_pl =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spc_patchless_radio","tf_bussole","H_Beret_Colonel","TRYK_TAC_EARMUFF_Gs"],
	["<PRIMARY WEAPON >>  ","rhsusf_weap_MP7A2_desert_grip3","rhsusf_mag_40Rnd_46x30_FMJ",["","rhsusf_acc_anpeq15A","CUP_optic_MRad","rhsusf_acc_grip3"]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS, "ACE_Vector"],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS, ["ACE_MapTools",1] ]],
	["<VEST ITEMS >> ",[["HandGrenade",2],["rhs_mag_an_m8hc",1],["SmokeShellRed",1],["SmokeShellPurple",1],["PRIMARY MAG",10]]],
	["<BACKPACK ITEMS >> ",[]]
];
 
kit_ussf_sl =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spc_patchless_radio","tf_bussole","TRYK_H_headsetcap_od","G_Bandanna_oli"],
	["<PRIMARY WEAPON >>  ","rhs_weap_mk18_grip_KAC_wd","30Rnd_556x45_Stanag",["rhsusf_acc_rotex5_grey","rhsusf_acc_anpeq15A","rhsusf_acc_SpecterDR_OD","rhsusf_acc_grip3"]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS, "ACE_Vector"],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS, ["ACE_MapTools",1] ]],
	["<VEST ITEMS >> ",[["HandGrenade",2],["PRIMARY MAG",8],["30Rnd_556x45_Stanag_Tracer_Red",2],["rhs_mag_an_m8hc",1],["SmokeShellRed",1],["SmokeShellPurple",1]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ussf_ftl =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spc_patchless_radio","","rhsusf_opscore_rg_cover_pelt","rhs_balaclava"],
	["<PRIMARY WEAPON >>  ","rhs_weap_mk18_grip_KAC_wd","30Rnd_556x45_Stanag",["rhsusf_acc_rotex5_grey","rhsusf_acc_anpeq15A","rhsusf_acc_SpecterDR_OD","rhsusf_acc_grip3"]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS, "ACE_Vector"],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS, ["ACE_MapTools",1] ]],
	["<VEST ITEMS >> ",[["HandGrenade",2],["PRIMARY MAG",8],["30Rnd_556x45_Stanag_Tracer_Red",2],["rhs_mag_an_m8hc",1],["SmokeShellRed",1],["SmokeShellPurple",1]]],
	["<BACKPACK ITEMS >> ",[]]
];
 
kit_ussf_ar =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spc_mg","B_AssaultPack_khk","rhsusf_opscore_rg_cover_pelt","rhs_balaclava"],
	["<PRIMARY WEAPON >>  ","rhs_weap_m249_pip_S_vfg2","rhs_200rnd_556x45_M_SAW",["","rhsusf_acc_anpeq15A","rhsusf_acc_SpecterDR_A","rhsusf_acc_grip4"]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["rhs_mag_an_m8hc",1],["HandGrenade",2],["PRIMARY MAG",2]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",1]]]
];

kit_ussf_g =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spc_patchless_radio","","rhsusf_opscore_rg_cover_pelt","rhs_balaclava"],
	["<PRIMARY WEAPON >>  ","rhs_weap_m4a1_blockII_M203_wd","30Rnd_556x45_Stanag",["","rhsusf_acc_anpeq15A",["CUP_optic_CompM4","rhsusf_acc_eotech_xps3"],""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["HandGrenade",2],["PRIMARY MAG",8],["rhs_mag_M433_HEDP",10]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ussf_r =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spc_patchless_radio","B_AssaultPack_khk","rhsusf_opscore_rg_cover_pelt","rhs_balaclava"],
	["<PRIMARY WEAPON >>  ","rhs_weap_mk18_grip_KAC_wd","30Rnd_556x45_Stanag",["","rhsusf_acc_anpeq15A",["CUP_optic_CompM4","rhsusf_acc_eotech_xps3"],"rhsusf_acc_grip3"]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_m72a7","rhs_m72a7_mag",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", COMMON_AITEMS],
	["<UNIFORM ITEMS >> ", [ COMMON_UITEMS ]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",10],["rhs_mag_an_m8hc",1],["HandGrenade",2]]],
	["<BACKPACK ITEMS >> ",[["rhs_200rnd_556x45_M_SAW",3]]]
];