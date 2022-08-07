ImFileDialogDir = "../%{SubmodoleDirs.ImFileDialog}"

project "ImFileDialog"
	kind "StaticLib"
	language "C++"

	targetdir ("$(ProjectDir)/lib/%{outputdir}")
	objdir ("$(ProjectDir)/%{outputdir}")

	files
	{
        "ImFileDialog.h",
        "ImFileDialog.cpp",
	}

	sysincludedirs
    {
        "./"
    }
        
    includedirs
    {
        "./",
        "%{stb_image}",
        "../",
    }

    defines
    {
        "_CRT_SECURE_NO_WARNINGS",
		"NOMINMAX",
    }

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

	filter "configurations:Debug"
		runtime "Debug"
		defines "_DEBUG"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		defines "NDEBUG"
		optimize "On"
