cmake_minimum_required(VERSION 3.12)
project(tinyos3 C)

set(CMAKE_C_STANDARD 11)

include_directories(.)

add_executable(tinyos3
        bios.c
        bios.h
        bios_example1.c
        bios_example2.c
        bios_example3.c
        bios_example4.c
        bios_example5.c
        console.c
        kernel_cc.c
        kernel_cc.h
        kernel_dev.c
        kernel_dev.h
        kernel_init.c
        kernel_pipe.c
        kernel_proc.c
        kernel_proc.h
        kernel_sched.c
        kernel_sched.h
        kernel_socket.c
        kernel_streams.c
        kernel_streams.h
        kernel_sys.c
        kernel_sys.h
        kernel_threads.c
        mtask.c
        symposium.c
        symposium.h
        terminal.c
        test_example.c
        test_util.c
        tinyos.h
        tinyos_shell.c
        tinyoslib.c
        tinyoslib.h
        unit_testing.c
        unit_testing.h
        util.c
        util.h
        validate_api.c)
