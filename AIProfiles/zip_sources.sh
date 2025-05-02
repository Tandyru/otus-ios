#!/bin/bash

# Настройки
PROJECT_DIR="$1"  # Директория проекта (передается как аргумент)
OUTPUT_DIR="$2"   # Директория для сохранения архива (передается как аргумент)
ARCHIVE_NAME="project_archive.zip"  # Имя выходного архива

# Проверка наличия аргументов
if [ -z "$PROJECT_DIR" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Использование: $0 <путь_к_проекту> <путь_для_сохранения>"
    exit 1
fi

# Проверка существования директории проекта
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Ошибка: Директория проекта '$PROJECT_DIR' не существует."
    exit 1
fi

# Создание выходной директории, если она не существует
mkdir -p "$OUTPUT_DIR"
if [ $? -ne 0 ]; then
    echo "Ошибка: Не удалось создать директорию '$OUTPUT_DIR'."
    exit 1
fi

# Исключение ненужных файлов и папок
EXCLUDES=(
    "*.DS_Store"
    "*.xcuserstate"
    "*.log"
    "DerivedData"
    "build"
    ".git"
    ".svn"
    "Pods"  # Если CocoaPods не нужны
)

# Формирование строки исключений для zip
EXCLUDE_FLAGS=""
for item in "${EXCLUDES[@]}"; do
    EXCLUDE_FLAGS+=" --exclude='$item'"
done

# Создание архива
echo "Создание архива..."
cd "$PROJECT_DIR" || exit 1
zip -r "$OUTPUT_DIR/$ARCHIVE_NAME" . $EXCLUDE_FLAGS

if [ $? -eq 0 ]; then
    echo "Архив успешно создан: $OUTPUT_DIR/$ARCHIVE_NAME"
else
    echo "Ошибка при создании архива."
    exit 1
fi
