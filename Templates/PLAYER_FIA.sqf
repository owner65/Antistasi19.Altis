side_blue = west;
guer_respawn = "respawn_west";
guer_marker_colour = "ColorWEST";
guer_marker_type = "flag_FIA";
guer_flag_texture = "\A3\Data_F\Flags\Flag_FIA_CO.paa";

guer_rem_des = "B_Static_Designator_01_F";

guer_veh_truck = "B_G_Van_01_transport_F"; // default transport for squads
guer_veh_engineer = "B_G_Offroad_01_repair_F";
guer_veh_technical = "B_G_Offroad_01_armed_F";
guer_veh_quad = "B_G_Quadbike_01_F"; // default transport for snipers
guer_veh_offroad = "B_G_Offroad_01_F"; // default transport for teams
guer_veh_dinghy = "C_Boat_Civil_01_F";

guer_sol_AA = "B_G_Soldier_lite_F"; // AA trooper in player groups
guer_sol_AM = "B_G_Soldier_A_F"; // playable, player-only
guer_sol_AR = "B_G_Soldier_AR_F"; // playable
guer_sol_ENG = "B_G_engineer_F"; // playable
guer_sol_EXP = "B_G_Soldier_exp_F"; //
guer_sol_GL = "B_G_Soldier_GL_F"; //
guer_sol_LAT = "B_G_Soldier_LAT_F"; // playable
guer_sol_MED = "B_G_medic_F"; // playable
guer_sol_MRK = "B_G_Soldier_M_F"; // playable
guer_sol_OFF = "B_G_officer_F"; // playable, Petros
guer_sol_R_L = "B_G_Soldier_lite_F"; // driver/crew
guer_sol_RFL = "B_G_Soldier_F"; // playable
guer_sol_SL = "B_G_Soldier_SL_F"; //
guer_sol_SN = "B_G_Sharpshooter_F"; //
guer_sol_TL = "B_G_Soldier_TL_F"; // playable, player-only
guer_sol_HMG = "B_G_Soldier_unarmed_F"; // HMG gunner

guer_POW = "B_G_Survivor_F"; //

guer_stat_mortar = "B_G_Mortar_01_F";
guer_stat_MGH = "B_HMG_01_high_F";
guer_stat_AT = "B_static_AT_F";
guer_stat_AA = "B_static_AA_F";

guer_cfg_inf = (configfile >> "CfgGroups" >> "West" >> "Guerilla" >> "Infantry");

guer_grp_sniper = "IRG_SniperTeam_M";
guer_grp_sentry = "IRG_InfSentry";
guer_grp_AT = "IRG_InfTeam_AT";
guer_grp_squad = "IRG_InfSquad";
guer_grp_team = "IRG_InfTeam";

guer_flag = "Flag_FIA_F";

guer_soldierArray = [guer_sol_RFL,guer_sol_R_L,guer_sol_HMG,guer_sol_AR,guer_sol_MED,guer_sol_ENG,guer_sol_EXP,guer_sol_GL,guer_sol_TL,guer_sol_AM,guer_sol_MRK,guer_sol_LAT,guer_sol_SL,guer_sol_OFF,guer_sol_SN,guer_sol_AA];

// ===== GEAR ===== \\
guer_radio_TFAR = "tf_anprc152";
if !(activeAFRF && activeUSAF && activeGREF) then {
	/*
	These are the vehicles and statics that you can buy at HQ. Currently, the array requires a strict(!) order.
	0-2: civilian vehicles
	3-10: military vehicles and statics
	*/

	if (worldname == "Tanoa") then {
		vfs = [
			"C_Offroad_02_unarmed_F_green",
			"C_Van_01_transport_F",
			"C_Heli_Light_01_civil_F",
			"C_Quadbike_01_F",
			"O_LSV_02_unarmed_F",
			"I_C_Offroad_02_unarmed_F",
			"I_C_Van_01_transport_F",
			"I_G_Offroad_01_armed_F",
			"I_HMG_01_high_F",
			"I_G_Mortar_01_F",
			"I_static_AT_F",
			"I_static_AA_F"
			
		];

	} else {

		vfs = [
			"C_Offroad_01_F",
			"C_Van_01_transport_F",
			"C_Heli_Light_01_civil_F",
			"C_Quadbike_01_F",
			"O_LSV_02_unarmed_F",
			"B_G_Offroad_01_F",
			"B_G_Van_01_transport_F",
			"B_G_Offroad_01_armed_F",
			"B_HMG_01_high_F",
			"B_G_Mortar_01_F",
			"B_static_AT_F",
			"B_static_AA_F"
			
		];
	};

	guer_gear_vestAdv = "V_PlateCarrierIAGL_oli";
	guer_gear_vestMedic = "";
	guer_gear_vestEngineer = "";

	guer_gear_AT = "launch_I_Titan_short_F";
	guer_gear_LAT = "launch_NLAW_F";
	guer_gear_AA = "launch_I_Titan_F";
	guer_gear_SNPR = "srifle_GM6_F";
	guer_gear_SNPR_camo = "srifle_GM6_SOS_F";
	guer_gear_GL = "arifle_TRG21_GL_F";
	guer_gear_LMG = "LMG_Mk200_F";
	guer_gear_Carbine = "arifle_Mk20C_F";
	guer_gear_GL_gren = "1Rnd_HE_Grenade_shell";
	guer_gear_grenSmoke = "SmokeShell";
	guer_gear_grenHE = "HandGrenade";
	guer_gear_defOptic = "optic_ACO_grn";

	guer_gear_BP = "B_AssaultPack_blk";
	guer_gear_BP_AT = "B_AssaultPack_blk";
	guer_gear_BP_Medic = "";
	guer_gear_BP_Engineer = "";
} else {
	guer_veh_technical_AT = "rhsgref_ins_g_uaz_spg9";
	guer_stat_mortar = "rhsgref_ins_g_2b14";
	guer_stat_MGH = "rhsgref_ins_g_DSHKM";
	guer_stat_AT = "rhsgref_ins_g_SPG9M";
	guer_stat_AA = "rhsgref_ins_g_ZU23";

	guer_veh_AA = "rhsgref_ins_g_gaz66_r142";

	vfs = [
		"C_Offroad_01_F",
		"C_Van_01_transport_F",
		"rhs_uh1h_hidf_unarmed",
		"C_Quadbike_01_F",
		"rhs_uaz_open_MSV_01",
		"rhsusf_m998_w_4dr",
		"RHS_Ural_MSV_01",
		"B_G_Offroad_01_armed_F",
		"rhs_DSHKM_ins",
		"rhs_2b14_82mm_msv",
		"rhs_Kornet_9M133_2_vdv",
		"rhs_Igla_AA_pod_msv",
		"rhs_gaz66_r142_vdv",
		"rhsgref_ins_g_ZU23",
		"rhsusf_m966_w"
	];

	guer_gear_vestAdv = "rhs_6b23_6sh116_flora";
	guer_gear_vestMedic = "rhs_6b23_digi_medic";
	guer_gear_vestEngineer = "rhs_6b23_digi_engineer";

	guer_gear_AT = "rhs_weap_rpg7";
	guer_gear_LAT = "rhs_weap_rpg26";
	guer_gear_AA = "rhs_weap_igla";
	guer_gear_SNPR = "rhs_weap_svdp_wd";
	guer_gear_SNPR_camo = "rhs_weap_svdp_wd";
	guer_gear_GL = "rhs_weap_akms_gp25";
	guer_gear_LMG = "rhs_weap_pkm";
	guer_gear_Carbine = "rhs_weap_aks74u";
	guer_gear_GL_gren = "rhs_VOG25";
	guer_gear_grenSmoke = "rhs_mag_rdg2_white";
	guer_gear_grenHE = "rhs_mag_rgd5";
	guer_gear_defOptic = "rhs_acc_1p29";

	guer_gear_BP = "rhs_sidor";
	guer_gear_BP_AT = "rhs_rpg_empty";
	guer_gear_BP_Medic = "rhs_assault_umbts_medic";
	guer_gear_BP_Engineer = "rhs_assault_umbts_engineer";
};

// Name of the faction
A3_Str_PLAYER = localize "STR_GENIDENT_FIA";

// Position of your HQ
posHQ = server getVariable ["posHQ", getMarkerPos guer_respawn];

statics_allMGs = [guer_stat_MGH];
statics_allATs = [guer_stat_AT];
statics_allAAs = [guer_stat_AA];
statics_allMortars = [guer_stat_mortar];

guer_vehicleArray = [guer_veh_quad,guer_veh_technical,guer_stat_MGH,guer_veh_offroad,guer_veh_truck,guer_veh_dinghy,guer_stat_mortar,guer_stat_AT,guer_stat_AA,guer_veh_engineer];