-- Create base tables
CREATE TABLE character_classes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    primary_attribute VARCHAR(20) NOT NULL,
    resource_type VARCHAR(20) NOT NULL, -- mana, rage, essence etc
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE spells (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    damage_type VARCHAR(20),
    base_damage INTEGER,
    casting_time VARCHAR(20),
    cooldown INTEGER, -- in seconds
    resource_cost INTEGER,
    class_id INTEGER REFERENCES character_classes(id),
    level_requirement INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE talents (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    talent_type VARCHAR(50) NOT NULL, -- passive, active, ultimate
    class_id INTEGER REFERENCES character_classes(id),
    level_requirement INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE weapons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    weapon_type VARCHAR(50) NOT NULL, -- sword, bow, staff, etc
    base_damage INTEGER NOT NULL,
    damage_type VARCHAR(20) NOT NULL,
    weight DECIMAL(4,1) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Character Classes
INSERT INTO character_classes (name, description, primary_attribute, resource_type) VALUES
    ('Naturalist', 'Masters of natural magic who can shape the elements and commune with spirits. They excel at healing and controlling the battlefield.', 'Wisdom', 'Essence'),
    ('Champion', 'Elite warriors who combine martial prowess with inspirational leadership. They excel at close combat and rallying allies.', 'Strength', 'Valor'),
    ('Necrolock', 'Dark spellcasters who draw power from death itself. They excel at debuffing enemies and summoning undead servants.', 'Intelligence', 'Soul Power');

-- Insert Spells
INSERT INTO spells (name, description, damage_type, base_damage, casting_time, cooldown, resource_cost, class_id, level_requirement) VALUES
    -- Naturalist Spells
    ('Nature''s Embrace', 'Healing vines wrap around an ally, restoring health over time', 'Healing', 50, 'Instant', 15, 25, 1, 1),
    ('Thornstrike', 'Launches a thorned vine that damages and roots the target', 'Nature', 30, '1.5s', 8, 20, 1, 1),
    ('Storm Call', 'Summons a lightning storm that strikes multiple enemies', 'Lightning', 75, '2.5s', 30, 50, 1, 5),
    
    -- Champion Spells
    ('Rally', 'Inspires nearby allies, increasing their combat effectiveness', NULL, 0, 'Instant', 45, 30, 2, 1),
    ('Shield Wall', 'Raises a defensive stance, reducing incoming damage', NULL, 0, 'Instant', 20, 25, 2, 1),
    ('Devastating Strike', 'A powerful weapon attack that cleaves through enemies', 'Physical', 85, 'Instant', 12, 35, 2, 5),
    
    -- Necrolock Spells
    ('Soul Drain', 'Drains life force from an enemy, healing the caster', 'Shadow', 40, '2s', 10, 30, 3, 1),
    ('Raise Dead', 'Raises a fallen warrior to fight for the Necrolock', NULL, 0, '3s', 60, 50, 3, 1),
    ('Death Cloud', 'Creates a cloud of necrotic energy that damages and weakens enemies', 'Shadow', 65, '2.5s', 25, 45, 3, 5);

-- Insert Talents
INSERT INTO talents (name, description, talent_type, class_id, level_requirement) VALUES
    -- Naturalist Talents
    ('Spirit Speaker', 'Increases healing power and reduces essence costs of nature spells', 'Passive', 1, 1),
    ('Elemental Affinity', 'Your nature spells have a chance to trigger additional elemental effects', 'Passive', 1, 5),
    ('Nature''s Wrath', 'Transform into a powerful elemental form', 'Ultimate', 1, 10),
    
    -- Champion Talents
    ('Weapon Master', 'Increases damage with all weapons and grants combat technique bonuses', 'Passive', 2, 1),
    ('Unbreakable', 'Reduces damage taken when below 30% health', 'Passive', 2, 5),
    ('Hero''s Call', 'Dramatically increases combat abilities of self and nearby allies', 'Ultimate', 2, 10),
    
    -- Necrolock Talents
    ('Dark Knowledge', 'Increases the power of shadow spells and reduces their casting time', 'Passive', 3, 1),
    ('Soul Collector', 'Fallen enemies have a chance to yield additional soul power', 'Passive', 3, 5),
    ('Lord of the Dead', 'Greatly enhances undead minions and allows controlling more of them', 'Ultimate', 3, 10);

-- Insert Weapons
INSERT INTO weapons (name, description, weapon_type, base_damage, damage_type, weight) VALUES
    ('Oakenheart Staff', 'A staff carved from ancient heartwood, perfect for naturalists', 'Staff', 15, 'Nature', 4.5),
    ('Spirit Bow', 'A bow that channels nature''s energy into its arrows', 'Bow', 20, 'Physical', 2.5),
    ('Warhammer of Valor', 'A mighty hammer wielded by legendary champions', 'Hammer', 35, 'Physical', 8.0),
    ('Legion Sword', 'A well-balanced sword favored by champions', 'Sword', 25, 'Physical', 3.5),
    ('Soulreaper Scythe', 'A dark weapon that harvests the souls of the fallen', 'Scythe', 30, 'Shadow', 6.0),
    ('Bone Staff', 'A staff made from ancient bones, amplifies necromantic magic', 'Staff', 18, 'Shadow', 4.0); 
    