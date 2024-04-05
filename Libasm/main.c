#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <errno.h>

// Déclarer les fonctions de votre bibliothèque
size_t ft_strlen(const char *s);
char *ft_strcpy(char *dst, const char *src);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s1);

int main() {
    char *str = "Hello, World!";
    char buffer[100];
    char *str_dup;
    ssize_t bytes_read;

    int ret = ft_write(1, "Hi\n", 3);
    printf("Write ret: %d , Errno: %d\n", ret, errno);
    ret = ft_write(5675, "Hi\n", 3);
    printf("Write ret: %d , Errno: %d\n", ret, errno);

    // Test ft_strlen
    printf("Length of \"%s\": %zu\n", str, ft_strlen(str));

    // Test ft_strcpy
    ft_strcpy(buffer, str);
    printf("Copy of \"%s\": %s\n", str, buffer);

    // Test ft_strcmp
    printf("Comparing \"%s\" and \"%s\": %d\n", str, buffer, ft_strcmp(str, buffer));
    printf("Comparing \"%s\" and \"Hello\": %d\n", str, ft_strcmp(str, "Hello"));

    // Test ft_write
    printf("Writing \"%s\" to STDOUT using ft_write:\n", str);
    ft_write(STDOUT_FILENO, str, ft_strlen(str));
    write(STDOUT_FILENO, "\n", 1); // Newline for better output formatting

    // Test ft_read
    printf("Reading from STDIN (enter some text):\n");
    bytes_read = ft_read(STDIN_FILENO, buffer, sizeof(buffer) - 1);
    if (bytes_read > 0) {
        buffer[bytes_read] = '\0';
        printf("Read \"%s\" using ft_read\n", buffer);
    } else {
        printf("ft_read failed\n");
    }

    // Test ft_strdup
    printf("A\n");
    str_dup = ft_strdup(str);
    printf("B\n");
    printf("Duplicate of \"%s\": %s\n", str, str_dup);
        printf("C\n");
    // La mémoire allouée par ft_strdup n'est pas libérée ici

    return 0;
}
