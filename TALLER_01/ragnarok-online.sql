-- Crear tabla JOB
CREATE TABLE JOB (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    max_level INT NOT NULL
);

-- Crear tabla MAP
CREATE TABLE MAP (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50)
);

-- Crear tabla GUILD
CREATE TABLE GUILD (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    level INT DEFAULT 1,
    master_id INT
);

-- Crear tabla CHARACTER
CREATE TABLE `CHARACTER` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    job_id INT,
    guild_id INT,
    map_id INT,
    base_level INT DEFAULT 1,
    job_level INT DEFAULT 1,
    zeny INT DEFAULT 0,
    str INT DEFAULT 1,
    agi INT DEFAULT 1,
    vit INT DEFAULT 1,
    `int` INT DEFAULT 1,
    dex INT DEFAULT 1,
    luk INT DEFAULT 1,
    hp INT DEFAULT 40,
    sp INT DEFAULT 11,
    FOREIGN KEY (job_id) REFERENCES JOB(id),
    FOREIGN KEY (guild_id) REFERENCES GUILD(id),
    FOREIGN KEY (map_id) REFERENCES MAP(id)
);

-- Actualizar GUILD con master_id
ALTER TABLE GUILD
ADD FOREIGN KEY (master_id) REFERENCES `CHARACTER`(id);

-- Crear tabla ITEM
CREATE TABLE ITEM (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    price INT,
    weight INT
);

-- Crear tabla EQUIPMENT
CREATE TABLE EQUIPMENT (
    item_id INT PRIMARY KEY,
    atk INT DEFAULT 0,
    def INT DEFAULT 0,
    slot INT DEFAULT 0,
    FOREIGN KEY (item_id) REFERENCES ITEM(id)
);

-- Crear tabla INVENTORY
CREATE TABLE INVENTORY (
    id INT PRIMARY KEY AUTO_INCREMENT,
    character_id INT,
    item_id INT,
    quantity INT DEFAULT 1,
    slot INT,
    FOREIGN KEY (character_id) REFERENCES `CHARACTER`(id),
    FOREIGN KEY (item_id) REFERENCES ITEM(id)
);

-- Crear tabla SKILL
CREATE TABLE SKILL (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    max_level INT,
    type VARCHAR(50),
    job_id INT,
    FOREIGN KEY (job_id) REFERENCES JOB(id)
);

-- Crear tabla CHARACTER_SKILL
CREATE TABLE CHARACTER_SKILL (
    character_id INT,
    skill_id INT,
    level INT DEFAULT 1,
    PRIMARY KEY (character_id, skill_id),
    FOREIGN KEY (character_id) REFERENCES `CHARACTER`(id),
    FOREIGN KEY (skill_id) REFERENCES SKILL(id)
);

-- Crear tabla MONSTER
CREATE TABLE MONSTER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    level INT,
    hp INT,
    exp INT,
    job_exp INT
);

-- Crear tabla MONSTER_DROP
CREATE TABLE MONSTER_DROP (
    monster_id INT,
    item_id INT,
    drop_rate FLOAT,
    PRIMARY KEY (monster_id, item_id),
    FOREIGN KEY (monster_id) REFERENCES MONSTER(id),
    FOREIGN KEY (item_id) REFERENCES ITEM(id)
);

-- Insertar datos en JOB (First Jobs)
INSERT INTO JOB (name, max_level) VALUES 
('Novice', 10),
('Swordsman', 50),
('Mage', 50),
('Archer', 50),
('Acolyte', 50),
('Merchant', 50),
('Thief', 50);

-- Insertar datos en MAP
INSERT INTO MAP (name, type) VALUES 
('Prontera', 'Town'),
('Geffen', 'Town'),
('Payon', 'Town'),
('Morroc', 'Town'),
('Izlude', 'Town'),
('Prontera Field', 'Field'),
('Geffen Field', 'Field'),
('Payon Forest', 'Field');

-- Insertar datos en ITEM
INSERT INTO ITEM (name, type, price, weight) VALUES 
('Knife', 'Weapon', 50, 40),
('Sword', 'Weapon', 100, 100),
('Bow', 'Weapon', 1000, 50),
('Rod', 'Weapon', 50, 40),
('Axe', 'Weapon', 500, 150),
('Cotton Shirt', 'Armor', 10, 10),
('Shoes', 'Armor', 30, 20),
('Red Potion', 'Consumable', 50, 5),
('Blue Potion', 'Consumable', 70, 5),
('Wing of Fly', 'Consumable', 60, 1);

-- Insertar datos en EQUIPMENT
INSERT INTO EQUIPMENT (item_id, atk, def, slot) VALUES 
(1, 17, 0, 0),
(2, 25, 0, 0),
(3, 15, 0, 0),
(4, 15, 0, 0),
(5, 30, 0, 0),
(6, 0, 2, 0),
(7, 0, 3, 0);

-- Insertar datos en SKILL para cada Job
-- Novice Skills
INSERT INTO SKILL (name, max_level, type, job_id) VALUES 
('Basic Skill', 9, 'Passive', 1),
('First Aid', 1, 'Active', 1);

-- Swordsman Skills
INSERT INTO SKILL (name, max_level, type, job_id) VALUES 
('Sword Mastery', 10, 'Passive', 2),
('Increased HP Recovery', 10, 'Passive', 2),
('Bash', 10, 'Active', 2),
('Magnum Break', 10, 'Active', 2);

-- Mage Skills
INSERT INTO SKILL (name, max_level, type, job_id) VALUES 
('Increase SP Recovery', 10, 'Passive', 3),
('Napalm Beat', 10, 'Active', 3),
('Soul Strike', 10, 'Active', 3),
('Fire Bolt', 10, 'Active', 3),
('Cold Bolt', 10, 'Active', 3),
('Lightning Bolt', 10, 'Active', 3);

-- Archer Skills
INSERT INTO SKILL (name, max_level, type, job_id) VALUES 
('Owl's Eye', 10, 'Passive', 4),
('Vulture's Eye', 10, 'Passive', 4),
('Double Strafe', 10, 'Active', 4),
('Arrow Shower', 10, 'Active', 4);

-- Acolyte Skills
INSERT INTO SKILL (name, max_level, type, job_id) VALUES 
('Divine Protection', 10, 'Passive', 5),
('Demon Bane', 10, 'Passive', 5),
('Heal', 10, 'Active', 5),
('Cure', 1, 'Active', 5),
('Blessing', 10, 'Active', 5),
('Angelus', 10, 'Active', 5);

-- Merchant Skills
INSERT INTO SKILL (name, max_level, type, job_id) VALUES 
('Enlarge Weight Limit', 10, 'Passive', 6),
('Discount', 10, 'Passive', 6),
('Overcharge', 10, 'Passive', 6),
('Pushcart', 10, 'Active', 6),
('Vending', 10, 'Active', 6);

-- Thief Skills
INSERT INTO SKILL (name, max_level, type, job_id) VALUES 
('Double Attack', 10, 'Passive', 7),
('Improve Dodge', 10, 'Passive', 7),
('Steal', 10, 'Active', 7),
('Hide', 10, 'Active', 7);

-- Insertar datos en MONSTER
INSERT INTO MONSTER (name, level, hp, exp, job_exp) VALUES 
('Poring', 1, 50, 2, 1),
('Lunatic', 3, 60, 4, 2),
('Fabre', 5, 80, 7, 3),
('Pupa', 4, 10, 2, 1),
('Rocker', 9, 130, 14, 7);

-- Insertar datos en MONSTER_DROP
INSERT INTO MONSTER_DROP (monster_id, item_id, drop_rate) VALUES 
(1, 8, 7.0),  -- Poring drops Red Potion
(1, 10, 0.1), -- Poring drops Wing of Fly
(2, 8, 4.5),  -- Lunatic drops Red Potion
(3, 9, 2.0),  -- Fabre drops Blue Potion
(5, 1, 0.5);  -- Rocker drops Knife

-- Insertar datos de ejemplo en CHARACTER
INSERT INTO `CHARACTER` (name, job_id, map_id, base_level, job_level, zeny, str, agi, vit, `int`, dex, luk, hp, sp) VALUES 
('Tristan', 2, 1, 25, 15, 10000, 20, 15, 18, 10, 12, 8, 500, 100),
('Elara', 3, 2, 22, 12, 8000, 10, 12, 10, 25, 20, 10, 300, 200),
('Rowan', 4, 3, 20, 10, 5000, 15, 25, 12, 10, 22, 15, 350, 80),
('Lyra', 5, 1, 18, 8, 3000, 12, 10, 15, 20, 18, 12, 400, 150);

-- Insertar datos de ejemplo en CHARACTER_SKILL
INSERT INTO CHARACTER_SKILL (character_id, skill_id, level) VALUES 
(1, 3, 5),  -- Tristan has Sword Mastery level 5
(1, 5, 3),  -- Tristan has Bash level 3
(2, 9, 7),  -- Elara has Soul Strike level 7
(2, 10, 5), -- Elara has Fire Bolt level 5
(3, 19, 6), -- Rowan has Double Strafe level 6
(4, 23, 4); -- Lyra has Heal level 4

-- Insertar datos de ejemplo en INVENTORY
INSERT INTO INVENTORY (character_id, item_id, quantity, slot) VALUES 
(1, 2, 1, 1),    -- Tristan has a Sword
(1, 6, 1, 2),    -- Tristan has a Cotton Shirt
(1, 8, 10, 3),   -- Tristan has 10 Red Potions
(2, 4, 1, 1),    -- Elara has a Rod
(2, 9, 5, 2),    -- Elara has 5 Blue Potions
(3, 3, 1, 1),    -- Rowan has a Bow
(3, 10, 3, 2),   -- Rowan has 3 Wing of Fly
(4, 1, 1, 1),    -- Lyra has a Knife
(4, 8, 15, 2);   -- Lyra has 15 Red Potions

-- Ejemplo de actualización (UPDATE)
UPDATE `CHARACTER` SET base_level = base_level + 1, job_level = job_level + 1, hp = hp + 20, sp = sp + 5 WHERE id = 1;

-- Ejemplo de eliminación (DELETE)
DELETE FROM INVENTORY WHERE character_id = 2 AND item_id = 9 AND quantity = 1;
