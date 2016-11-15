#ifndef _DECODE_H_
#define _DECODE_H_
#include <unistd.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <map>
#include <cmath>

using namespace std;

/* Bool Defines */
#define TRUE 1
#define FALSE 0

/* Defines for types and ops for decoding */
#define ALU_TYPE 0
#define SP_TYPE 17
#define DP_TYPE 16
#define LD_ST_REG_OPA 5
#define LD_ST_OPB_STR 0
#define LD_ST_OPB_STRH 1
#define LD_ST_OPB_STRB 2
#define LD_ST_OPB_LDRSB 3
#define LD_ST_OPB_LDR 4
#define LD_ST_OPB_LDRH 5
#define LD_ST_OPB_LDRB 6
#define LD_ST_OPB_LDRSH 7
#define LD_ST_IMM_OPA 6
#define LD_ST_IMMB_OPA 7
#define LD_ST_IMMH_OPA 8
#define LD_ST_IMMSP_OPA 9
#define LD_ST_STB 14 
#define LD_ST_LDB 15
#define UNCOND_TYPE 28
#define ADD_SP_TYPE 21
#define ALU_LSLI_OP 0
#define ALU_LSRI_OP 1
#define ALU_ASRI_OP 2
#define ALU_ADDR_OP 12
#define ALU_SUBR_OP 13
#define ALU_ADD3I_OP 14
#define ALU_SUB3I_OP 15
#define ALU_MOV_OP 4
#define ALU_CMP_OP 5
#define ALU_ADD8I_OP 6
#define ALU_SUB8I_OP 7
#define MISC_TYPE 11
#define LDM_TYPE 25
#define STM_TYPE 24
#define LDRL_TYPE 9
#define COND_TYPE 13
#define MISC_PUSH_OP 2
#define MISC_ADD_OP 0
#define MISC_SUB_OP 1
#define MISC_POP_OP 6
#define ADD_SP8I_TYPE 22
#define BL_TYPE 30

/* ALU Type Structs */
struct ALU_LSLI_Instr {
   unsigned short rd: 3;
   unsigned short rm: 3;
   unsigned short imm: 5;
   unsigned short op: 3;
   unsigned short type: 2;
};

typedef ALU_LSLI_Instr ALU_LSRI_Instr;
typedef ALU_LSLI_Instr ALU_ASRI_Instr;

struct ALU_ADDR_Instr {
   unsigned short rd: 3;
   unsigned short rn: 3;
   unsigned short rm: 3;
   unsigned short op: 5;
   unsigned short type: 2;
};

typedef ALU_ADDR_Instr ALU_SUBR_Instr;

struct ALU_ADD3I_Instr {
   unsigned short rd: 3;
   unsigned short rn: 3;
   unsigned short imm: 3;
   unsigned short op: 5;
   unsigned short type: 2;
};

typedef ALU_ADD3I_Instr ALU_SUB3I_Instr;

struct ALU_ADD8I_Instr {
   unsigned short imm: 8;
   unsigned short rdn: 3;
   unsigned short op: 3;
   unsigned short type: 2;
};

typedef ALU_ADD8I_Instr ALU_SUB8I_Instr;
typedef ALU_ADD8I_Instr ALU_CMP8I_Instr;
typedef ALU_ADD8I_Instr ALU_MOV8I_Instr;

struct ALU_Type {
   union {
      unsigned short mem;
      struct {
         unsigned short data: 14;
         unsigned short type_check: 2;
      } class_type;
      ALU_LSLI_Instr lsli;
      ALU_LSRI_Instr lsri;
      ALU_ASRI_Instr asri;
      ALU_ADDR_Instr addr;
      ALU_SUBR_Instr subr;
      ALU_ADD3I_Instr add3i;
      ALU_SUB3I_Instr sub3i;
      ALU_ADD8I_Instr add8i;
      ALU_SUB8I_Instr sub8i;
      ALU_CMP8I_Instr cmp;
      ALU_MOV8I_Instr mov;
   } instr;
};

struct DP_Type {
   union {
      unsigned short mem;
      struct {
         unsigned short data: 10;
         unsigned short type_check: 6;
      } class_type;
      /* All Data Processing Types follow this format */
      struct {
         unsigned short rdn: 3;
         unsigned short rm: 3;
         unsigned short op: 4;
         unsigned short type: 6;
      } DP_Instr;
   } instr; 
};

/* Special Types */
struct SP_ADD_Instr {
   unsigned short rd: 3;
   unsigned short rm: 4;
   unsigned short d: 1;
   unsigned short op: 2;
   unsigned short type: 6;
};

typedef SP_ADD_Instr SP_CMP_Instr;
typedef SP_ADD_Instr SP_MOV_Instr;

struct SP_BX_Instr {
   unsigned short cond: 3;
   unsigned short rm: 3;
   unsigned short op: 4;
   unsigned short type: 6;
};

typedef SP_BX_Instr SP_BLX_Instr;

struct SP_Type {
   union {
      struct {
         unsigned short data: 10;
         unsigned short type_check: 6;
      } class_type;
      SP_ADD_Instr add;
      SP_CMP_Instr cmp;
      SP_MOV_Instr mov;
      SP_BX_Instr bx;
      SP_BLX_Instr blx;
   } instr;
};

/* Load Store Defines */


struct LD_ST_Type {
   union {
      struct {
         unsigned short data: 9;
         unsigned short opB: 3;
         unsigned short opA: 4;
      } class_type;
      /* Register struct for Load Store Types */
      struct {
         unsigned short rt: 3;
         unsigned short rn: 3;
         unsigned short rm: 3;
         unsigned short op: 7;
      } ld_st_reg;
      /* Immediate struct for Load Store Types */
      struct {
         unsigned short rt: 3;
         unsigned short rn: 3;
         unsigned short imm: 5;
         unsigned short op: 5;
      } ld_st_imm;
      struct {
         unsigned short imm: 8;
         unsigned short rt: 3;
         unsigned short opB: 1;
         unsigned short opA: 4;
      } ld_st_sp_imm;
   } instr;
};

/* Misc. Types */

struct MISC_ADD_Instr {
   unsigned short imm: 7;
   unsigned short op: 5;
   unsigned short type: 4;
};

typedef MISC_ADD_Instr MISC_SUB_Instr;

struct MISC_SXTH_Instr {
   unsigned short rd: 3;
   unsigned short rm: 3;
   unsigned short op: 6;
   unsigned short type: 4;
};

typedef MISC_SXTH_Instr MISC_SXTB_Instr;
typedef MISC_SXTH_Instr MISC_UXTH_Instr;
typedef MISC_SXTH_Instr MISC_UXTB_Instr;
typedef MISC_SXTH_Instr MISC_REV_Instr;
typedef MISC_SXTH_Instr MISC_REV16_Instr;
typedef MISC_SXTH_Instr MISC_REVSH_Instr;

struct MISC_PUSH_Instr {
   unsigned short reg_list: 8;
   unsigned short m: 1;
   unsigned short op: 3;
   unsigned short type: 4;
};

typedef MISC_PUSH_Instr MISC_POP_Instr;

struct MISC_BKPT_Instr {
   unsigned short imm: 8;
   unsigned short op: 4;
   unsigned short type: 4;
};

struct MISC_Type {
   union {
      struct {
         unsigned short data: 12;
         unsigned short type_check: 4;
      } class_type;
      MISC_ADD_Instr add;
      MISC_SUB_Instr sub;
      MISC_SXTH_Instr sxth;
      MISC_SXTB_Instr sxtb;
      MISC_UXTH_Instr uxth;
      MISC_UXTB_Instr uxtb;
      MISC_REV_Instr rev;
      MISC_REV16_Instr rev16;
      MISC_REVSH_Instr revsh;
      MISC_PUSH_Instr push;
      MISC_POP_Instr pop;
      MISC_BKPT_Instr bkpt;
   } instr;
};
/* Conditional Type */
struct COND_B_Instr {
   unsigned short imm: 8;
   unsigned short cond: 4;
   unsigned short op: 4;
}; 

struct COND_Type {
   union {
      struct {
         unsigned short data: 12;
         unsigned short type_check: 4;
      } class_type;
      COND_B_Instr b;
   } instr;
};

struct BL_Lower_Instr {
  unsigned short imm11: 11;
  unsigned short j2: 1;
  unsigned short bit1: 1;
  unsigned short j1: 1;
  unsigned short op1: 2;
};

struct BL_Upper_Instr {
  unsigned short imm10: 10;
  unsigned short s: 1;
  unsigned short op2: 5;
}; 

struct BL_Type {
   union {
      struct {
         unsigned short data: 11;
         unsigned short type_check: 5;
      } class_type;
      BL_Upper_Instr bl_upper;
      BL_Lower_Instr bl_lower;
   } instr;
};

/* Literal Type */
struct LDRL_Instr {
   unsigned short imm: 8;
   unsigned short rt: 3;
   unsigned short op: 5;
};

struct LDRL_Type {
   union {
      struct {
         unsigned short data: 11;
         unsigned short type_check: 5;
      } class_type;
      LDRL_Instr ldrl;
   } instr;
};

/* ST Multiple Type*/
struct STM_Instr {
   unsigned short reg_list: 8;
   unsigned short rn: 3;
   unsigned short op: 5;
};

struct STM_Type {
   union {
      struct {
         unsigned short data: 11;
         unsigned short type_check: 5;
      } class_type;
      STM_Instr stm;
   } instr;
};

/* LD Multiple Type*/
struct LDM_Instr {
   unsigned short reg_list: 8;
   unsigned short rn: 3;
   unsigned short op: 5;
};

struct LDM_Type {
   union {
      struct {
         unsigned short data: 11;
         unsigned short type_check: 5;
      } class_type;
      LDM_Instr ldm;
   } instr;
};

/* Unconditional Type */
struct UNCOND_B_Instr {
   unsigned short imm: 11;
   unsigned short op: 5;
};

struct UNCOND_Type {
   union {
      struct {
         unsigned short data: 11;
         unsigned short type_check: 5;
      } class_type;
      UNCOND_B_Instr b;
   } instr;
};

struct ADD_SP_Instr {
   unsigned short imm: 8;
   unsigned short rd: 3;
   unsigned short op: 5;
};

struct ADD_SP_Type {
   union {
      struct {
         unsigned short data: 11;
         unsigned short type_check: 5;
      } class_type;
      ADD_SP_Instr add;
   } instr; 
};

class ALL_Types{ 
   public:
      union {
         unsigned short mem;
         ALU_Type alu;
         DP_Type dp;
         SP_Type sp;
         LD_ST_Type ld_st;
         MISC_Type misc;
         COND_Type cond;
         UNCOND_Type uncond;
         LDM_Type ldm;
         STM_Type stm;
         LDRL_Type ldrl;
         ADD_SP_Type addsp;
         BL_Type bl;
      } type;
      ALL_Types() {}
      ALL_Types(const unsigned short & _type) {type.mem = _type;}
      /*
       * @param data An ALL_Types that uses data
       * @return returns the Type of instruction it is.
       *
       */
};
static void printCond(char byte) {
   switch (byte) {
      case 0:
         cout << "eq";
         break;
      case 1:
         cout << "ne";
         break;
      case 2:
         cout << "cs";
         break;
      case 3:
         cout << "cc";
         break;
      case 4:
         cout << "mi";
         break;
      case 5:
         cout << "pl";
         break;
      case 6:
         cout << "vs";
         break;
      case 7:
         cout << "vc";
         break;
      case 8:
         cout << "hi";
         break;
      case 9:
         cout << "ls";
         break;
      case 10:
         cout << "ge";
         break;
      case 11:
         cout << "lt";
         break;
      case 12:
         cout << "gt";
         break;
      case 13:
         cout << "le";
         break;
      default:
         cout << "";
   }
}



/* From mipsim.hpp */
class Data8 {
   private:
      unsigned char d;
   public:
      Data8() {}
      Data8(unsigned char _d) : d(_d) {}
      operator unsigned char() const { return d; }
};

class Data16 {
   private:
      union {
         unsigned short _ushort;
         short _short;
         unsigned char _ubyte2[2];
         ALU_Type alu;
         DP_Type dp;
         SP_Type sp;
         LD_ST_Type ld_st;
         MISC_Type misc;
         COND_Type cond;
         UNCOND_Type uncond;
         LDM_Type ldm;
         STM_Type stm;
         LDRL_Type ldrl;
         ADD_SP_Type addsp;
         BL_Type bl;
      } d;
   public:
      Data16() {}
      Data16(const unsigned short & _d) {d._ushort = _d; }
      Data16(const unsigned char & d0, 
            const unsigned char & d1) { 
         set_data_ubyte2(0, d0);
         set_data_ubyte2(1, d1);
      }
      // Data16 & operator=(const Data16 & _d) { set_data_uint(_d.data_uint()); }
      operator unsigned short() const { return data_ushort(); }
      bool operator==(const Data16 & dd) const { return (data_ushort() == dd.data_ushort()); }
      bool operator!=(const Data16 & dd) const { return (data_ushort() != dd.data_ushort()); }
      inline void set_data_short(short arg) { 
         d._short = arg; 
      }
      inline short data_short(void) const {
         return d._short; 
      }
      inline void set_data_ushort(unsigned short arg) {
         d._ushort = arg;
      }
      inline unsigned short data_ushort(void) const {
         return d._ushort; 
      }
      inline void set_data_ubyte2(short i, unsigned char arg) {
         d._ubyte2[1-i] = arg;
         //cout << "set_data_ubyte4 " << d._ubyte4[3-1] << endl;
      }
      inline unsigned char data_ubyte2(short i) const {
         //cout << "data_ubyte4 " << d._ubyte4[3-1] << endl;
         return d._ubyte2[1-i]; 
      }
      static void printD(const Data16 d) {
         cout << hex << d.data_ushort() << endl;
      }
      operator ALU_Type() const { return d.alu; }
      operator DP_Type() const { return d.dp; }
      operator SP_Type() const { return d.sp; }
      operator LD_ST_Type() const { return d.ld_st; }
      operator MISC_Type() const { return d.misc; }
      operator COND_Type() const { return d.cond; }
      operator UNCOND_Type() const { return d.uncond; }
      operator LDM_Type() const { return d.ldm; }
      operator STM_Type() const { return d.stm; }
      operator LDRL_Type() const { return d.ldrl; }
      operator ADD_SP_Type() const { return d.addsp; }
      operator BL_Type() const { return d.bl; }
};

class Data32 {
   private:
      union {
         unsigned int _uint;
         int _int;
         unsigned char _ubyte4[4];
      } d;
   public:
      // Data32() {}
      Data32(const unsigned int & _d) {d._uint = _d; }
      Data32(const unsigned char & d0, 
            const unsigned char & d1, 
            const unsigned char & d2, 
            const unsigned char & d3) { 
         set_data_ubyte4(0, d0);
         set_data_ubyte4(1, d1);
         set_data_ubyte4(2, d2);
         set_data_ubyte4(3, d3);
      }
      // Data32 & operator=(const Data32 & _d) { set_data_uint(_d.data_uint()); }
      operator unsigned int() const { return data_uint(); }
      bool operator==(const Data32 & dd) const { return (data_uint() == dd.data_uint()); }
      bool operator!=(const Data32 & dd) const { return (data_uint() != dd.data_uint()); }
      inline void set_data_int(int arg) { 
         d._int = arg; 
      }
      inline int data_int(void) const {
         return d._int; 
      }
      inline void set_data_uint(unsigned int arg) {
         d._uint = arg;
      }
      inline unsigned int data_uint(void) const {
         return d._uint; 
      }
      inline void set_data_ubyte4(int i, unsigned char arg) {
         d._ubyte4[3-i] = arg;
         //cout << "set_data_ubyte4 " << d._ubyte4[3-1] << endl;
      }
      inline unsigned char data_ubyte4(int i) const {
         //cout << "data_ubyte4 " << d._ubyte4[3-1] << endl;
         return d._ubyte4[3-i]; 
      }
      static void printD(const Data32 d) {
         cout << hex << d.data_uint() << endl;
      }
};
enum OFType { OF_ADD, OF_SUB, OF_SHIFT };

enum MemType { MEM_MEM, MEM_RF, MEM_INVALID };

enum DataType { INSTRUCTIONS, DATA };

template<class Stored, class Accessed>
class Memory {
   private:
      vector<Stored> m;
      unsigned int base;
      unsigned int lowest, highest;
   public:
      Memory() : m(0), base(0), lowest(0xffffffff), highest(0) {}
      Memory(unsigned int _base) : m(0), base(_base), lowest(0xffffffff),
      highest(0) {}
      Memory(unsigned int size, Stored d) : m(size, d), base(0), 
      lowest(0xffffffff), highest(0) {}
      unsigned int size() const { return m.size(); }
      typename vector<Stored>::const_iterator begin() const { return m.begin(); }
      typename vector<Stored>::const_iterator end() const { return m.end(); }
      void write(const unsigned int addr, const Accessed data);
      const Accessed operator[](const unsigned int addr) const;
      // Accessed & operator[](const unsigned int addr);
      void dump(DataType dt) const;
      unsigned int getBase() const { return base; }
      bool inRange(unsigned int r) { return (r >= base) && (r < base + size()); } 
};

class Register {
   private:
      Data32 d;
   public:
      Register() : d(0) {}
      Register(Data32 _d) : d(_d) {}
      void write(unsigned int val) {
         d = Data32(val);
      }
      operator Data32() const { return d; }
      operator unsigned int() const { return d.data_uint(); }
      Register & operator=(unsigned int val) {
         write(val);
      }
};

class Cache {
   private:
      unsigned int size;
      unsigned int blocksize;
      vector<unsigned int> entries;
      unsigned int hits;
      unsigned int misses;
   public:
      Cache(unsigned int _size, unsigned int _blocksize) :
         size(_size), blocksize(_blocksize), entries(_size / _blocksize, 0),
         hits(0), misses(0) {}
      bool access(unsigned int address);
      void printStats() const {
         cout << dec << size << " byte cache (blocksize " << dec << blocksize
            << " bytes): " << hits << " hits, " << misses << " misses (hit rate: " 
                              << (static_cast<float>(hits) * 100.0f /
                                    static_cast<float>(hits + misses)) << "%)" << endl;
      }
};
class Caches {
   private:
      unsigned int size;
      vector<Cache> caches;
   public:
      Caches(unsigned int _size) : size(_size) {
         int i;
         for (i = 4; i <= size; i *= 2) {
            caches.push_back(Cache(size, i));
         }
      }
      void access(unsigned int address) {
         if (size == 0) {
            return;
         }
         vector<Cache>::iterator vci;
         for (vci = caches.begin(); vci != caches.end(); ++vci) {
            vci->access(address);
         }
      }
      void printStats() const {
         if (size == 0) {
            return;
         }
         for_each(caches.begin(), caches.end(), mem_fun_ref(&Cache::printStats));
      }
};

class Stats {
   public:
      unsigned int instrs;
      unsigned int cycles;

      unsigned int numMemWrites;
      unsigned int numMemReads;
      unsigned int numBranches;
      unsigned int numRegWrites;
      unsigned int numRegReads;

      unsigned int numForwardBranchesTaken;
      unsigned int numForwardBranchesNotTaken;
      unsigned int numBackwardBranchesTaken;
      unsigned int numBackwardBranchesNotTaken;

      void print();
};
class Options {
   public:
      Options() : program(false), dump(false), instrs(false), writes(false),
      stats(false) {}
      bool program;
      bool dump;
      bool instrs;
      bool writes;
      bool stats;
};

typedef enum Thumb_Types {
   ALU,
   DP,
   SPECIAL,
   LD_ST,
   MISC,
   COND,
   UNCOND,
   LDM,
   STM,
   LDRL,
   ADD_SP,
   BL,
   ERROR_TYPE
} Thumb_Types;

typedef enum ALU_Ops {
   ALU_LSLI,
   ALU_LSRI,
   ALU_ASRI,
   ALU_ADDR,
   ALU_SUBR,
   ALU_ADD3I,
   ALU_SUB3I,
   ALU_MOV,
   ALU_CMP,
   ALU_ADD8I,
   ALU_SUB8I
} ALU_Ops;

typedef enum DP_Ops {
   DP_AND,
   DP_EOR,
   DP_LSL,
   DP_LSR,
   DP_ASR,
   DP_ADC,
   DP_SBC,
   D_ROR,
   DP_TST,
   DP_RSB,
   DP_CMP,
   DP_CMN,
   DP_ORR,
   DP_MUL,
   DP_BIC,
   DP_MVN
} DP_Ops;

typedef enum SP_Ops {
   SP_ADD,
   SP_CMP,
   SP_MOV,
   SP_BX,
   SP_BLX
} SP_Ops;

typedef enum LD_ST_Ops {
   STRR,
   STRHR,
   STRBR,
   LDRSBR,
   LDRR,
   LDRHR,
   LDRBR,
   LDRSHR,
   STRI,
   LDRI,
   STRBI,
   LDRBI,
   STRHI,
   LDRHI,
   STRSP,
   LDRSP
} LD_ST_Ops;

typedef enum MISC_Ops {
   MISC_ADD,
   MISC_SUB,
   MISC_SXTH,
   MISC_SXTB,
   MISC_UXTH, 
   MISC_UXTB,
   MISC_PUSH,
   MISC_CPS,
   MISC_REV,
   MISC_REV16,
   MISC_REVSH,
   MISC_POP,
   MISC_BKPT,
   MISC_HINT
} MISC_Ops;

typedef enum BL_Ops {
  BL_UPPER,
  BL_LOWER
} BL_Ops;

typedef struct APSR {
   unsigned char N;
   unsigned char Z;
   unsigned char C;
   unsigned char V;
} ASPR;

enum { EQ, NE, CS, CC, MI, PL, VS, VC, HI, LS, GE, LT, GT, LE, AL};

extern ASPR flags;

extern Memory<Data16,Data16> imem;
extern Memory<Data8,Data32> dmem;
extern Memory<Data32,Data32> rf;
extern Register pc;
extern Stats stats;
extern Options opts;
extern Caches caches;

void parse(const char * file);
Thumb_Types decode(ALL_Types);

/* Decodes for each type */
ALU_Ops decode (const ALU_Type);
DP_Ops decode (const DP_Type);
SP_Ops decode (const SP_Type);
LD_ST_Ops decode (const LD_ST_Type);
MISC_Ops decode (const MISC_Type);
BL_Ops decode (const BL_Type);
int decode (const COND_Type);
int decode (const UNCOND_Type);
int decode (const LDM_Type);
int decode (const STM_Type);
int decode (const LDRL_Type);
int decode (const ADD_SP_Type);
void execute();  
#endif
