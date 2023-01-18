

INC_DIR = inc

SRC_DIR = src
ASM_DIR = asm
INC_DIR = inc/

BUILD_SRC_DIR = build


CU= nvcc
CXX= clang++


CXXFLAGS = -stdlib=libstdc++ -O2 -I$(INC_DIR) -std=c++11 -Wall 
CUFLAGS = -O2 -I$(INC_DIR) -std=c++11 
LDFLAGS = -lstdc++


# Modify this to add object files

OBJS_TEST = $(BUILD_SRC_DIR)/main.o 

OBJ_CUDA = $(BUILD_SRC_DIR)/array.o


test: $(OBJS_TEST)
	clang++ -o build/test $(OBJS_TEST) $(LDFLAGS)

test2: $(OBJ_CUDA)
	clang++ -o build/test $(OBJ_CUDA) $(LDFLAGS)





$(BUILD_SRC_DIR)/%.o: $(SRC_DIR)/%.cu
	$(CU)  -c $< -o $@ $(CUFLAGS)

$(BUILD_SRC_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) -c $< -o $@ $(CXXFLAGS)

clean: 
	rm -rf build/*.o

format:
	sh ./format.sh
