class OlympusFunctions {
	tag = "OlympusClient";
	
	class core {
        file = "core";
		class checkMod {};
		class intro {};
	};
	
	class config {
        file = "core\config";
		class localObjects {};
		class olympusVars {};
	};
	
	class functions {
		file = "core\functions";
		class createVehicleLocal {};
		class drawMarkers {};
		class groupMarkers {};
		class setupMarkers {};
		class setupObjects {};
		class sideChatBan {};
	};
	
	class animations {
		file = "core\functions\animations";
		class ambientAnim {};
		class ambientAnim_getParams {};
		class ambientAnim_monitor {};
		class ambientAnim_playAnim {};
		class ambientAnim_terminate {};
	};
};