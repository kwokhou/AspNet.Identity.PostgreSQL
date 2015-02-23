﻿ CREATE TABLE "AspNetRoles" ( 
  "Id" varchar(128) NOT NULL,
  "Name" varchar(256) NOT NULL,
  PRIMARY KEY ("Id")
);

CREATE TABLE "AspNetUsers" (
  "Id" character varying(128) NOT NULL,
  "UserName" character varying(256) NOT NULL,
  "UserNameLowercase" character varying(256) NOT NULL,
  "PasswordHash" character varying(256),
  "SecurityStamp" character varying(256),
  "Email" character varying(256) DEFAULT NULL::character varying,
  "EmailLowercase" character varying(256) DEFAULT NULL::character varying,
  "EmailConfirmed" boolean NOT NULL DEFAULT false,
  LockoutEnabled boolean DEFAULT false,
  "LoginAttemps" int DEFAULT 0,
  "LockoutEndDate" timestamp without time zone DEFAULT NULL::timestamp without time zone,
  "PhoneNumber" character varying(256) DEFAULT NULL::character varying,
  "PhoneNumberConfirmed" boolean NOT NULL DEFAULT false,
  "TwoFactorAuthEnabled" boolean NOT NULL DEFAULT false,
  PRIMARY KEY ("Id")
);

CREATE TABLE "AspNetUserClaims" ( 
  "Id" serial NOT NULL,
  "ClaimType" varchar(256) NULL,
  "ClaimValue" varchar(256) NULL,
  "UserId" varchar(128) NOT NULL,
  PRIMARY KEY ("Id")
);

CREATE TABLE "AspNetUserLogins" ( 
  "UserId" varchar(128) NOT NULL,
  "LoginProvider" varchar(128) NOT NULL,
  "ProviderKey" varchar(128) NOT NULL,
  PRIMARY KEY ("UserId", "LoginProvider", "ProviderKey")
);

CREATE TABLE "AspNetUserRoles" ( 
  "UserId" varchar(128) NOT NULL,
  "RoleId" varchar(128) NOT NULL,
  PRIMARY KEY ("UserId", "RoleId")
);

CREATE INDEX "IX_AspNetUserClaims_UserId"	ON "AspNetUserClaims"	("UserId");
CREATE INDEX "IX_AspNetUserLogins_UserId"	ON "AspNetUserLogins"	("UserId");
CREATE INDEX "IX_AspNetUserRoles_RoleId"	ON "AspNetUserRoles"	("RoleId");
CREATE INDEX "IX_AspNetUserRoles_UserId"	ON "AspNetUserRoles"	("UserId");

ALTER TABLE "AspNetUserClaims"
  ADD CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_User_Id" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id")
  ON DELETE CASCADE;

ALTER TABLE "AspNetUserLogins"
  ADD CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id")
  ON DELETE CASCADE;

ALTER TABLE "AspNetUserRoles"
  ADD CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id")
  ON DELETE CASCADE;

ALTER TABLE "AspNetUserRoles"
  ADD CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id")
  ON DELETE CASCADE;

  ALTER TABLE "AspNetRoles" OWNER TO angelo;
  ALTER TABLE "AspNetUserClaims" OWNER TO angelo;
  ALTER TABLE "AspNetUserLogins" OWNER TO angelo;
  ALTER TABLE "AspNetUserRoles" OWNER TO angelo;
  ALTER TABLE "AspNetUsers" OWNER TO angelo;