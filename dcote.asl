state("CoCMainWin32") {
  int isLoading: "CoCMainWin32.exe", 0x39CCB4;
}

init {
  refreshRate = 30;
}

isLoading {
  return current.isLoading != 0;
}
