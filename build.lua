project "glslang"

	-- Output Directories --
	location "%{wks.location}/Dependencies/glslang"

	targetdir (target_dir)
	objdir    (object_dir)

	-- Compiler --
	kind "StaticLib"
	language "C++"

	-- Project Files ---
	files
	{
		-- source
		"%{prj.location}/glslang/**.cpp",

		-- headers
		"%{prj.location}/glslang/**.h",

		-- build.lua
		"%{prj.location}/build.lua",
	}
	
	excludes
	{
		"glslang/OSDependent/Unix/ossource.cpp",
		"glslang/OSDependent/Web/glslang.js.cpp",
	}

	-- Includes --
	includedirs
	{
		"%{prj.location}/",
		"%{prj.location}/OGLCompilersDLL",
	}

	--- Filters ---
	-- windows
	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		files
		{
			"%{prj.location}/glslang/OSDependent/Windows/**",
		}

		defines 
		{ 
			"_CRT_SECURE_NO_WARNINGS",
			"ENABLE_HLSL"
		}

		flags { "MultiProcessorCompile" }

	-- debug
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	-- release
	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	-- distribution
	filter "configurations:Distribution"
		runtime "Release"
		optimize "full"


