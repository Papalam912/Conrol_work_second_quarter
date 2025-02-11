-- Удаляем базу данных "humans_friends", если она есть.
DROP DATABASE IF EXISTS humans_friends;

-- Создаем базу данных "humans_friends", если ее еще нет.
CREATE DATABASE IF NOT EXISTS humans_friends;

-- Используем созданную базу данных
USE humans_friends;

-- Создаем таблицу "animals".
CREATE TABLE animals
(
id INT AUTO_INCREMENT PRIMARY KEY,
animal_type VARCHAR(30)
);

-- Заполняем таблицу "animals".
INSERT INTO animals (animal_type)
VALUES ('Home_Animals'), ('Pack_Animals');

-- Создаем таблицу "home_animals".
CREATE TABLE home_animals
(
id INT AUTO_INCREMENT PRIMARY KEY,
animal_kind VARCHAR(30),
animal_type_id INT DEFAULT 1,
FOREIGN KEY (animal_type_id) REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Заполняем таблицу "home_animals".
INSERT INTO home_animals (animal_kind)
VALUES ('Dog'), ('Cat'), ('Hamster');

-- Создаем таблицу "pack_animals".
CREATE TABLE pack_animals
(
id INT AUTO_INCREMENT PRIMARY KEY,
animal_kind VARCHAR(30),
animal_type_id INT DEFAULT 2,
FOREIGN KEY (animal_type_id) REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Заполняем таблицу "pack_animals".
INSERT INTO pack_animals (animal_kind)
VALUES ('Horse'), ('Camel'), ('Donkey');

-- Создаем таблицу "cat" с внешним ключом на таблицу "home_animals"
CREATE TABLE cat
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
color VARCHAR(30),
date_birth DATE,
commands VARCHAR(100),
animal_kind_id INT DEFAULT 1,
FOREIGN KEY (animal_kind_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Создаем таблицу "dog" с внешним ключом на таблицу "home_animals"
CREATE TABLE dog
(
id INT AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(30),
color VARCHAR(30),
date_birth DATE,
commands VARCHAR(100),
animal_kind_id INT DEFAULT 2,
FOREIGN KEY (animal_kind_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Создаем таблицу "hamster" с внешним ключом на таблицу "home_animals"
CREATE TABLE hamster
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
color VARCHAR(30),
date_birth DATE,
commands VARCHAR(100),
animal_kind_id INT DEFAULT 3,
FOREIGN KEY (animal_kind_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Создаем таблицу "horse" с внешним ключом на таблицу "pack_animals"
CREATE TABLE horse
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
color VARCHAR(30),
date_birth DATE,
commands VARCHAR(100),
animal_kind_id INT DEFAULT 1,
FOREIGN KEY (animal_kind_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Создаем таблицу "camel" с внешним ключом на таблицу "pack_animals"
CREATE TABLE camel
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
color VARCHAR(30),
date_birth DATE,
commands VARCHAR(100),
animal_kind_id INT DEFAULT 2,
FOREIGN KEY (animal_kind_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Создаем таблицу "donkey" с внешним ключом на таблицу "pack_animals"
CREATE TABLE donkey
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
color VARCHAR(30),
date_birth DATE,
commands VARCHAR(100),
animal_kind_id INT DEFAULT 3,
FOREIGN KEY (animal_kind_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Заполняем таблицу "cat".
INSERT INTO cat (name, color, date_birth, commands)
VALUES ('Мурзик', 'Белый', '2021-06-11', 'Не мукать'),
('Васька', 'Рыжий', '2016-02-19', 'Ко мне'),
('Черныш', 'Чёрный', '2019-04-21', 'Лежать');

-- Заполняем таблицу "dog".
INSERT INTO dog (name, color, date_birth, commands)
VALUES ('Шарик', 'Коричневый', '2020-01-11', 'Место, голос'),
('Хуска', 'Бежевый', '2017-06-18', 'Дай лапу, Сидеть'),
('Снежок', 'Белый', '2012-04-11', 'Лежать, Фас');

-- Заполняем таблицу "hamster".
INSERT INTO hamster (name, color, date_birth, commands)
VALUES ('Хома', 'Коричневый-белый', '2022-01-11', 'Стоять'),
('Хрума', 'Чёрно-белый', '2021-06-18', 'Лежать'),
('Сплюма', 'Белый', '2023-04-11', 'Бегать');

-- Заполняем таблицу "horse".
INSERT INTO horse (name, color, date_birth, commands)
VALUES ('Ринта', 'Оранжевый', '2018-10-31', 'тише, хоп, вперед'),
('Селест', 'Белый', '1999-01-31', 'стой, рысь, шагом'),
('Фуксия', 'Фуксия', '2015-04-01', 'стой, шагом, хоп');

-- Заполняем таблицу "camel".
INSERT INTO camel (name, color, date_birth, commands)
VALUES ('Лила', 'Оранжевый', '2021-02-15', 'гит, дурр'),
('Хлоя', 'Белый', '2016-11-05', 'каш, гит, дурр'),
('Джоси', 'Фуксия', '2017-07-21', 'каш, гит');

-- Заполняем таблицу "donkey".
INSERT INTO donkey (name, color, date_birth, commands)
VALUES ('Иа', 'Оранжевый', '2014-06-15', 'вперед, стоять'),
('Хлоя', 'Белый', '2024-10-05', 'идти, стоять'),
('Джоси', 'Фуксия', '2022-08-24', 'шагом, вперед');

-- Удалить таблицу "camel".
DROP TABLE humans_friends.camel;

-- Объединить таблицы "horses", и "donkeys" в одну таблицу, создаем новую таблицу "horse_and_donkey" для объединения "horse" и "donkey".
CREATE TABLE horse_and_donkey
(
id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(30),
color VARCHAR(30),
date_birth DATE,
commands VARCHAR(100),
animal_kind_id INT UNSIGNED NOT NULL,
species_animals VARCHAR(30),
PRIMARY KEY (id)
);

-- Вставляем данные из "horses" в таблицу "horses_and_donkeys"
INSERT INTO horse_and_donkey (name, color, date_birth, commands, animal_kind_id, species_animals)
SELECT name, color, date_birth, commands, animal_kind_id, 'Horse' AS species_animals
FROM horse;


-- Вставляем данные из "donkeys" в таблицу "horses_and_donkeys"
INSERT INTO horse_and_donkey (name, color, date_birth, commands, animal_kind_id, species_animals)
SELECT name, color, date_birth, commands, animal_kind_id, 'Donkey' AS species_animals
FROM donkey;

-- Создаем новую таблицу "young_animals"
CREATE TABLE young_animals 
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
species_animals VARCHAR(30),
age_months INT
);

-- Вставляем данные из таблиц 'cat', `dog`, `donkey`, `hamster`, и `horse` в таблицу `young_animals`.
INSERT INTO young_animals (name, species_animals, age_months)
SELECT name, 'Cat' AS species_animals, TIMESTAMPDIFF(MONTH, date_birth, CURDATE()) AS age_months
FROM cat
WHERE date_birth <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND date_birth >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO young_animals (name, species_animals, age_months)
SELECT name, 'Dog' AS species_animals, TIMESTAMPDIFF(MONTH, date_birth, CURDATE()) AS age_months
FROM dog
WHERE date_birth <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND date_birth >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO young_animals (name, species_animals, age_months)
SELECT name, 'Hamster' AS species_animals, TIMESTAMPDIFF(MONTH, date_birth, CURDATE()) AS age_months
FROM hamster
WHERE date_birth <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND date_birth >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO young_animals (name, species_animals, age_months)
SELECT name, 'Horse' AS species_animals, TIMESTAMPDIFF(MONTH, date_birth, CURDATE()) AS age_months
FROM horse
WHERE date_birth <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND date_birth >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO young_animals (name, species_animals, age_months)
SELECT name, 'Donkey' AS species_animals, TIMESTAMPDIFF(MONTH, date_birth, CURDATE()) AS age_months
FROM donkey
WHERE date_birth <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND date_birth >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

-- Создаем новую таблицу "all_animals".
CREATE TABLE all_animals
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
color VARCHAR(30),
date_birth DATE,
commands VARCHAR(100),
animal_kind_id INT,
species_animals VARCHAR(30),
FOREIGN KEY (animal_kind_id) REFERENCES home_animals(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Объединяем таблицы с помощью UNION.
INSERT INTO all_animals (name, color, date_birth, commands, animal_kind_id, species_animals)
SELECT name, color, date_birth, commands, animal_kind_id, 'Cat' AS species_animals
FROM cat
UNION
SELECT name, color, date_birth, commands, animal_kind_id, 'Dog' AS species_animals
FROM dog
UNION
SELECT name, color, date_birth, commands, animal_kind_id, 'Hamster' AS species_animals
FROM hamster
UNION
SELECT name, color, date_birth, commands, animal_kind_id, 'Horse' AS species_animals
FROM horse
UNION
SELECT name, color, date_birth, commands, animal_kind_id, 'Donkey' AS species_animals
FROM donkey;

-- Выводим финальную таблицу "all_animals".
SELECT * FROM all_animals;