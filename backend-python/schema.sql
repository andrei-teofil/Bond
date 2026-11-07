PRAGMA foreign_keys = ON;

CREATE TABLE "users" (
  "id" INTEGER PRIMARY KEY,
  "username" TEXT,
  "first_name" TEXT,
  "last_name" TEXT,
  "date_of_birth" TEXT,
  "email" TEXT,
  "password" TEXT
);

CREATE TABLE "posts" (
  "id" INTEGER PRIMARY KEY,
  "user_id" INTEGER NOT NULL,
  "text_content" TEXT,
  "image_content" TEXT,
  "created_at" TEXT,
  CONSTRAINT "user_posts" FOREIGN KEY ("user_id") REFERENCES "users" ("id") DEFERRABLE INITIALLY IMMEDIATE
);

CREATE TABLE "comments" (
  "id" INTEGER PRIMARY KEY,
  "user_id" INTEGER NOT NULL,
  "post_id" INTEGER NOT NULL,
  "text_content" TEXT,
  "image_content" TEXT,
  "created_at" TEXT,
  CONSTRAINT "post_comments" FOREIGN KEY ("post_id") REFERENCES "posts" ("id") DEFERRABLE INITIALLY IMMEDIATE,
  CONSTRAINT "user_comments" FOREIGN KEY ("user_id") REFERENCES "users" ("id") DEFERRABLE INITIALLY IMMEDIATE
);

BEGIN TRANSACTION;

INSERT INTO "users" ("id", "username", "first_name", "last_name", "date_of_birth", "email", "password")
VALUES (0, 'mihai-p', 'Mihai', 'Panescu', '2009-10-31', 'example@email.com', '1234');

INSERT INTO "users" ("id", "username", "first_name", "last_name", "date_of_birth", "email", "password")
VALUES (1, 'sebi-c', 'Sebastian', 'Crigan', '2011-12-14', 'example@email.com', '1234');

INSERT INTO "users" ("id", "username", "first_name", "last_name", "date_of_birth", "email", "password")
VALUES (2, 'seba-z', 'Seba', 'Zavu', '2012-02-09', 'example@email.com', '1234');

COMMIT;