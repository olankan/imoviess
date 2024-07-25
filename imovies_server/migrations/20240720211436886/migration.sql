BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "movies_by_id" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "movies_by_id" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "movieId" bigint NOT NULL,
    "userId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "movies_by_id"
    ADD CONSTRAINT "movies_by_id_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR imovies
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('imovies', '20240720211436886', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240720211436886', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
