//
// Created by Will Lee on 2021/12/30.
//

#include <cstdarg>
#include "graph_lists.h"

GraphLists::GraphLists(int listNum, int maxListNum) : listNum_(listNum), maxListNum_(maxListNum), lists_(maxListNum_) {}

bool GraphLists::AddNode(int val, int adjNums, ...) {
    if (listNum_ > maxListNum_ - 1 || adjNums > listNum_) {
        return false;
    }
    va_list args;
    va_start(args, adjNums);
    for(int i = 0; i < adjNums; ++i) {
        int node = va_arg(args, int);
        lists_[node].push_back(listNum_);
    }
    va_end(args);
    return true;
}

