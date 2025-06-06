#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        author = "ARK";
        authors[] = {"ARK"};
        url = "http://www.ark-group.org";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ark_main"};
        VERSION_CONFIG;
    };
};

#include "CfgCloudlets.hpp"
#include "CfgLights.hpp"
#include "CfgImpacts.hpp"
#include "blastwaveEffects.hpp"
