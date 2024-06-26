CREATE TABLE IF NOT EXISTS "brocode" (
	"id" serial PRIMARY KEY NOT NULL,
	"brocode" text,
	"age" numeric
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "chat" (
	"id" serial PRIMARY KEY NOT NULL,
	"sender" text,
	"receiver" text,
	"desc" text,
	"type" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "featuresStuff" (
	"id" serial PRIMARY KEY NOT NULL,
	"user_id" text,
	"type" text,
	"pic" numeric,
	"price" numeric,
	"delivery" numeric,
	"revision" numeric,
	"desc" text,
	"features" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_key" (
	"id" varchar(255) PRIMARY KEY NOT NULL,
	"user_id" varchar(15) NOT NULL,
	"hashed_password" varchar(255)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "posts" (
	"id" serial PRIMARY KEY NOT NULL,
	"imgurl" text,
	"caption" text,
	"username" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "profile" (
	"id" serial PRIMARY KEY NOT NULL,
	"username" text,
	"firstName" text,
	"description" text,
	"user_image" text,
	"total_images" numeric DEFAULT '0',
	"insta" text,
	"linked" text,
	"tweet" text,
	"profile_link" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_session" (
	"id" varchar(128) PRIMARY KEY NOT NULL,
	"user_id" varchar(15) NOT NULL,
	"active_expires" bigint NOT NULL,
	"idle_expires" bigint NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id" varchar(15) PRIMARY KEY NOT NULL,
	"email" varchar(30) NOT NULL,
	"username" varchar(40),
	CONSTRAINT "auth_user_username_unique" UNIQUE("username")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "userDetailInfo" (
	"id" serial PRIMARY KEY NOT NULL,
	"user_id" text,
	"expert_in" text,
	"about" text,
	"skills" text
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "chat" ADD CONSTRAINT "chat_sender_auth_user_username_fk" FOREIGN KEY ("sender") REFERENCES "auth_user"("username") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "featuresStuff" ADD CONSTRAINT "featuresStuff_user_id_auth_user_username_fk" FOREIGN KEY ("user_id") REFERENCES "auth_user"("username") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_key" ADD CONSTRAINT "user_key_user_id_auth_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "posts" ADD CONSTRAINT "posts_username_auth_user_username_fk" FOREIGN KEY ("username") REFERENCES "auth_user"("username") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "profile" ADD CONSTRAINT "profile_username_auth_user_username_fk" FOREIGN KEY ("username") REFERENCES "auth_user"("username") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_session" ADD CONSTRAINT "user_session_user_id_auth_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "userDetailInfo" ADD CONSTRAINT "userDetailInfo_user_id_auth_user_username_fk" FOREIGN KEY ("user_id") REFERENCES "auth_user"("username") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
