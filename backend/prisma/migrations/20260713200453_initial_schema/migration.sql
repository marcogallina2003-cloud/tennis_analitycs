-- CreateEnum
CREATE TYPE "Surface" AS ENUM ('HARD', 'CLAY', 'GRASS');

-- CreateTable
CREATE TABLE "Player" (
    "id" SERIAL NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT NOT NULL,
    "country" TEXT,
    "birthDate" TIMESTAMP(3),
    "height" INTEGER,
    "hand" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Player_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Match" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "tournament" TEXT NOT NULL,
    "surface" "Surface" NOT NULL,
    "score" TEXT NOT NULL,
    "winnerId" INTEGER NOT NULL,
    "loserId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Match_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_winnerId_fkey" FOREIGN KEY ("winnerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_loserId_fkey" FOREIGN KEY ("loserId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
