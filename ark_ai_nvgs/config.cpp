class CfgPatches {
    class ark_ai_nvgs {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.60;
        requiredAddons[] = {"A3_Weapons_F_ItemHolders", "CBA_MAIN"};
        author = "ARK";
        authorUrl = "http://www.ark-group.org";
    };
};

class Extended_PostInit_EventHandlers {
    class ark_ai_nvgs {
        init = "[] call compile preProcessFileLineNumbers 'x\ark_inhouse\addons\ark_ai_nvgs\nvg_postinit.sqf';";
    };
};

class cfgWeapons {
    class NVGoggles;

    class NVGoggles_AI : NVGoggles {
        author = "ARK";
        descriptionShort = "Night Vision Goggles - AI Only";
        displayName = "NV Goggles (AI Only)";
        model = "x\ark_inhouse\addons\ark_ai_nvgs\empty.p3d";
        modelOptics = "\A3\weapons_f\reticle\optics_night";
        picture = "\A3\Weapons_F\Data\UI\gear_nvg_CA.paa";
        scope = 1;
            class ItemInfo {
                hmdType = 0;
                mass = 20;
                modelOff = "x\ark_inhouse\addons\ark_ai_nvgs\empty.p3d";
                type = 616;
                uniformModel = "x\ark_inhouse\addons\ark_ai_nvgs\empty.p3d";
            };
    };
};