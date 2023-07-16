DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
    project_id INT NOT NULL PRIMARY KEY,
    project_name VARCHAR(128) NOT NULL,
    estimated_hours DECIMAL(7,2),
    actual_hours DECIMAL(7,2),
    difficulty INT,
    notes TEXT
);

-- Create table for storing material information
CREATE TABLE material (
    material_id INT NOT NULL PRIMARY KEY,
    project_id INT NOT NULL,
    material_name VARCHAR(128) NOT NULL,
    num_required INT,
    cost DECIMAL(7,2),
    CONSTRAINT fk_material_project FOREIGN KEY (project_id) REFERENCES project (project_id)
);

-- Create table for storing step information
CREATE TABLE step (
    step_id INT NOT NULL PRIMARY KEY,
    project_id INT NOT NULL,
    step_text TEXT NOT NULL,
    step_order INT NOT NULL,
    CONSTRAINT fk_step_project FOREIGN KEY (project_id) REFERENCES project (project_id)
);

-- Create table for storing category information
CREATE TABLE category (
    category_id INT NOT NULL PRIMARY KEY,
    category_name VARCHAR(128) NOT NULL
);

-- Create table for storing project category information
CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT pk_project_category PRIMARY KEY (project_id, category_id),
    CONSTRAINT fk_project_category_project FOREIGN KEY (project_id) REFERENCES project (project_id),
    CONSTRAINT fk_project_category_category FOREIGN KEY (category_id) REFERENCES category (category_id)
); 