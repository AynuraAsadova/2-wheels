-- CreateTable
CREATE TABLE "service_areas" (
    "id" TEXT NOT NULL,
    "postal_code" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "service_areas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "business_hours" (
    "id" TEXT NOT NULL,
    "weekday" INTEGER NOT NULL,
    "open_min" INTEGER NOT NULL,
    "close_min" INTEGER NOT NULL,

    CONSTRAINT "business_hours_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "service_areas_postal_code_key" ON "service_areas"("postal_code");

-- CreateIndex
CREATE INDEX "business_hours_weekday_idx" ON "business_hours"("weekday");
