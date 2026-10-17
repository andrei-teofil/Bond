CREATE TABLE "comments" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "post_id" integer NOT NULL,
  "text_content" text,
  "image_content" varchar,
  "created_at" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "date_of_birth" timestamp,
  "email" varchar,
  "password" varchar
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "text_content" text,
  "image_content" varchar,
  "created_at" timestamp
);

COMMENT ON COLUMN "comments"."text_content" IS 'Content of the post';

COMMENT ON COLUMN "posts"."text_content" IS 'Content of the post';

ALTER TABLE "posts" ADD CONSTRAINT "user_posts" FOREIGN KEY ("user_id") REFERENCES "users" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "comments" ADD CONSTRAINT "post_comments" FOREIGN KEY ("post_id") REFERENCES "posts" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "comments" ADD CONSTRAINT "user_comments" FOREIGN KEY ("user_id") REFERENCES "users" ("id") DEFERRABLE INITIALLY IMMEDIATE;

-- Defer constraint checking for INSERT
BEGIN;
SET CONSTRAINTS ALL DEFERRED;

INSERT INTO "users" ("id", "username", "first_name", "last_name", "date_of_birth", "email", "password")
VALUES
  (0, 'mihai-p', 'Mihai', 'Panescu', '2009-10-31', 'example@email.com', '1234'),
  (1, 'sebi-c', 'Sebastian', 'Crigan', '2011-12-14', 'example@email.com', '1234'),
  (2, 'seba-z', 'Seba', 'Zavu', '2012-02-09', 'example@email.com', '1234');

SET CONSTRAINTS ALL IMMEDIATE;
COMMIT;