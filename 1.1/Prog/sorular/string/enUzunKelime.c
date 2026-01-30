#include <stdio.h>
#include <string.h>

int isLetter(char c) {
    return ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z'));
}

void findLongestWord(char str[], char longestWord[]) {
    int maxLen=0, currentLen=0;
    int start=0, longestStart=0;

    for(int i=0; str[i]!='\0'; i++) {
        if(isLetter(str[i])) {
            if(currentLen==0) {
                start=i;
            }
            currentLen++;
        }
        else {
            if(currentLen > maxLen) {
                maxLen=currentLen;
                longestStart=start;
            }
            currentLen=0;
        }
    }
    if(currentLen > maxLen) {
        maxLen=currentLen;
        longestStart=start;
    }
    
    for(int i=0; i<maxLen; i++) {
        longestWord[i]=str[longestStart+i];
    }
    longestWord[maxLen] = '\0';
}

int main() {
    char sentence[200];
    char longestWord[200];

    printf("Bir cumle giriniz: \n");
    fgets(sentence, sizeof(sentence), stdin);

    for(int i=0; sentence[i]!='\0'; i++) {
        if(sentence[i]=='\n') {
            sentence[i]='\0';
            break;
        }
    }
    findLongestWord(sentence, longestWord);
    printf("En uzun kelime: %s\n", longestWord);

    return 0;
}