# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

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
CMAKE_COMMAND = /home/almidi/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/182.3684.76/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/almidi/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/182.3684.76/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/almidi/TUC/OS/tinyos3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/almidi/TUC/OS/tinyos3/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/tinyos3.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/tinyos3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tinyos3.dir/flags.make

CMakeFiles/tinyos3.dir/bios.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/bios.c.o: ../bios.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/tinyos3.dir/bios.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/bios.c.o   -c /home/almidi/TUC/OS/tinyos3/bios.c

CMakeFiles/tinyos3.dir/bios.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/bios.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/bios.c > CMakeFiles/tinyos3.dir/bios.c.i

CMakeFiles/tinyos3.dir/bios.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/bios.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/bios.c -o CMakeFiles/tinyos3.dir/bios.c.s

CMakeFiles/tinyos3.dir/bios_example1.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/bios_example1.c.o: ../bios_example1.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/tinyos3.dir/bios_example1.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/bios_example1.c.o   -c /home/almidi/TUC/OS/tinyos3/bios_example1.c

CMakeFiles/tinyos3.dir/bios_example1.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/bios_example1.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/bios_example1.c > CMakeFiles/tinyos3.dir/bios_example1.c.i

CMakeFiles/tinyos3.dir/bios_example1.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/bios_example1.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/bios_example1.c -o CMakeFiles/tinyos3.dir/bios_example1.c.s

CMakeFiles/tinyos3.dir/bios_example2.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/bios_example2.c.o: ../bios_example2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/tinyos3.dir/bios_example2.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/bios_example2.c.o   -c /home/almidi/TUC/OS/tinyos3/bios_example2.c

CMakeFiles/tinyos3.dir/bios_example2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/bios_example2.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/bios_example2.c > CMakeFiles/tinyos3.dir/bios_example2.c.i

CMakeFiles/tinyos3.dir/bios_example2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/bios_example2.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/bios_example2.c -o CMakeFiles/tinyos3.dir/bios_example2.c.s

CMakeFiles/tinyos3.dir/bios_example3.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/bios_example3.c.o: ../bios_example3.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/tinyos3.dir/bios_example3.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/bios_example3.c.o   -c /home/almidi/TUC/OS/tinyos3/bios_example3.c

CMakeFiles/tinyos3.dir/bios_example3.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/bios_example3.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/bios_example3.c > CMakeFiles/tinyos3.dir/bios_example3.c.i

CMakeFiles/tinyos3.dir/bios_example3.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/bios_example3.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/bios_example3.c -o CMakeFiles/tinyos3.dir/bios_example3.c.s

CMakeFiles/tinyos3.dir/bios_example4.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/bios_example4.c.o: ../bios_example4.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/tinyos3.dir/bios_example4.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/bios_example4.c.o   -c /home/almidi/TUC/OS/tinyos3/bios_example4.c

CMakeFiles/tinyos3.dir/bios_example4.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/bios_example4.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/bios_example4.c > CMakeFiles/tinyos3.dir/bios_example4.c.i

CMakeFiles/tinyos3.dir/bios_example4.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/bios_example4.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/bios_example4.c -o CMakeFiles/tinyos3.dir/bios_example4.c.s

CMakeFiles/tinyos3.dir/bios_example5.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/bios_example5.c.o: ../bios_example5.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/tinyos3.dir/bios_example5.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/bios_example5.c.o   -c /home/almidi/TUC/OS/tinyos3/bios_example5.c

CMakeFiles/tinyos3.dir/bios_example5.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/bios_example5.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/bios_example5.c > CMakeFiles/tinyos3.dir/bios_example5.c.i

CMakeFiles/tinyos3.dir/bios_example5.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/bios_example5.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/bios_example5.c -o CMakeFiles/tinyos3.dir/bios_example5.c.s

CMakeFiles/tinyos3.dir/console.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/console.c.o: ../console.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/tinyos3.dir/console.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/console.c.o   -c /home/almidi/TUC/OS/tinyos3/console.c

CMakeFiles/tinyos3.dir/console.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/console.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/console.c > CMakeFiles/tinyos3.dir/console.c.i

CMakeFiles/tinyos3.dir/console.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/console.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/console.c -o CMakeFiles/tinyos3.dir/console.c.s

CMakeFiles/tinyos3.dir/kernel_cc.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/kernel_cc.c.o: ../kernel_cc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/tinyos3.dir/kernel_cc.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/kernel_cc.c.o   -c /home/almidi/TUC/OS/tinyos3/kernel_cc.c

CMakeFiles/tinyos3.dir/kernel_cc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/kernel_cc.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/kernel_cc.c > CMakeFiles/tinyos3.dir/kernel_cc.c.i

CMakeFiles/tinyos3.dir/kernel_cc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/kernel_cc.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/kernel_cc.c -o CMakeFiles/tinyos3.dir/kernel_cc.c.s

CMakeFiles/tinyos3.dir/kernel_dev.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/kernel_dev.c.o: ../kernel_dev.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/tinyos3.dir/kernel_dev.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/kernel_dev.c.o   -c /home/almidi/TUC/OS/tinyos3/kernel_dev.c

CMakeFiles/tinyos3.dir/kernel_dev.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/kernel_dev.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/kernel_dev.c > CMakeFiles/tinyos3.dir/kernel_dev.c.i

CMakeFiles/tinyos3.dir/kernel_dev.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/kernel_dev.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/kernel_dev.c -o CMakeFiles/tinyos3.dir/kernel_dev.c.s

CMakeFiles/tinyos3.dir/kernel_init.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/kernel_init.c.o: ../kernel_init.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/tinyos3.dir/kernel_init.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/kernel_init.c.o   -c /home/almidi/TUC/OS/tinyos3/kernel_init.c

CMakeFiles/tinyos3.dir/kernel_init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/kernel_init.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/kernel_init.c > CMakeFiles/tinyos3.dir/kernel_init.c.i

CMakeFiles/tinyos3.dir/kernel_init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/kernel_init.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/kernel_init.c -o CMakeFiles/tinyos3.dir/kernel_init.c.s

CMakeFiles/tinyos3.dir/kernel_pipe.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/kernel_pipe.c.o: ../kernel_pipe.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/tinyos3.dir/kernel_pipe.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/kernel_pipe.c.o   -c /home/almidi/TUC/OS/tinyos3/kernel_pipe.c

CMakeFiles/tinyos3.dir/kernel_pipe.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/kernel_pipe.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/kernel_pipe.c > CMakeFiles/tinyos3.dir/kernel_pipe.c.i

CMakeFiles/tinyos3.dir/kernel_pipe.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/kernel_pipe.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/kernel_pipe.c -o CMakeFiles/tinyos3.dir/kernel_pipe.c.s

CMakeFiles/tinyos3.dir/kernel_proc.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/kernel_proc.c.o: ../kernel_proc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/tinyos3.dir/kernel_proc.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/kernel_proc.c.o   -c /home/almidi/TUC/OS/tinyos3/kernel_proc.c

CMakeFiles/tinyos3.dir/kernel_proc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/kernel_proc.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/kernel_proc.c > CMakeFiles/tinyos3.dir/kernel_proc.c.i

CMakeFiles/tinyos3.dir/kernel_proc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/kernel_proc.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/kernel_proc.c -o CMakeFiles/tinyos3.dir/kernel_proc.c.s

CMakeFiles/tinyos3.dir/kernel_sched.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/kernel_sched.c.o: ../kernel_sched.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/tinyos3.dir/kernel_sched.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/kernel_sched.c.o   -c /home/almidi/TUC/OS/tinyos3/kernel_sched.c

CMakeFiles/tinyos3.dir/kernel_sched.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/kernel_sched.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/kernel_sched.c > CMakeFiles/tinyos3.dir/kernel_sched.c.i

CMakeFiles/tinyos3.dir/kernel_sched.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/kernel_sched.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/kernel_sched.c -o CMakeFiles/tinyos3.dir/kernel_sched.c.s

CMakeFiles/tinyos3.dir/kernel_socket.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/kernel_socket.c.o: ../kernel_socket.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/tinyos3.dir/kernel_socket.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/kernel_socket.c.o   -c /home/almidi/TUC/OS/tinyos3/kernel_socket.c

CMakeFiles/tinyos3.dir/kernel_socket.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/kernel_socket.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/kernel_socket.c > CMakeFiles/tinyos3.dir/kernel_socket.c.i

CMakeFiles/tinyos3.dir/kernel_socket.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/kernel_socket.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/kernel_socket.c -o CMakeFiles/tinyos3.dir/kernel_socket.c.s

CMakeFiles/tinyos3.dir/kernel_streams.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/kernel_streams.c.o: ../kernel_streams.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/tinyos3.dir/kernel_streams.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/kernel_streams.c.o   -c /home/almidi/TUC/OS/tinyos3/kernel_streams.c

CMakeFiles/tinyos3.dir/kernel_streams.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/kernel_streams.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/kernel_streams.c > CMakeFiles/tinyos3.dir/kernel_streams.c.i

CMakeFiles/tinyos3.dir/kernel_streams.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/kernel_streams.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/kernel_streams.c -o CMakeFiles/tinyos3.dir/kernel_streams.c.s

CMakeFiles/tinyos3.dir/kernel_sys.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/kernel_sys.c.o: ../kernel_sys.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object CMakeFiles/tinyos3.dir/kernel_sys.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/kernel_sys.c.o   -c /home/almidi/TUC/OS/tinyos3/kernel_sys.c

CMakeFiles/tinyos3.dir/kernel_sys.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/kernel_sys.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/kernel_sys.c > CMakeFiles/tinyos3.dir/kernel_sys.c.i

CMakeFiles/tinyos3.dir/kernel_sys.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/kernel_sys.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/kernel_sys.c -o CMakeFiles/tinyos3.dir/kernel_sys.c.s

CMakeFiles/tinyos3.dir/kernel_threads.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/kernel_threads.c.o: ../kernel_threads.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building C object CMakeFiles/tinyos3.dir/kernel_threads.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/kernel_threads.c.o   -c /home/almidi/TUC/OS/tinyos3/kernel_threads.c

CMakeFiles/tinyos3.dir/kernel_threads.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/kernel_threads.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/kernel_threads.c > CMakeFiles/tinyos3.dir/kernel_threads.c.i

CMakeFiles/tinyos3.dir/kernel_threads.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/kernel_threads.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/kernel_threads.c -o CMakeFiles/tinyos3.dir/kernel_threads.c.s

CMakeFiles/tinyos3.dir/mtask.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/mtask.c.o: ../mtask.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building C object CMakeFiles/tinyos3.dir/mtask.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/mtask.c.o   -c /home/almidi/TUC/OS/tinyos3/mtask.c

CMakeFiles/tinyos3.dir/mtask.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/mtask.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/mtask.c > CMakeFiles/tinyos3.dir/mtask.c.i

CMakeFiles/tinyos3.dir/mtask.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/mtask.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/mtask.c -o CMakeFiles/tinyos3.dir/mtask.c.s

CMakeFiles/tinyos3.dir/symposium.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/symposium.c.o: ../symposium.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Building C object CMakeFiles/tinyos3.dir/symposium.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/symposium.c.o   -c /home/almidi/TUC/OS/tinyos3/symposium.c

CMakeFiles/tinyos3.dir/symposium.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/symposium.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/symposium.c > CMakeFiles/tinyos3.dir/symposium.c.i

CMakeFiles/tinyos3.dir/symposium.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/symposium.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/symposium.c -o CMakeFiles/tinyos3.dir/symposium.c.s

CMakeFiles/tinyos3.dir/terminal.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/terminal.c.o: ../terminal.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_20) "Building C object CMakeFiles/tinyos3.dir/terminal.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/terminal.c.o   -c /home/almidi/TUC/OS/tinyos3/terminal.c

CMakeFiles/tinyos3.dir/terminal.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/terminal.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/terminal.c > CMakeFiles/tinyos3.dir/terminal.c.i

CMakeFiles/tinyos3.dir/terminal.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/terminal.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/terminal.c -o CMakeFiles/tinyos3.dir/terminal.c.s

CMakeFiles/tinyos3.dir/test_example.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/test_example.c.o: ../test_example.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_21) "Building C object CMakeFiles/tinyos3.dir/test_example.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/test_example.c.o   -c /home/almidi/TUC/OS/tinyos3/test_example.c

CMakeFiles/tinyos3.dir/test_example.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/test_example.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/test_example.c > CMakeFiles/tinyos3.dir/test_example.c.i

CMakeFiles/tinyos3.dir/test_example.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/test_example.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/test_example.c -o CMakeFiles/tinyos3.dir/test_example.c.s

CMakeFiles/tinyos3.dir/test_util.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/test_util.c.o: ../test_util.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_22) "Building C object CMakeFiles/tinyos3.dir/test_util.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/test_util.c.o   -c /home/almidi/TUC/OS/tinyos3/test_util.c

CMakeFiles/tinyos3.dir/test_util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/test_util.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/test_util.c > CMakeFiles/tinyos3.dir/test_util.c.i

CMakeFiles/tinyos3.dir/test_util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/test_util.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/test_util.c -o CMakeFiles/tinyos3.dir/test_util.c.s

CMakeFiles/tinyos3.dir/tinyos_shell.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/tinyos_shell.c.o: ../tinyos_shell.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_23) "Building C object CMakeFiles/tinyos3.dir/tinyos_shell.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/tinyos_shell.c.o   -c /home/almidi/TUC/OS/tinyos3/tinyos_shell.c

CMakeFiles/tinyos3.dir/tinyos_shell.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/tinyos_shell.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/tinyos_shell.c > CMakeFiles/tinyos3.dir/tinyos_shell.c.i

CMakeFiles/tinyos3.dir/tinyos_shell.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/tinyos_shell.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/tinyos_shell.c -o CMakeFiles/tinyos3.dir/tinyos_shell.c.s

CMakeFiles/tinyos3.dir/tinyoslib.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/tinyoslib.c.o: ../tinyoslib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_24) "Building C object CMakeFiles/tinyos3.dir/tinyoslib.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/tinyoslib.c.o   -c /home/almidi/TUC/OS/tinyos3/tinyoslib.c

CMakeFiles/tinyos3.dir/tinyoslib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/tinyoslib.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/tinyoslib.c > CMakeFiles/tinyos3.dir/tinyoslib.c.i

CMakeFiles/tinyos3.dir/tinyoslib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/tinyoslib.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/tinyoslib.c -o CMakeFiles/tinyos3.dir/tinyoslib.c.s

CMakeFiles/tinyos3.dir/unit_testing.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/unit_testing.c.o: ../unit_testing.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_25) "Building C object CMakeFiles/tinyos3.dir/unit_testing.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/unit_testing.c.o   -c /home/almidi/TUC/OS/tinyos3/unit_testing.c

CMakeFiles/tinyos3.dir/unit_testing.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/unit_testing.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/unit_testing.c > CMakeFiles/tinyos3.dir/unit_testing.c.i

CMakeFiles/tinyos3.dir/unit_testing.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/unit_testing.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/unit_testing.c -o CMakeFiles/tinyos3.dir/unit_testing.c.s

CMakeFiles/tinyos3.dir/util.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/util.c.o: ../util.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_26) "Building C object CMakeFiles/tinyos3.dir/util.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/util.c.o   -c /home/almidi/TUC/OS/tinyos3/util.c

CMakeFiles/tinyos3.dir/util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/util.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/util.c > CMakeFiles/tinyos3.dir/util.c.i

CMakeFiles/tinyos3.dir/util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/util.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/util.c -o CMakeFiles/tinyos3.dir/util.c.s

CMakeFiles/tinyos3.dir/validate_api.c.o: CMakeFiles/tinyos3.dir/flags.make
CMakeFiles/tinyos3.dir/validate_api.c.o: ../validate_api.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_27) "Building C object CMakeFiles/tinyos3.dir/validate_api.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tinyos3.dir/validate_api.c.o   -c /home/almidi/TUC/OS/tinyos3/validate_api.c

CMakeFiles/tinyos3.dir/validate_api.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tinyos3.dir/validate_api.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/almidi/TUC/OS/tinyos3/validate_api.c > CMakeFiles/tinyos3.dir/validate_api.c.i

CMakeFiles/tinyos3.dir/validate_api.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tinyos3.dir/validate_api.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/almidi/TUC/OS/tinyos3/validate_api.c -o CMakeFiles/tinyos3.dir/validate_api.c.s

# Object files for target tinyos3
tinyos3_OBJECTS = \
"CMakeFiles/tinyos3.dir/bios.c.o" \
"CMakeFiles/tinyos3.dir/bios_example1.c.o" \
"CMakeFiles/tinyos3.dir/bios_example2.c.o" \
"CMakeFiles/tinyos3.dir/bios_example3.c.o" \
"CMakeFiles/tinyos3.dir/bios_example4.c.o" \
"CMakeFiles/tinyos3.dir/bios_example5.c.o" \
"CMakeFiles/tinyos3.dir/console.c.o" \
"CMakeFiles/tinyos3.dir/kernel_cc.c.o" \
"CMakeFiles/tinyos3.dir/kernel_dev.c.o" \
"CMakeFiles/tinyos3.dir/kernel_init.c.o" \
"CMakeFiles/tinyos3.dir/kernel_pipe.c.o" \
"CMakeFiles/tinyos3.dir/kernel_proc.c.o" \
"CMakeFiles/tinyos3.dir/kernel_sched.c.o" \
"CMakeFiles/tinyos3.dir/kernel_socket.c.o" \
"CMakeFiles/tinyos3.dir/kernel_streams.c.o" \
"CMakeFiles/tinyos3.dir/kernel_sys.c.o" \
"CMakeFiles/tinyos3.dir/kernel_threads.c.o" \
"CMakeFiles/tinyos3.dir/mtask.c.o" \
"CMakeFiles/tinyos3.dir/symposium.c.o" \
"CMakeFiles/tinyos3.dir/terminal.c.o" \
"CMakeFiles/tinyos3.dir/test_example.c.o" \
"CMakeFiles/tinyos3.dir/test_util.c.o" \
"CMakeFiles/tinyos3.dir/tinyos_shell.c.o" \
"CMakeFiles/tinyos3.dir/tinyoslib.c.o" \
"CMakeFiles/tinyos3.dir/unit_testing.c.o" \
"CMakeFiles/tinyos3.dir/util.c.o" \
"CMakeFiles/tinyos3.dir/validate_api.c.o"

# External object files for target tinyos3
tinyos3_EXTERNAL_OBJECTS =

tinyos3: CMakeFiles/tinyos3.dir/bios.c.o
tinyos3: CMakeFiles/tinyos3.dir/bios_example1.c.o
tinyos3: CMakeFiles/tinyos3.dir/bios_example2.c.o
tinyos3: CMakeFiles/tinyos3.dir/bios_example3.c.o
tinyos3: CMakeFiles/tinyos3.dir/bios_example4.c.o
tinyos3: CMakeFiles/tinyos3.dir/bios_example5.c.o
tinyos3: CMakeFiles/tinyos3.dir/console.c.o
tinyos3: CMakeFiles/tinyos3.dir/kernel_cc.c.o
tinyos3: CMakeFiles/tinyos3.dir/kernel_dev.c.o
tinyos3: CMakeFiles/tinyos3.dir/kernel_init.c.o
tinyos3: CMakeFiles/tinyos3.dir/kernel_pipe.c.o
tinyos3: CMakeFiles/tinyos3.dir/kernel_proc.c.o
tinyos3: CMakeFiles/tinyos3.dir/kernel_sched.c.o
tinyos3: CMakeFiles/tinyos3.dir/kernel_socket.c.o
tinyos3: CMakeFiles/tinyos3.dir/kernel_streams.c.o
tinyos3: CMakeFiles/tinyos3.dir/kernel_sys.c.o
tinyos3: CMakeFiles/tinyos3.dir/kernel_threads.c.o
tinyos3: CMakeFiles/tinyos3.dir/mtask.c.o
tinyos3: CMakeFiles/tinyos3.dir/symposium.c.o
tinyos3: CMakeFiles/tinyos3.dir/terminal.c.o
tinyos3: CMakeFiles/tinyos3.dir/test_example.c.o
tinyos3: CMakeFiles/tinyos3.dir/test_util.c.o
tinyos3: CMakeFiles/tinyos3.dir/tinyos_shell.c.o
tinyos3: CMakeFiles/tinyos3.dir/tinyoslib.c.o
tinyos3: CMakeFiles/tinyos3.dir/unit_testing.c.o
tinyos3: CMakeFiles/tinyos3.dir/util.c.o
tinyos3: CMakeFiles/tinyos3.dir/validate_api.c.o
tinyos3: CMakeFiles/tinyos3.dir/build.make
tinyos3: CMakeFiles/tinyos3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_28) "Linking C executable tinyos3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tinyos3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/tinyos3.dir/build: tinyos3

.PHONY : CMakeFiles/tinyos3.dir/build

CMakeFiles/tinyos3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tinyos3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tinyos3.dir/clean

CMakeFiles/tinyos3.dir/depend:
	cd /home/almidi/TUC/OS/tinyos3/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/almidi/TUC/OS/tinyos3 /home/almidi/TUC/OS/tinyos3 /home/almidi/TUC/OS/tinyos3/cmake-build-debug /home/almidi/TUC/OS/tinyos3/cmake-build-debug /home/almidi/TUC/OS/tinyos3/cmake-build-debug/CMakeFiles/tinyos3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tinyos3.dir/depend

