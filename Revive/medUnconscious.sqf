params ["_unit"];
private ["_grupo","_grupos","_isLeader","_dummyGroup","_bleedOut","_suicide","_saveVolume","_ayuda","_isHelped","_texto","_isPlayer","_camTarget","_saveVolumeVoice"];

if ([_unit] call AS_fnc_isUnconscious) exitWith {};
if (damage _unit < 0.9) exitWith {};
if (!local _unit) exitWith {};
[_unit, true] call AS_fnc_setUnconscious;
_bleedOut = time + 300;
_isPlayer = isPlayer _unit;
if (_isPlayer) then {
	if (!isMultiplayer) then {_bleedOut = time + 50};
};

_inPlayerGroup = if (({isPlayer _x} count units  group _unit > 0) and (!_isPlayer)) then {true} else {false};

if (_isPlayer) then	{
	closeDialog 0;
	respawnMenu = (findDisplay 46) displayAddEventHandler ["KeyDown",
		{
		_handled = false;
		if (_this select 1 == 19) then
			{
			[player] spawn respawn;
			};
		_handled;
		}];

	[_unit,true] remoteExec ["setCaptive"];
	openMap false;
}else{
	{_unit disableAI _x} foreach ["TARGET","AUTOTARGET","MOVE","ANIM"];
	_unit stop true;
	if (_inPlayerGroup) then {
		[_unit,true] remoteExec ["setCaptive"];
		[_unit,"heal"] remoteExec ["AS_fnc_addActionMP",0,_unit];
	};
};

//Unit is inside the vehicle
if (vehicle _unit != _unit) then {
	_unit action ["getOut", vehicle _unit];
	if (_isPlayer) then	{
		{
		    if ((!isPlayer _x) and (vehicle _x != _x) and (_x distance _unit < 50)) then {unassignVehicle _x; [_x] orderGetIn false}
		} forEach units group _unit;
	};
	waitUntil {(vehicle _unit == _unit) or (!alive _unit)};
};

_unit setUnconscious true;
_unit setFatigue 1;
sleep 2;

if (_isPlayer) then {
	if (activeTFAR) then {
		_saveVolume = player getVariable ["tf_globalVolume", 1.0];
		player setVariable ["tf_unable_to_use_radio", true, true];
		player setVariable ["tf_globalVolume", 0];
		_saveVolumeVoice = player getVariable ["tf_voiceVolume", 1.0];
		if (random 100 < 20) then {player setVariable ["tf_voiceVolume", 0.0, true]};
	};
	group _unit setCombatMode "YELLOW";
	if (isMultiplayer) then {[_unit,"heal"] remoteExec ["AS_fnc_addActionMP",0,_unit]};
};

while {(time < _bleedOut) and (damage _unit > 0.25) and (alive _unit) and ([_unit] call AS_fnc_isUnconscious) and (!(_unit getVariable ["ASrespawning",false]))} do {
	if (random 10 < 1) then {playSound3D [(injuredSounds call BIS_fnc_selectRandom),_unit,false, getPosASL _unit, 1, 1, 50];};
	if (_isPlayer) then {
		_isHelped = _unit getVariable "ASmedHelped";
		if (isNil "_isHelped") then {
			_ayuda = [_unit] call askForHelp;
			if (isNull _ayuda) then	{
				_texto = format ["<t size='0.6'>There is no AI near to help you.<t size='0.5'><br/>Hit R to Respawn"];
			} else {
				_texto = format ["<t size='0.6'>%1 is on the way to help you.<t size='0.5'><br/>Hit R to Respawn",name _ayuda];
				//_camTarget = _ayuda;
			};
		}else{
			if (!isNil "_ayuda") then{
				_texto = format ["<t size='0.6'>%1 is on the way to help you.<t size='0.5'><br/>Hit R to Respawn",name _ayuda];
				//_camTarget = _ayuda;
			}else{
				_texto = "<t size='0.6'>Wait until you get assistance or<t size='0.5'><br/>Hit R to Respawn";
			};
		};
		[_texto,0,0,3,0,0,4] spawn bis_fnc_dynamicText;
		if (_unit getVariable "ASrespawning") exitWith {};
	} else {
		if (isPlayer (leader group _unit)) then {
			if (autoheal) then{
				_isHelped = _unit getVariable "ASmedHelped";
				if (isNil "_isHelped") then {[_unit] call askForHelp;};
			};
		} else {
			_isHelped = _unit getVariable "ASmedHelped";
			if (isNil "_isHelped") then {[_unit] call askForHelp;};
		};
	};
	sleep 3;
};

if (_isPlayer) then{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];
	if (activeTFAR) then{
		player setVariable ["tf_unable_to_use_radio", false, true];
		player setVariable ["tf_globalVolume", _saveVolume];
		player setVariable ["tf_voiceVolume", _saveVolumeVoice, true];
	};
	if (isMultiplayer) then {[_unit,"remove"] remoteExec ["AS_fnc_addActionMP",0,_unit]};
}else{
	_unit stop false;
	if (_inPlayerGroup) then{
		[_unit,"remove"] remoteExec ["AS_fnc_addActionMP",0,_unit];
	};
};

if (captive _unit) then {[_unit,false] remoteExec ["setCaptive"]};

if (_isPlayer and (_unit getVariable ["respawn",false])) exitWith {};

//TIMEOUT to bleed out
if (time > _bleedOut) exitWith {
	if (_isPlayer) then	{
		_isHelped = _unit getVariable "ASmedHelped";
		if (isNil "_isHelped") then {
			_ayuda = [_unit] call askForHelp;
			if (!isNull _ayuda) then{
				_unit setdamage 0.2;
				[_unit, false] call AS_fnc_setUnconscious;
				_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
			}else{
				[_unit] call respawn
			};
		} else {
			_unit setdamage 0.2;
			_unit setUnconscious false;
			[_unit, false] call AS_fnc_setUnconscious;
			_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
		};
	}else{
		_unit setDamage 1;
	};
};

if ([_unit] call AS_fnc_isUnconscious) then {[_unit, false] call AS_fnc_setUnconscious;};

if (alive _unit) then {
	_unit setUnconscious false;
	if (!_isPlayer) then {
		{_unit enableAI _x} foreach ["TARGET","AUTOTARGET","MOVE","ANIM"];
	} else {
		_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
	};
};
