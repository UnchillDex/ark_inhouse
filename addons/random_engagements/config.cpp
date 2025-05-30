class CfgPatches {
    class random_engagements {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.0;
        requiredAddons[] = {"cba_main", "Hull3"};
        skipWhenMissingDependencies = 1;
        author = "ARK";
        authorUrl = "https://github.com/Cyruz143/ark_inhouse";
    };
};

class Extended_PreInit_EventHandlers {
    class ARK_Inhouse_Random_Engagements {
        init = "call compileScript ['x\ark\addons\random_engagements\re_preinit.sqf'];";
    };
};

class Extended_PostInit_EventHandlers {
    class ARK_Inhouse_Random_Engagements {
        init = "call compileScript ['x\ark\addons\random_engagements\re_postinit.sqf'];";
    };
};
