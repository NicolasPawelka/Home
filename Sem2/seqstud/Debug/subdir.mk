################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Sequence.cpp \
../main.cpp \
../ooptool.cpp \
../seqstud.cpp \
../studi.cpp 

CPP_DEPS += \
./Sequence.d \
./main.d \
./ooptool.d \
./seqstud.d \
./studi.d 

OBJS += \
./Sequence.o \
./main.o \
./ooptool.o \
./seqstud.o \
./studi.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean--2e-

clean--2e-:
	-$(RM) ./Sequence.d ./Sequence.o ./main.d ./main.o ./ooptool.d ./ooptool.o ./seqstud.d ./seqstud.o ./studi.d ./studi.o

.PHONY: clean--2e-

