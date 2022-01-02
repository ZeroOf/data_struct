//
// Created by Will Lee on 2021/12/30.
//

#ifndef DATA_STRUCT_GRAPH_LISTS_H
#define DATA_STRUCT_GRAPH_LISTS_H


#include <list>
#include <vector>

class GraphLists {
public:
    GraphLists(int listNum, int maxListNum);

    bool AddNode(int val, int adjNums, ...);

private:
    int listNum_;
    int maxListNum_;
    std::vector<std::list<int>> lists_;
};


#endif //DATA_STRUCT_GRAPH_LISTS_H
