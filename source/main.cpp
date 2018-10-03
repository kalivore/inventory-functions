#include "skse/PluginAPI.h"
#include "skse/SafeWrite.h"
#include "skse/skse_version.h"
#include <shlobj.h>

#include "InventoryFuncs.h"

IDebugLog	gLog;
const char * kLogPath = "\\My Games\\Skyrim\\SKSE\\plugins\\InventoryFunctions.log";

PluginHandle	g_pluginHandle = kPluginHandle_Invalid;

// here is a global reference to the interface, keeping to the skse style
SKSEPapyrusInterface        * g_papyrus = NULL;

// any other things the plugin does

extern "C"
{

	bool SKSEPlugin_Query(const SKSEInterface * skse, PluginInfo * info)
	{
		gLog.OpenRelative(CSIDL_MYDOCUMENTS, kLogPath);

		_MESSAGE("Inventory Functions Script");

		// populate info structure
		info->infoVersion =	PluginInfo::kInfoVersion;
		info->name =		"Inventory Functions plugin";
		info->version =		1;

		// store plugin handle so we can identify ourselves later
		g_pluginHandle = skse->GetPluginHandle();

		if(skse->isEditor)
		{
			_MESSAGE("loaded in editor, marking as incompatible");

			return false;
		}
		else if(skse->runtimeVersion != RUNTIME_VERSION_1_9_32_0)
		{
			_MESSAGE("unsupported runtime version %08X", skse->runtimeVersion);

			return false;
		}

		g_papyrus = (SKSEPapyrusInterface *)skse->QueryInterface(kInterface_Papyrus);
		if(!g_papyrus)
		{
			_MESSAGE("couldn't get papyrus interface");

			return false;
		}

		if(g_papyrus->interfaceVersion < SKSEPapyrusInterface::kInterfaceVersion)
		{
			_MESSAGE("papyrus interface too old (%d expected %d)", g_papyrus->interfaceVersion, SKSEPapyrusInterface::kInterfaceVersion);

			return false;
		}

		return true;
	}

	bool SKSEPlugin_Load(const SKSEInterface * skse)
	{
		if (g_papyrus)
		{
			bool btest = g_papyrus->Register(InventoryFunctions_Papyrus::RegisterPapyrusFunctions);
			if (btest)
				_MESSAGE("Register Succeeded");
			else
				_MESSAGE("Register Failed");
		}
		else
		{
			_MESSAGE("g_papyrus Failed!");
		}

		return true;
	}

};
