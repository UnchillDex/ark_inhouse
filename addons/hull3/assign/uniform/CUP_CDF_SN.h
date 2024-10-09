class CUP_CDF_SN {
    class Rifleman {
        headGear = "CUP_H_CDF_H_PASGT_SNW";
        goggles = "";
        uniform = "CUP_U_B_CDF_SNW_2";
        vest = "CUP_V_CDF_6B3_1_SNW_ARM";
        backpack = "ark_backpack_med";
        insignia = "";
    };

    class Leader : Rifleman {
        vest = "CUP_V_CDF_6B3_5_SNW_ARM";
    };

    class Officer : Leader {
        headGear = "CUP_H_CDF_OfficerCap_SNW";
    };

    class Crew : Rifleman {
        headGear = "CUP_H_RUS_TSH_4_Brown";
        uniform = "CUP_U_B_CDF_SNW_2";
        vest = "CUP_V_CDF_6B3_2_SNW_ARM";
        backpack = "CUP_B_SLA_Medicbag";
    };

    class CO : Officer {
    };

    class XO : CO {
        backpack = "ark_backpack_large";
    };

    class SL : Officer {
    };

    class Medic : Rifleman {
        backpack = "ark_backpack_large";
        insignia = "";
    };

    class FTL : Leader {
        vest = "CUP_V_CDF_6B3_4_SNW_ARM";
    };

    class AR : Rifleman {
        vest = "CUP_V_CDF_6B3_3_SNW_ARM";
    };

    class AAR : Rifleman {
        backpack = "ark_backpack_large";
    };

    class RAT : Rifleman {
    };

    class MMGG : AR {
        vest = "CUP_V_CDF_6B3_3_SNW_ARM";
        backpack = "ark_backpack_large";
    };

    class MMGAG : AAR {
    };

    class HMGG : AR {
    };

    class HMGAG : AAR {
    };

    class HMGAC : AAR {
    };

    class MATG : RAT {
        backpack = "ark_backpack_large";
    };

    class MATAG : AAR {
    };

    class MATAC : MATAG {
    };

    class HATG : RAT {
        backpack = "ark_backpack_large";
    };

    class HATAG : AAR {
    };

    class HATAC : HATAG {
    };

    class DHATG : AR {
    };

    class DHATAG : AAR {
    };

    class DHATAC : AAR {
    };

    class SAMG : AR {
    };

    class SAMAG : AAR {
    };

    class SAMAC : AAR {
    };

    class GMGG : AR {
    };

    class GMGAG : AAR {
    };

    class GMGAC : AAR {
    };

    class MTRG : AR {
    };

    class MTRAG : AAR {
    };

    class MTRAC : AAR {
    };

    class ENG : Rifleman {
        backpack = "ark_backpack_large";
    };

    class ENGA : ENG {
    };

    class SN : Rifleman {
        headGear = "CUP_H_CDF_OfficerCap_SNW";
        goggles = "CUP_TK_NeckScarf";
        vest = "CUP_V_CDF_6B3_2_SNW_ARM";
        backpack = "ark_backpack_small";
    };

    class SP : SN {
    };

    class VC : Crew {
    };

    class VG : Crew {
    };

    class VD : Crew {
    };

    class P : Crew {
        headGear = "CUP_H_RUS_ZSH_Shield_Up";
        uniform = "CUP_U_B_CDF_SNW_1";
        vest = "CUP_V_CDF_6B3_2_SNW_ARM";
        backpack = "B_Parachute";
    };

    class PCM : P {
    };

};
