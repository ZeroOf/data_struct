//
// Created by Will Lee on 2021/12/30.
//

#ifndef DATA_STRUCT_GRAPH_RECTOR_H
#define DATA_STRUCT_GRAPH_RECTOR_H

#include <array>
template<int maxNodes>
class GraphMatrix {
 public:
  GraphMatrix() : nodes_{0} {}

 private:
  std::array<int, maxNodes * maxNodes> nodes_;
};

#endif //DATA_STRUCT_GRAPH_RECTOR_H
