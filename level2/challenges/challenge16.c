/**
* @version   $Id: challenge16.c 3540 2020-06-02 11:15:55 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stddef.h> // for ptrdiff_t
#include <regex.h>
#include <stdbool.h>

void* read_stdin(size_t size, size_t n) {
    void* ptr = malloc(n * size);
    if (fread(ptr, size, n, stdin) != size * n) {
        fprintf(stderr, "%s\n", "Error with fread()");
        free(ptr);
        return NULL;
    }
    return ptr;
}

size_t write_stdout(const void* restrict ptr, size_t size,
                    size_t n) {
    return fwrite(ptr, size, n, stdout);
}

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

void count_word_occurences(char const* words[static 1],
                           size_t wordsLen, char const* phrase) {
    for (size_t i = 0; i < wordsLen; ++i) {
        size_t counter = 0;
        char const* tmp = phrase;
        while ((tmp = find_word(tmp, words[i]))) {
            counter++;
            tmp++;
        }
        printf("Occurences of %s = %zu\n", words[i], counter);
    }
}

char const* exec_regex(char const* phrase, char const* pattern) {
    regex_t reg;
    regmatch_t pmatch;
    if (!regcomp(&reg, pattern, 0)) {
        if (!regexec(&reg, phrase, 1, &pmatch, 0)) {
            printf("%s\n", phrase);
            printf("%s\n", "Pattern matched!");
            regfree(&reg);
            return (phrase + pmatch.rm_eo);
        }
    } else {
        fprintf(stderr, "%s\n", "Pattern composition failed");
    }
    /* Free compiled regular expression if you want to use the regex_t again */
    regfree(&reg);
    return NULL;
}

void count_regex_occurences(char const* regexs[static 1],
                            size_t regexsLen, char const* phrase) {
    for (size_t i = 0; i < regexsLen; ++i) {
        size_t counter = 0;
        char const* tmp = phrase;
        while ((tmp = exec_regex(tmp, regexs[i]))) {
            counter++;
        }
        printf("Occurences of %s = %zu\n", regexs[i], counter);
    }
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

char* replace_all_occurences(char const* phrase, char const* word,
                             char const* newWord) {
    char* newPhrase = malloc(strlen(phrase) + 1);
    strcpy(newPhrase, phrase);
    char* tmp = NULL;
    while ((tmp = replace_word(newPhrase, word, newWord))) {
        free(newPhrase);
        newPhrase = tmp;
    }
    return newPhrase;
}

int main() {
    // size_t size = 1;
    // size_t n = 10;
    // void* input = read_stdin(size, n);
    // write_stdout(input, size, n);
    char const* phrase =
        "How many apples should you eat per week? I think the right amount of apples is 3";
    char const* words[] = {"apples", "eat", "souvlaki"};
    count_word_occurences(words, sizeof(words) / sizeof(words[0]),
                          phrase);
    char const* regexs[] = {"apples", "eat", "souvlaki"};
    count_regex_occurences(regexs, sizeof(regexs) / sizeof(regexs[0]),
                           phrase);
    char* newPhrase = replace_all_occurences(phrase, "apples", "eggs");
    printf("%s\n", newPhrase);
    return 0;
}