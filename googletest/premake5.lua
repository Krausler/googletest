outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "GoogleTest"
    kind "StaticLib" 
    language "C++" 
    cppdialect "C++17" 

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/**.h",
        "src/**.cc",
    } 

    includedirs {
        "include/",
        "."
    } 

    filter "configurations:Debug"
		runtime "Debug"
        symbols "on"

    filter "configurations:Release"
		runtime "Release"
		optimize "Speed"

    filter "configurations:Dist"
		runtime "Release"
		optimize "Speed"
		symbols "off"