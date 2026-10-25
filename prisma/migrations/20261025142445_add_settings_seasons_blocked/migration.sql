/*
  Warnings:

  - Added the required column `season` to the `business_hours` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Season" AS ENUM ('summer', 'winter');

-- DropIndex
DROP INDEX "business_hours_weekday_idx";

-- AlterTable
ALTER TABLE "business_hours" ADD COLUMN     "season" "Season" NOT NULL;

-- CreateTable
CREATE TABLE "business_settings" (
    "id" TEXT NOT NULL,
    "timezone" TEXT NOT NULL DEFAULT 'America/Los_Angeles',
    "slot_step_min" INTEGER NOT NULL DEFAULT 30,
    "cancel_window_h" INTEGER NOT NULL DEFAULT 48,
    "summer_start_month" INTEGER NOT NULL DEFAULT 4,
    "summer_end_month" INTEGER NOT NULL DEFAULT 9,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "business_settings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blocked_dates" (
    "id" TEXT NOT NULL,
    "start_at" TIMESTAMP(3) NOT NULL,
    "end_at" TIMESTAMP(3) NOT NULL,
    "reason" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "blocked_dates_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "business_hours_season_weekday_idx" ON "business_hours"("season", "weekday");
