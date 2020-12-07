#include <cstdlib>
#include <ctime>
#include <lua.hpp>

int data[20], line[7] = {0, 3, 7, 12, 16, 19};

int GetData(int n) { return data[n - 1]; }

int GetData(lua_State* L) {
    int n = lua_tonumber(L, 1);
    lua_pushnumber(L, GetData(n));
    return 1;
}

void increase(int n) {
    if (data[n - 1] != 0) {
        data[n - 1] *= 2;
    } else {
        data[n - 1] = 2;
    }
}

int increase(lua_State* L) {
    int n = lua_tonumber(L, 1);
    increase(n);
    return 0;
}

void del(int n) { data[n - 1] = 0; }

int del(lua_State* L) {
    int n = lua_tonumber(L, 1);
    del(n);
    return 0;
}

void Move(int key) {
    // data[0] = key;
    void MoveA(), MoveD(), MoveQ(), MoveE(), MoveZ(), MoveC();
    switch (key) {
        case 3:
            MoveA();
            break;
        case 4:
            MoveD();
            break;
        case 1:
            MoveQ();
            break;
        case 2:
            MoveE();
            break;
        case 5:
            MoveZ();
            break;
        case 6:
            MoveC();
            break;
        default:
            break;
    }
    unsigned seed;
    int i = 0;
    seed = time(0);
    srand(seed);
    int NewNum = rand() % 4 + 2;
    for (i = 0; i < NewNum; i++) {
        int position = rand() % 20;
        if (data[position] == 0) {
            data[position] = 2;
        }
    }
    key = 0;
}

int Move(lua_State* L) {
    int key = lua_tonumber(L, 1);
    Move(key);
    return 0;
}

int IsWin() {
    int i = 0;
    for (i = 0; i < 20; i++) {
        if (data[i] == 2048) {
            return 1;
        }
    }
    return 0;
}

int IsWin(lua_State* L) {
    lua_pushnumber(L, IsWin());
    return 1;
}

extern "C" {
int luaopen_libraries_operators(lua_State* L) {
    constexpr luaL_Reg functions[] = {
        {"GetData", GetData}, {"increase", increase}, {"del", del},
        {"Move", Move},       {"IsWin", IsWin},       {NULL, NULL}};
    luaL_register(L, "operators", functions);
    return 1;
}
}

void MoveA() {
    int i = 0, j = 0;
    void merge(int[]);
    for (i = 0; i < 5; i++) {
        int k = 0, temp[6] = {0, 0, 0, 0, 0};
        for (j = line[i]; j < line[i + 1]; j++) {
            if (data[j] != 0) {
                temp[k] = data[j];
                k++;
            }
        }
        merge(temp);
        for (j = line[i], k = 0; temp[k] != 0; j++, k++) {
            data[j] = temp[k];
        }
        for (; j < line[i + 1]; j++) {
            data[j] = 0;
        }
    }
}

void MoveD() {
    int i = 0, j = 0;
    void merge(int[]);
    for (i = 0; i < 5; i++) {
        int k = 0, temp[6] = {0, 0, 0, 0, 0};
        for (j = line[i + 1] - 1; j >= line[i]; j--) {
            if (data[j] != 0) {
                temp[k] = data[j];
                k++;
            }
        }
        merge(temp);
        for (j = line[i + 1] - 1, k = 0; temp[k] != 0; j--, k++) {
            data[j] = temp[k];
        }
        for (; j >= line[i]; j--) {
            data[j] = 0;
        }
    }
}

void MoveQ() {
    int map[20] = {7,  12, 16, 3, 8,  13, 17, 0, 4, 9,
                   14, 18, 1,  5, 10, 15, 2,  6, 11};
    int i = 0, j = 0;
    void merge(int[]);
    for (i = 0; i < 5; i++) {
        int k = 0, temp[6] = {0, 0, 0, 0, 0};
        for (j = line[i]; j < line[i + 1]; j++) {
            if (data[map[j]] != 0) {
                temp[k] = data[map[j]];
                k++;
            }
        }
        merge(temp);
        for (j = line[i], k = 0; temp[k] != 0; j++, k++) {
            data[map[j]] = temp[k];
        }
        for (; j < line[i + 1]; j++) {
            data[map[j]] = 0;
        }
    }
}

void MoveE() {
    int map[20] = {0,  3,  7, 1,  4,  8,  12, 2,  5, 9,
                   13, 16, 6, 10, 14, 17, 11, 15, 18};
    int i = 0, j = 0;
    void merge(int[]);
    for (i = 0; i < 5; i++) {
        int k = 0, temp[6] = {0, 0, 0, 0, 0};
        for (j = line[i]; j < line[i + 1]; j++) {
            if (data[map[j]] != 0) {
                temp[k] = data[map[j]];
                k++;
            }
        }
        merge(temp);
        for (j = line[i], k = 0; temp[k] != 0; j++, k++) {
            data[map[j]] = temp[k];
        }
        for (; j < line[i + 1]; j++) {
            data[map[j]] = 0;
        }
    }
}

void MoveZ() {
    int map[20] = {0,  3,  7, 1,  4,  8,  12, 2,  5, 9,
                   13, 16, 6, 10, 14, 17, 11, 15, 18};
    int i = 0, j = 0;
    void merge(int[]);
    for (i = 0; i < 5; i++) {
        int k = 0, temp[6] = {0, 0, 0, 0, 0};
        for (j = line[i + 1] - 1; j >= line[i]; j--) {
            if (data[map[j]] != 0) {
                temp[k] = data[map[j]];
                k++;
            }
        }
        merge(temp);
        for (j = line[i + 1] - 1, k = 0; temp[k] != 0; j--, k++) {
            data[map[j]] = temp[k];
        }
        for (; j >= line[i]; j--) {
            data[map[j]] = 0;
        }
    }
}

void MoveC() {
    int map[20] = {7,  12, 16, 3, 8,  13, 17, 0, 4, 9,
                   14, 18, 1,  5, 10, 15, 2,  6, 11};
    int i = 0, j = 0;
    void merge(int[]);
    for (i = 0; i < 5; i++) {
        int k = 0, temp[6] = {0, 0, 0, 0, 0};
        for (j = line[i + 1] - 1; j >= line[i]; j--) {
            if (data[map[j]] != 0) {
                temp[k] = data[map[j]];
                k++;
            }
        }
        merge(temp);
        for (j = line[i + 1] - 1, k = 0; temp[k] != 0; j--, k++) {
            data[map[j]] = temp[k];
        }
        for (; j >= line[i]; j--) {
            data[map[j]] = 0;
        }
    }
}

void merge(int temp[]) {
    int j = 0, k = 0;
    for (k = 0; temp[k] != 0; k++) {
        if (temp[k] == temp[k + 1]) {
            temp[k] *= 2;
            temp[k + 1] = 0;
            int tempk = 0;
            for (tempk = k + 1; temp[tempk + 1] != 0; tempk++) {
                temp[tempk] = temp[tempk + 1];
                temp[tempk + 1] = 0;
            }
        }
    }
}