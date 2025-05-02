#!/bin/bash

# Настройки
PROJECT_DIR="$1"  # Директория проекта (передается как аргумент)
OUTPUT_FILE="$2"  # Путь к выходному текстовому файлу (передается как аргумент)

# Проверка наличия аргументов
if [ -z "$PROJECT_DIR" ] || [ -z "$OUTPUT_FILE" ]; then
    echo "Использование: $0 <путь_к_проекту> <путь_к_выходному_файлу>"
    exit 1
fi

# Проверка существования директории проекта
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Ошибка: Директория проекта '$PROJECT_DIR' не существует."
    exit 1
fi

# Очистка выходного файла
> "$OUTPUT_FILE"

# Форматы файлов для поиска
FILE_EXTENSIONS=("*.swift" "*.m" "*.h" "*.cpp" "*.c")

# Исключение ненужных папок
EXCLUDE_DIRS=(".git" "DerivedData" "build" "Pods")

# Функция для проверки, нужно ли исключить файл
should_exclude() {
    local file_path="$1"
    for dir in "${EXCLUDE_DIRS[@]}"; do
        if [[ "$file_path" == *"$dir"* ]]; then
            return 0 # Исключить
        fi
    done
    return 1 # Не исключать
}

# Поиск и объединение файлов
echo "Объединение исходных файлов..."
find "$PROJECT_DIR" -type f \( -name "*.swift" -o -name "*.m" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" \) | while read -r file; do
    if should_exclude "$file"; then
        continue
    fi

    # Добавление разделителя с именем файла
    echo -e "\n\n--- $file ---\n" >> "$OUTPUT_FILE"

    # Добавление содержимого файла
    cat "$file" >> "$OUTPUT_FILE"
done

echo "Все исходные файлы объединены в '$OUTPUT_FILE'."