NAME = libasm.a

# Utilisation de uname pour détecter le système d'exploitation
OS = $(shell uname -s)

# Compilateur d'assemblage
NASM = nasm

# Sélection des flags de compilation selon le système d'exploitation
ifeq ($(OS), Linux)
    NASMFLAGS = -f elf64
endif
ifeq ($(OS), Darwin) # Darwin est le nom donné par uname sur macOS
    NASMFLAGS = -f macho64
endif

# Commandes d'archivage et de nettoyage
AR = ar rcs
RM = rm -f
# Fichiers sources et objets
SRCS = libasm/ft_strlen.s #ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS = $(SRCS:.s=.o)

# Bonus
#BONUS_SRCS = ft_atoi_base.s ft_list_push_front.s ft_list_size.s ft_list_sort.s ft_list_remove_if.s
#BONUS_OBJS = $(BONUS_SRCS:.s=.o)

# Règle par défaut
all: $(NAME)

# Compilation de la bibliothèque
$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

# Compilation des fichiers d'assemblage
%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

# Règle pour les bonus
bonus: $(OBJS) #$(BONUS_OBJS)
	$(AR) $(NAME) $(OBJS) #$(BONUS_OBJS)

# Règles pour nettoyer les fichiers objets
clean:
	$(RM) $(OBJS) #$(BONUS_OBJS)

# Règles pour nettoyer tout
fclean: clean
	$(RM) $(NAME)

# Règle pour recompiler
re: fclean all

# Éviter les conflits de noms de fichiers avec des cibles
.PHONY: all clean fclean re bonus