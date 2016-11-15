#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>
#include <cctype>

#include "thumbsim.hpp"

void parseMem(ifstream & in, string type) {
  string s;
  unsigned int data, addr;
  in >> s;
  transform(s.begin(), s.end(), s.begin(), (int(*)(int))tolower);
  transform(type.begin(), type.end(), type.begin(), 
            (int(*)(int))std::tolower);
  if (s == "ta") {
    s = "data";                 // hack
  }
  if (s != type) {
    cerr << "Bad type in parseMem: " << s << endl;
    exit(1);
  }
  if (type == "instruction") {
    addr = imem.getBase();
  } else if (type == "data") {
    addr = dmem.getBase();
  }
  in >> s;
  transform(s.begin(), s.end(), s.begin(), (int(*)(int))tolower);
  if (s != "memory") {
    cerr << "Bad type (memory) in parseMem: " << s << endl;
    exit(1);
  }
  while (in >> addr >> data) {
    //cout << "Addr: " << hex << addr << " Data: " << data << endl;
    // data is in native format
    if (type == "instruction") {
      imem.write(addr, data);
      addr += 2;
    } else if (type == "data") {
      dmem.write(addr, data);
      addr += 4;
    } else {
      cerr << "Bad type in while loop in parseMem: " << s << endl;
      exit(1);
    }
  }
  in.clear();
}

void parse(const char * file) {
  ifstream in(file);
  string s;
  unsigned int addr;
  in >> hex;                    // in takes hex numbers
  in >> s;
  if (s != "PC") {
    exit(1);
  }
  in >> addr;
  pc = addr;
  parseMem(in, "instruction");
  parseMem(in, "data");
}

