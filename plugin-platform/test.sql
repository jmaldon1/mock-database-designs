-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: "Plugin-platform" | type: DATABASE --
-- DROP DATABASE IF EXISTS "Plugin-platform";
CREATE DATABASE "Plugin-platform";
-- ddl-end --


-- object: db | type: SCHEMA --
-- DROP SCHEMA IF EXISTS db CASCADE;
CREATE SCHEMA db;
-- ddl-end --
ALTER SCHEMA db OWNER TO postgres;
-- ddl-end --

-- object: data | type: SCHEMA --
-- DROP SCHEMA IF EXISTS data CASCADE;
CREATE SCHEMA data;
-- ddl-end --
ALTER SCHEMA data OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,db,data;
-- ddl-end --

-- object: data.plugins | type: TABLE --
-- DROP TABLE IF EXISTS data.plugins CASCADE;
CREATE TABLE data.plugins (
	id serial NOT NULL,
	name text NOT NULL,
	description text,
	CONSTRAINT plugins_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE data.plugins OWNER TO postgres;
-- ddl-end --

-- object: data.operating_systems | type: TABLE --
-- DROP TABLE IF EXISTS data.operating_systems CASCADE;
CREATE TABLE data.operating_systems (
	id serial NOT NULL,
	"operating system" varchar(50),
	CONSTRAINT operating_systems_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE data.operating_systems OWNER TO postgres;
-- ddl-end --

-- object: data.plugin_operating_systems | type: TABLE --
-- DROP TABLE IF EXISTS data.plugin_operating_systems CASCADE;
CREATE TABLE data.plugin_operating_systems (
	id serial NOT NULL,
	plugin_id integer,
	operating_system_id integer,
	CONSTRAINT plugin_operating_systems_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE data.plugin_operating_systems OWNER TO postgres;
-- ddl-end --

-- object: data.all_plugin_types | type: TABLE --
-- DROP TABLE IF EXISTS data.all_plugin_types CASCADE;
CREATE TABLE data.all_plugin_types (
	id serial,
	type varchar(5) NOT NULL,
	CONSTRAINT plugin_types_pk PRIMARY KEY (type)

);
-- ddl-end --
ALTER TABLE data.all_plugin_types OWNER TO postgres;
-- ddl-end --

-- object: data.plugin_types | type: TABLE --
-- DROP TABLE IF EXISTS data.plugin_types CASCADE;
CREATE TABLE data.plugin_types (
	id serial NOT NULL,
	plugin_id integer,
	plugin_type varchar(5),
	CONSTRAINT plugin_types_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE data.plugin_types OWNER TO postgres;
-- ddl-end --

-- object: data.plugin_downloads | type: TABLE --
-- DROP TABLE IF EXISTS data.plugin_downloads CASCADE;
CREATE TABLE data.plugin_downloads (
	id serial NOT NULL,
	download_link text,
	CONSTRAINT plugin_downloads_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE data.plugin_downloads OWNER TO postgres;
-- ddl-end --

-- object: plugins_fk | type: CONSTRAINT --
-- ALTER TABLE data.plugin_operating_systems DROP CONSTRAINT IF EXISTS plugins_fk CASCADE;
ALTER TABLE data.plugin_operating_systems ADD CONSTRAINT plugins_fk FOREIGN KEY (plugin_id)
REFERENCES data.plugins (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: operating_systems_fk | type: CONSTRAINT --
-- ALTER TABLE data.plugin_operating_systems DROP CONSTRAINT IF EXISTS operating_systems_fk CASCADE;
ALTER TABLE data.plugin_operating_systems ADD CONSTRAINT operating_systems_fk FOREIGN KEY (operating_system_id)
REFERENCES data.operating_systems (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: plugins_fk | type: CONSTRAINT --
-- ALTER TABLE data.plugin_types DROP CONSTRAINT IF EXISTS plugins_fk CASCADE;
ALTER TABLE data.plugin_types ADD CONSTRAINT plugins_fk FOREIGN KEY (plugin_id)
REFERENCES data.plugins (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: all_plugin_types_fk | type: CONSTRAINT --
-- ALTER TABLE data.plugin_types DROP CONSTRAINT IF EXISTS all_plugin_types_fk CASCADE;
ALTER TABLE data.plugin_types ADD CONSTRAINT all_plugin_types_fk FOREIGN KEY (plugin_type)
REFERENCES data.all_plugin_types (type) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


