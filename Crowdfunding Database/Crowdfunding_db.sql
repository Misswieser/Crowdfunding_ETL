-- category---
CREATE TABLE category (
    category_id VARCHAR(20) NOT NULL,
		category VARCHAR(20) NOT NULL,
		PRIMARY KEY (category_id)
);

-- subcategory---
CREATE TABLE subcategory (
    subcategory_id VARCHAR(25) NOT NULL, 
		subcategory VARCHAR(25) NOT NULL,
		PRIMARY KEY (subcategory_id)
);

-- campaign---
CREATE TABLE campaign (
    cf_id INTEGER NOT NULL,
    contact_id INTEGER NOT NULL,
    company_name VARCHAR(200) NOT NULL,
    campaign_blurb VARCHAR(100) NOT NULL,
    goal NUMERIC NOT NULL,
    pledged NUMERIC NOT NULL,
    outcome VARCHAR(15) NOT NULL,
    backers_count INTEGER NOT NULL,
    country VARCHAR(10) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    campaign_launched_at TIMESTAMP NOT NULL,
    campaign_deadline TIMESTAMP NOT NULL,
    category_id VARCHAR(20) NOT NULL,
    subcategory_id VARCHAR(20) NOT NULL,	
		PRIMARY KEY(contact_id, category_id, subcategory_id), 
		FOREIGN KEY (category_id) REFERENCES category(category_id),
		FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id),
		CONSTRAINT campaign_contact_id_unique UNIQUE (contact_id)
);

-- contacts--
CREATE TABLE contacts (
    contact_id INTEGER NOT NULL, 
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
		PRIMARY KEY(contact_id),
		FOREIGN KEY (contact_id) REFERENCES campaign(contact_id)
);

----- View Tables------
SELECT * FROM category;
SELECT * FROM subcategory;
SELECT * FROM campaign;
SELECT * FROM contacts;

-- Data from csv files are imported to corresponding postgresql tables by using import/export function---
