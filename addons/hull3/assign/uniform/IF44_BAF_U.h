class IF44_BAF_U {
    class Rifleman {
        headGear = "H_LIB_UK_Helmet_Mk2";
        goggles = "";
        uniform = "U_LIB_UK_P37";
        vest = "V_LIB_UK_P37_Rifleman_Blanco_ARM";
        backpack = "B_LIB_UK_HSack_Blanco";
        insignia = "";
    };

    class Leader : Rifleman {
        vest = "V_LIB_UK_P37_Officer_Blanco_ARM";
    };

    class Officer : Leader {
        headGear = "H_LIB_UK_Beret";
    };

    class Crew : Rifleman {
        headGear = "H_LIB_UK_Beret_Tankist";
        vest = "V_LIB_UK_P37_Crew_ARM";
        backpack = "B_LIB_UK_HSack_Blanco";
    };

    class CO : Officer {
        backpack = "B_LIB_UK_HSack_Blanco_Tea";
    };

    class XO : CO {
    };

    class SL : Officer {
        uniform = "U_LIB_UK_P37_Sergeant";
    };

    class Medic : Rifleman {
        backpack = "B_LIB_UK_HSack_Blanco_Cape";
        uniform = "U_LIB_UK_P37_LanceCorporal";
        headGear = "H_LIB_UK_Helmet_Mk2_Bowed";
        insignia = "";
    };

    class FTL : Leader {
        vest = "V_LIB_UK_P37_Sten_Blanco_ARM";
        headGear = "H_LIB_UK_Helmet_Mk2_Camo";
        uniform = "U_LIB_UK_P37_Corporal";
    };

    class AR : Rifleman {
        vest = "V_LIB_UK_P37_Heavy_Blanco_ARM";
        uniform = "U_LIB_UK_P37_LanceCorporal";
        headGear = "H_LIB_UK_Helmet_Mk2_Bowed";
        backpack = "B_LIB_UK_HSack_Blanco_Cape";
    };

    class AAR : Rifleman {
        backpack = "B_LIB_UK_HSack_Blanco_Cape";
    };

    class RAT : Rifleman {
        uniform = "U_LIB_UK_P37Jerkins";
        headGear = "H_LIB_UK_Helmet_Mk2_Net";
    };

    class MMGG : AR {
    };

    class MMGAG : AAR {
        uniform = "U_LIB_UK_P37_Sergeant";
    };

    class HMGG : AR {
    };

    class HMGAG : AAR {
        uniform = "U_LIB_UK_P37_Sergeant";
    };

    class HMGAC : HMGG {
    };

    class MATG : RAT {
    };

    class MATAG : MATG {
        uniform = "U_LIB_UK_P37_Sergeant";
    };

    class MATAC : MATAG {
    };

    class HATG : Rifleman {
    };

    class HATAG : Rifleman {
        uniform = "U_LIB_UK_P37_Sergeant";
    };

    class HATAC : Rifleman {
    };

    class DHATG : Rifleman {
    };

    class DHATAG : Rifleman {
    };

    class DHATAC : Rifleman {
    };

    class SAMG : Rifleman {
    };

    class SAMAG : Rifleman {
    };

    class SAMAC : Rifleman {
    };

    class GMGG : Rifleman {
    };

    class GMGAG : Rifleman {
    };

    class GMGAC : Rifleman {
    };

    class MTRG : Rifleman {
    };

    class MTRAG : Rifleman {
        uniform = "U_LIB_UK_P37_Sergeant";
    };

    class MTRAC : Rifleman {
    };

    class ENG : Rifleman {
        vest = "V_LIB_UK_P37_Holster_Blanco_ARM";
        uniform = "U_LIB_UK_P37_Sergeant";
    };

    class ENGA : ENG {
    };

    class SN : Rifleman {
    };

    class SP : SN {
    };

    class VC : Crew {
        headGear = "H_LIB_UK_Beret_Headset";
        uniform = "U_LIB_UK_P37_Sergeant";
    };

    class VG : Crew {
    };

    class VD : Crew {
    };

    class P : Crew {
        headGear = "H_LIB_UK_Pilot_Cap";
        vest = "V_LIB_UK_P37_Crew_ARM";
        backpack = "B_Parachute";
    };

    class PCM : P {
    };

};
