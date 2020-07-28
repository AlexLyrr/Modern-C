/**
* @version   $Id: challenge15.c 3540 2020-06-02 11:15:55 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stddef.h> // for ptrdiff_t
#include <regex.h>

/**
 * @brief      Finds a word. We don't care if that word is preceded or followed
 *             by space.
 *
 * @param      phrase  The phrase
 * @param      word    The word
 *
 * @return     If a word is found, it returns a pointer to the starting position
 *             of the word. Otherwise it returns the empty string.
 */
char const* find_word(char const* phrase, char const* word) {
    return strstr(phrase, word);
}

/**
 * @brief      Replace a word in a phrase with another word
 *
 * @param      phrase   The phrase
 * @param      word     The word
 * @param      newWord  The new word
 *
 * @return     If the replacement succeeds it return the new phrase. Otherwirse
 *             it returns an empty string
 */
char* replace_word(char const* phrase, char const* word,
                   char const* newWord) {
    char const* wordPosition = find_word(phrase, word);
    if (!wordPosition) {
        return NULL;
    }
    char* newPhrase = malloc(strlen(phrase)
                             - strlen(word)
                             + strlen(newWord)
                             + 1);
    ptrdiff_t initialPhraseLen = labs(wordPosition - phrase);
    // strncpy: Copies the C string pointed by source into the array pointed by
    // destination, INCLUDING the terminating null character.
    strncpy(newPhrase, phrase, initialPhraseLen);
    strcpy(newPhrase + initialPhraseLen, newWord);
    strcpy(newPhrase + initialPhraseLen + strlen(newWord),
           wordPosition + strlen(word));
    return newPhrase;
}

bool exec_regex(char const* phrase, char const* pattern) {
    regex_t reg;
    regmatch_t pmatch;
    if (!regcomp(&reg, pattern, 0)) {
        if (!regexec(&reg, phrase, 1, &pmatch, 0)) {
            printf("%s\n", phrase);
            // Unicode character count for 4 bytes!
            printf("%*s\n", pmatch.rm_so + 3, "\u2191");
            printf("%s\n", "Pattern matched!");
            return true;
        } else {
            printf("%s\n", "Pattern didn't match. :(");
        }
    } else {
        fprintf(stderr, "%s\n", "Pattern composition failed");
    }
    /* Free compiled regular expression if you want to use the regex_t again */
    regfree(&reg);
    return false;
}

int main(int argc, char const* argv[]) {
    char const* word = "apples";
    char const* phrase = "How many apples should you eat per week?";
    if (find_word(phrase, word)) {
        printf("%s\n", "Word found!");
    }
    char* newPhrase = replace_word(phrase, word, "steaks");
    exec_regex(phrase, "apples");
    exec_regex(phrase, "should");
    exec_regex(phrase, "[A-Q]");
    exec_regex(phrase, "[^0-9]");
    printf("Old phrase: %s\n"
           "New phrase: %s\n",
           phrase, newPhrase);
    printf("\n\nRemember! Never use sizeof for strings!\n"
           "Size of phrase:\n"
           "1)Using size of: %zu\n"
           "2)Using strlen: %zu",
           sizeof(char*), strlen(phrase));
    return 0;
}