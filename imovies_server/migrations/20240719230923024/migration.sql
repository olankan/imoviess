BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "movie_ids" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "movies_by_id" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "movieId" bigint NOT NULL
);


--
-- MIGRATION VERSION FOR imovies
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('imovies', '20240719230923024', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240719230923024', "timestamp" = now();

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
