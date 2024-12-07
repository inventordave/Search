// FS_H

#ifndef _DAVE_FILESEARCH_
#define _DAVE_FILESEARCH_

#ifdef _WIN32_
#include <windows.h>
HANDLE StdHandle;
LPDWORD resultCode;
#endif

#define MAX_FILE_PATH_LENGTH 261
#define MAX_ENTRIES 10000
#define MAX_NUM_FOLDERS 2000
#define MAX_NUM_FILES 2000

char* ignoreList;
char* whiteList;
#define MAX_IL_ENTRIES 512
#define MAX_WL_ENTRIES 512

extern char* defaultIgnoreList;
extern char* defaultWhiteList;
#define MAX_DEFAULT_ENTRIES 128
#define DIL_ENTRIES MAX_DEFAULT_ENTRIES
#define DWL_ENTRIES MAX_DEFAULT_ENTRIES

extern void rotate(int * argc, char * argv[]);

extern char* filename;
extern char* search_string;
void rotate(int * argc, char * argv[]);


extern char* msg_str;
extern char* s;
extern char* os;

extern int e;
extern int ep;

extern char invalid;
extern char regExp;

#ifndef FS_FC_PATTERN
#define FS_FC_PATTERN 1
#endif

#ifndef FS_FC_STRING
#define FS_FC_STRING 2
#endif

void* search_pattern;
void* search_input;

extern int fc_type;

extern BOOL colour;

extern char outputFile[261];
extern char* search_string;
extern void* search_input;
extern void* search_pattern;

#ifdef _WIN32_
WIN32_FIND_DATA NullEntry;
#endif

#define DEFAULT ""
#define backslash "\\"
#define star "*"
#define cd "."
#define bd ".."

static FILE* f;
int matches = 0;

unsigned FLAGS = 0;

#define RECURSE 1
#define OTF 2 // "output to file" flag, for sending a copy of search results to file.
#define DIR 4 // flag is set if cmd-line option to search for a directory name, not file name.
#define FILE_CONTENTS 8 // flag is set if option to search for string inside files set
#define HTML 16
#define ASTRSK 32
#define CASE_INSENSITIVE 64
#define TA_ONLINE 128
#define TA_OUTPUT "System online."
#define FILENAME 256
#define COLOURMODE 512

typedef struct resultRecord	{

	char* fileName;
	signed lineNum;

} resultRecord;

#include "../wernee/regex_w/wregex.h"
extern wregmatch_t* subm_g;
extern wregex_t* r_g;

BOOL print( char* );
extern void output( char*, char*, int );
extern void seperateFilesFromFolders( WIN32_FIND_DATA[], WIN32_FIND_DATA[], WIN32_FIND_DATA[], char* );
extern void listFilesInDirectory( char[], WIN32_FIND_DATA[] );
extern char cmpPatterns( wregex_t*, char* ); // return 1 if the 2 input filenames have the same ext 

extern void search( char*, char* [], int*, wregex_t*, void*, int );
extern signed int searchfile( char*, void*, int );

#endif

