-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('ADMIN', 'USER');

-- CreateEnum
CREATE TYPE "Jenis_kelamin" AS ENUM ('L', 'P');

-- CreateTable
CREATE TABLE "Mahasiswa" (
    "nim" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "kelas" TEXT NOT NULL,
    "jurusan" TEXT NOT NULL,
    "jenis_kelamin" "Jenis_kelamin" NOT NULL,
    "dibuat_pada" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Mahasiswa_pkey" PRIMARY KEY ("nim")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "password" TEXT NOT NULL,
    "role" "UserRole" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ruangan" (
    "id" INTEGER NOT NULL,
    "nama_ruangan" TEXT NOT NULL,

    CONSTRAINT "Ruangan_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Ruangan_id_key" ON "Ruangan"("id");
