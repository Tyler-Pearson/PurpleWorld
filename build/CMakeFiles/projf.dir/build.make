# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tyler/projects/final-project-Tyler-Pearson

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tyler/projects/final-project-Tyler-Pearson/build

# Include any dependencies generated for this target.
include CMakeFiles/projf.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/projf.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/projf.dir/flags.make

CMakeFiles/projf.dir/src/Texture.cpp.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/src/Texture.cpp.o: ../src/Texture.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/projf.dir/src/Texture.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projf.dir/src/Texture.cpp.o -c /home/tyler/projects/final-project-Tyler-Pearson/src/Texture.cpp

CMakeFiles/projf.dir/src/Texture.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projf.dir/src/Texture.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/src/Texture.cpp > CMakeFiles/projf.dir/src/Texture.cpp.i

CMakeFiles/projf.dir/src/Texture.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projf.dir/src/Texture.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/src/Texture.cpp -o CMakeFiles/projf.dir/src/Texture.cpp.s

CMakeFiles/projf.dir/src/Texture.cpp.o.requires:

.PHONY : CMakeFiles/projf.dir/src/Texture.cpp.o.requires

CMakeFiles/projf.dir/src/Texture.cpp.o.provides: CMakeFiles/projf.dir/src/Texture.cpp.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/src/Texture.cpp.o.provides.build
.PHONY : CMakeFiles/projf.dir/src/Texture.cpp.o.provides

CMakeFiles/projf.dir/src/Texture.cpp.o.provides.build: CMakeFiles/projf.dir/src/Texture.cpp.o


CMakeFiles/projf.dir/src/GLSL.cpp.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/src/GLSL.cpp.o: ../src/GLSL.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/projf.dir/src/GLSL.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projf.dir/src/GLSL.cpp.o -c /home/tyler/projects/final-project-Tyler-Pearson/src/GLSL.cpp

CMakeFiles/projf.dir/src/GLSL.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projf.dir/src/GLSL.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/src/GLSL.cpp > CMakeFiles/projf.dir/src/GLSL.cpp.i

CMakeFiles/projf.dir/src/GLSL.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projf.dir/src/GLSL.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/src/GLSL.cpp -o CMakeFiles/projf.dir/src/GLSL.cpp.s

CMakeFiles/projf.dir/src/GLSL.cpp.o.requires:

.PHONY : CMakeFiles/projf.dir/src/GLSL.cpp.o.requires

CMakeFiles/projf.dir/src/GLSL.cpp.o.provides: CMakeFiles/projf.dir/src/GLSL.cpp.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/src/GLSL.cpp.o.provides.build
.PHONY : CMakeFiles/projf.dir/src/GLSL.cpp.o.provides

CMakeFiles/projf.dir/src/GLSL.cpp.o.provides.build: CMakeFiles/projf.dir/src/GLSL.cpp.o


CMakeFiles/projf.dir/src/Shape.cpp.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/src/Shape.cpp.o: ../src/Shape.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/projf.dir/src/Shape.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projf.dir/src/Shape.cpp.o -c /home/tyler/projects/final-project-Tyler-Pearson/src/Shape.cpp

CMakeFiles/projf.dir/src/Shape.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projf.dir/src/Shape.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/src/Shape.cpp > CMakeFiles/projf.dir/src/Shape.cpp.i

CMakeFiles/projf.dir/src/Shape.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projf.dir/src/Shape.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/src/Shape.cpp -o CMakeFiles/projf.dir/src/Shape.cpp.s

CMakeFiles/projf.dir/src/Shape.cpp.o.requires:

.PHONY : CMakeFiles/projf.dir/src/Shape.cpp.o.requires

CMakeFiles/projf.dir/src/Shape.cpp.o.provides: CMakeFiles/projf.dir/src/Shape.cpp.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/src/Shape.cpp.o.provides.build
.PHONY : CMakeFiles/projf.dir/src/Shape.cpp.o.provides

CMakeFiles/projf.dir/src/Shape.cpp.o.provides.build: CMakeFiles/projf.dir/src/Shape.cpp.o


CMakeFiles/projf.dir/src/Program.cpp.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/src/Program.cpp.o: ../src/Program.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/projf.dir/src/Program.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projf.dir/src/Program.cpp.o -c /home/tyler/projects/final-project-Tyler-Pearson/src/Program.cpp

CMakeFiles/projf.dir/src/Program.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projf.dir/src/Program.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/src/Program.cpp > CMakeFiles/projf.dir/src/Program.cpp.i

CMakeFiles/projf.dir/src/Program.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projf.dir/src/Program.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/src/Program.cpp -o CMakeFiles/projf.dir/src/Program.cpp.s

CMakeFiles/projf.dir/src/Program.cpp.o.requires:

.PHONY : CMakeFiles/projf.dir/src/Program.cpp.o.requires

CMakeFiles/projf.dir/src/Program.cpp.o.provides: CMakeFiles/projf.dir/src/Program.cpp.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/src/Program.cpp.o.provides.build
.PHONY : CMakeFiles/projf.dir/src/Program.cpp.o.provides

CMakeFiles/projf.dir/src/Program.cpp.o.provides.build: CMakeFiles/projf.dir/src/Program.cpp.o


CMakeFiles/projf.dir/src/WindowManager.cpp.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/src/WindowManager.cpp.o: ../src/WindowManager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/projf.dir/src/WindowManager.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projf.dir/src/WindowManager.cpp.o -c /home/tyler/projects/final-project-Tyler-Pearson/src/WindowManager.cpp

CMakeFiles/projf.dir/src/WindowManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projf.dir/src/WindowManager.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/src/WindowManager.cpp > CMakeFiles/projf.dir/src/WindowManager.cpp.i

CMakeFiles/projf.dir/src/WindowManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projf.dir/src/WindowManager.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/src/WindowManager.cpp -o CMakeFiles/projf.dir/src/WindowManager.cpp.s

CMakeFiles/projf.dir/src/WindowManager.cpp.o.requires:

.PHONY : CMakeFiles/projf.dir/src/WindowManager.cpp.o.requires

CMakeFiles/projf.dir/src/WindowManager.cpp.o.provides: CMakeFiles/projf.dir/src/WindowManager.cpp.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/src/WindowManager.cpp.o.provides.build
.PHONY : CMakeFiles/projf.dir/src/WindowManager.cpp.o.provides

CMakeFiles/projf.dir/src/WindowManager.cpp.o.provides.build: CMakeFiles/projf.dir/src/WindowManager.cpp.o


CMakeFiles/projf.dir/src/MatrixStack.cpp.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/src/MatrixStack.cpp.o: ../src/MatrixStack.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/projf.dir/src/MatrixStack.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projf.dir/src/MatrixStack.cpp.o -c /home/tyler/projects/final-project-Tyler-Pearson/src/MatrixStack.cpp

CMakeFiles/projf.dir/src/MatrixStack.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projf.dir/src/MatrixStack.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/src/MatrixStack.cpp > CMakeFiles/projf.dir/src/MatrixStack.cpp.i

CMakeFiles/projf.dir/src/MatrixStack.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projf.dir/src/MatrixStack.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/src/MatrixStack.cpp -o CMakeFiles/projf.dir/src/MatrixStack.cpp.s

CMakeFiles/projf.dir/src/MatrixStack.cpp.o.requires:

.PHONY : CMakeFiles/projf.dir/src/MatrixStack.cpp.o.requires

CMakeFiles/projf.dir/src/MatrixStack.cpp.o.provides: CMakeFiles/projf.dir/src/MatrixStack.cpp.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/src/MatrixStack.cpp.o.provides.build
.PHONY : CMakeFiles/projf.dir/src/MatrixStack.cpp.o.provides

CMakeFiles/projf.dir/src/MatrixStack.cpp.o.provides.build: CMakeFiles/projf.dir/src/MatrixStack.cpp.o


CMakeFiles/projf.dir/src/HeightGenerator.cpp.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/src/HeightGenerator.cpp.o: ../src/HeightGenerator.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/projf.dir/src/HeightGenerator.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projf.dir/src/HeightGenerator.cpp.o -c /home/tyler/projects/final-project-Tyler-Pearson/src/HeightGenerator.cpp

CMakeFiles/projf.dir/src/HeightGenerator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projf.dir/src/HeightGenerator.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/src/HeightGenerator.cpp > CMakeFiles/projf.dir/src/HeightGenerator.cpp.i

CMakeFiles/projf.dir/src/HeightGenerator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projf.dir/src/HeightGenerator.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/src/HeightGenerator.cpp -o CMakeFiles/projf.dir/src/HeightGenerator.cpp.s

CMakeFiles/projf.dir/src/HeightGenerator.cpp.o.requires:

.PHONY : CMakeFiles/projf.dir/src/HeightGenerator.cpp.o.requires

CMakeFiles/projf.dir/src/HeightGenerator.cpp.o.provides: CMakeFiles/projf.dir/src/HeightGenerator.cpp.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/src/HeightGenerator.cpp.o.provides.build
.PHONY : CMakeFiles/projf.dir/src/HeightGenerator.cpp.o.provides

CMakeFiles/projf.dir/src/HeightGenerator.cpp.o.provides.build: CMakeFiles/projf.dir/src/HeightGenerator.cpp.o


CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o: ../src/GLTextureWriter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o -c /home/tyler/projects/final-project-Tyler-Pearson/src/GLTextureWriter.cpp

CMakeFiles/projf.dir/src/GLTextureWriter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projf.dir/src/GLTextureWriter.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/src/GLTextureWriter.cpp > CMakeFiles/projf.dir/src/GLTextureWriter.cpp.i

CMakeFiles/projf.dir/src/GLTextureWriter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projf.dir/src/GLTextureWriter.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/src/GLTextureWriter.cpp -o CMakeFiles/projf.dir/src/GLTextureWriter.cpp.s

CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o.requires:

.PHONY : CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o.requires

CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o.provides: CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o.provides.build
.PHONY : CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o.provides

CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o.provides.build: CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o


CMakeFiles/projf.dir/src/main.cpp.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/projf.dir/src/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projf.dir/src/main.cpp.o -c /home/tyler/projects/final-project-Tyler-Pearson/src/main.cpp

CMakeFiles/projf.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projf.dir/src/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/src/main.cpp > CMakeFiles/projf.dir/src/main.cpp.i

CMakeFiles/projf.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projf.dir/src/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/src/main.cpp -o CMakeFiles/projf.dir/src/main.cpp.s

CMakeFiles/projf.dir/src/main.cpp.o.requires:

.PHONY : CMakeFiles/projf.dir/src/main.cpp.o.requires

CMakeFiles/projf.dir/src/main.cpp.o.provides: CMakeFiles/projf.dir/src/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/src/main.cpp.o.provides.build
.PHONY : CMakeFiles/projf.dir/src/main.cpp.o.provides

CMakeFiles/projf.dir/src/main.cpp.o.provides.build: CMakeFiles/projf.dir/src/main.cpp.o


CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o: ../ext/tiny_obj_loader/tiny_obj_loader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o -c /home/tyler/projects/final-project-Tyler-Pearson/ext/tiny_obj_loader/tiny_obj_loader.cpp

CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/ext/tiny_obj_loader/tiny_obj_loader.cpp > CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.i

CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/ext/tiny_obj_loader/tiny_obj_loader.cpp -o CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.s

CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o.requires:

.PHONY : CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o.requires

CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o.provides: CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o.provides.build
.PHONY : CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o.provides

CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o.provides.build: CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o


CMakeFiles/projf.dir/ext/glad/src/glad.c.o: CMakeFiles/projf.dir/flags.make
CMakeFiles/projf.dir/ext/glad/src/glad.c.o: ../ext/glad/src/glad.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/projf.dir/ext/glad/src/glad.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/projf.dir/ext/glad/src/glad.c.o   -c /home/tyler/projects/final-project-Tyler-Pearson/ext/glad/src/glad.c

CMakeFiles/projf.dir/ext/glad/src/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/projf.dir/ext/glad/src/glad.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/tyler/projects/final-project-Tyler-Pearson/ext/glad/src/glad.c > CMakeFiles/projf.dir/ext/glad/src/glad.c.i

CMakeFiles/projf.dir/ext/glad/src/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/projf.dir/ext/glad/src/glad.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/tyler/projects/final-project-Tyler-Pearson/ext/glad/src/glad.c -o CMakeFiles/projf.dir/ext/glad/src/glad.c.s

CMakeFiles/projf.dir/ext/glad/src/glad.c.o.requires:

.PHONY : CMakeFiles/projf.dir/ext/glad/src/glad.c.o.requires

CMakeFiles/projf.dir/ext/glad/src/glad.c.o.provides: CMakeFiles/projf.dir/ext/glad/src/glad.c.o.requires
	$(MAKE) -f CMakeFiles/projf.dir/build.make CMakeFiles/projf.dir/ext/glad/src/glad.c.o.provides.build
.PHONY : CMakeFiles/projf.dir/ext/glad/src/glad.c.o.provides

CMakeFiles/projf.dir/ext/glad/src/glad.c.o.provides.build: CMakeFiles/projf.dir/ext/glad/src/glad.c.o


# Object files for target projf
projf_OBJECTS = \
"CMakeFiles/projf.dir/src/Texture.cpp.o" \
"CMakeFiles/projf.dir/src/GLSL.cpp.o" \
"CMakeFiles/projf.dir/src/Shape.cpp.o" \
"CMakeFiles/projf.dir/src/Program.cpp.o" \
"CMakeFiles/projf.dir/src/WindowManager.cpp.o" \
"CMakeFiles/projf.dir/src/MatrixStack.cpp.o" \
"CMakeFiles/projf.dir/src/HeightGenerator.cpp.o" \
"CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o" \
"CMakeFiles/projf.dir/src/main.cpp.o" \
"CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o" \
"CMakeFiles/projf.dir/ext/glad/src/glad.c.o"

# External object files for target projf
projf_EXTERNAL_OBJECTS =

projf: CMakeFiles/projf.dir/src/Texture.cpp.o
projf: CMakeFiles/projf.dir/src/GLSL.cpp.o
projf: CMakeFiles/projf.dir/src/Shape.cpp.o
projf: CMakeFiles/projf.dir/src/Program.cpp.o
projf: CMakeFiles/projf.dir/src/WindowManager.cpp.o
projf: CMakeFiles/projf.dir/src/MatrixStack.cpp.o
projf: CMakeFiles/projf.dir/src/HeightGenerator.cpp.o
projf: CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o
projf: CMakeFiles/projf.dir/src/main.cpp.o
projf: CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o
projf: CMakeFiles/projf.dir/ext/glad/src/glad.c.o
projf: CMakeFiles/projf.dir/build.make
projf: CMakeFiles/projf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Linking CXX executable projf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/projf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/projf.dir/build: projf

.PHONY : CMakeFiles/projf.dir/build

CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/src/Texture.cpp.o.requires
CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/src/GLSL.cpp.o.requires
CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/src/Shape.cpp.o.requires
CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/src/Program.cpp.o.requires
CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/src/WindowManager.cpp.o.requires
CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/src/MatrixStack.cpp.o.requires
CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/src/HeightGenerator.cpp.o.requires
CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/src/GLTextureWriter.cpp.o.requires
CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/src/main.cpp.o.requires
CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/ext/tiny_obj_loader/tiny_obj_loader.cpp.o.requires
CMakeFiles/projf.dir/requires: CMakeFiles/projf.dir/ext/glad/src/glad.c.o.requires

.PHONY : CMakeFiles/projf.dir/requires

CMakeFiles/projf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/projf.dir/cmake_clean.cmake
.PHONY : CMakeFiles/projf.dir/clean

CMakeFiles/projf.dir/depend:
	cd /home/tyler/projects/final-project-Tyler-Pearson/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tyler/projects/final-project-Tyler-Pearson /home/tyler/projects/final-project-Tyler-Pearson /home/tyler/projects/final-project-Tyler-Pearson/build /home/tyler/projects/final-project-Tyler-Pearson/build /home/tyler/projects/final-project-Tyler-Pearson/build/CMakeFiles/projf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/projf.dir/depend

