// #include <stdio.h>
#define ROWS 40
#define COLS 20

#ifndef true
#define true 1
#define false 0
#endif

char g_mainSetting[ROWS][COLS+1] = // the row setting so far
   {
       "                   *",
       "                  **",
       "       *     *  *   ",
       "           *   ***  ",
       "*   *          *  * ",
       "           **    * *",
       "  * **  *     *     ",
       "            *****   ",
       "   **    *   * *    ",
       "          * *   *** ",
       " * *   *   *  *     ",
       "      **    * *  *  ",
       "  *  *  *     * *   ",
       "          *  *  ** *",
       " ***   *         *  ",
       " *  * * *   * *     ",
       "   **  * *    * *   ",
       "  *****           * ",
       "  *  *   * **  *    ",
       "    *  *  * * * *   ",
       "         * ***   ** ",
       "     ** *  *   * *  ",
       "        *** * *   * ",
       "  ***   *  *  *     ",
       "       *  ** * *  * ",
       "   ** * * *  * *    ",
       "    *  *  * *** *   ",
       "*****         *    *",
       "   **    * * ***    ",
       "*  * * ***    *     ",
       "         ***  ** * *",
       "     ** *   ** * *  ",
       "***   * *      ***  ",
       "      **   ** *** * ",
       " * * **  *** *      ",
       "* *** ***   **      ",
       "        *** * ** ***",
       " **** **       ***  ",
       "**   *** *   **  ** ",
       "*   * * *****  **  *",
   };
typedef struct
{
   char rg[ROWS][COLS+1]; // the row setting so far
   int  rowIndexes[20];
   int afAvailableRows[40];
} Game;

void initGame(Game* oldg, Game* newg){
  int i,j;
  
  for(i = 0; i < ROWS; i++)
    for(j = 0; j < COLS+1; j++)
      newg->rg[i][j] = oldg->rg[i][j];

  for(i = 0; i < 20; i++)
    newg->rowIndexes[i] = oldg->rowIndexes[i];
 
  for(i = 0; i < 40; i++)
    newg->afAvailableRows[i] = oldg->afAvailableRows[i];
}
   
int my_strncmp(char* one, char* two, int num){

int i;
int result = 0;
  for(i = 0; i < num; i++){
    if(one[i] < two[i]){
      result = -1;
      break;
    }
    else if(one[i] > two[i]){
      result = 1;
      break;
    }
  }

  return result;
}

void my_strcpy(char* news, char* olds){

  int i = 0;

    do{ 
    news[i] = olds[i];
    i++;
    }while(olds[i] != '\0');
}
    

int CheckConstraint(Game *g, int NextRow)
{
   // make sure that there is a viable set of columns from the remaining rows
   // in the main set
   // sweep across all 20 columns and convert them into rows
   char rowsToCols[20][20];
   int i,j;
   for(i = 0; i< 20; i++)
   {
       for(j =0; j <20; j++)
       {
           rowsToCols[i][j] = g->rg[j][i];
       }
   }
   int temp_afAvailableRows[40];
   //memcpy(temp_afAvailableRows, g->afAvailableRows, sizeof(int) *40);
   for(i = 0; i < 40; i++)
     temp_afAvailableRows[i] = g->afAvailableRows[i];

   // go through all rows, and make sure that there is an available row that
   // matches the first NextRow characters
   for(i = 0; i<20; i++)
   {
       for(j = 0; j<40; j++)
       {
           if(!temp_afAvailableRows[j])
               continue;
           if(my_strncmp(g_mainSetting[j], rowsToCols[i], NextRow + 1) == 0) // match
           {
               temp_afAvailableRows[j] = false;
               break;
           }
       }
       if(j>=40) // weren't able to fulfill constraints
           return false;
   }
   return true;
}
int SolveGame(Game *g, int NextRow)
{
   int i,j;
  if (NextRow == 20)
   {
/*
       cout<<"Solved"<<endl;
       // solved the game!! Print it out and exit
       for (i=0; i<20; i++)
           cout<<g_mainSetting[g->rowIndexes[i]]<<endl;
       cout<<"Rows"<<endl;
       for(i=0; i<20; i++)
           cout<<g->rowIndexes[i]<<endl;
*/
       return true;
   }

   // try to locate the first available row
   for (i = 0; i < 40; i++)
   {
       if(g->afAvailableRows[i])
       {
           
           Game    newGame;
           initGame(g, &newGame);
           newGame.rowIndexes[NextRow] = i;
           newGame.afAvailableRows[i] = false;
           my_strcpy(newGame.rg[NextRow], g_mainSetting[i]);
           // Do constraint check
           if (!CheckConstraint(&newGame, NextRow))
               continue;

           // constraint check succeeded
           if( SolveGame(&newGame, NextRow + 1))
           {
               return true;
           }
       }
   }
   return false;
}

int main()
{
   Game game;
   int i;
   for (i = 0; i < 40; i++)
   {
       game.afAvailableRows[i] = true;
   }
   int    f = SolveGame(&game, 0);
   // printf("%d\n", f);
   return f;
}
