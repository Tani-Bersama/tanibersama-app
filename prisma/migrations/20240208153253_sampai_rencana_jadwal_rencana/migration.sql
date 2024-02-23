-- CreateTable
CREATE TABLE "Cluster" (
    "id" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "supervisorId" TEXT,

    CONSTRAINT "Cluster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Supervisor" (
    "id" TEXT NOT NULL,
    "telp" TEXT NOT NULL,

    CONSTRAINT "Supervisor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Blok" (
    "id" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "desa" TEXT NOT NULL,
    "kecamatan" TEXT NOT NULL,
    "kabupaten" TEXT NOT NULL,
    "luas" DOUBLE PRECISION NOT NULL,
    "korlapId" TEXT,
    "clusterId" TEXT,

    CONSTRAINT "Blok_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Korlap" (
    "id" TEXT NOT NULL,
    "nama" TEXT NOT NULL,

    CONSTRAINT "Korlap_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Lahan" (
    "id" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "luas" DOUBLE PRECISION NOT NULL,
    "blokId" TEXT,

    CONSTRAINT "Lahan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Petani" (
    "id" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "nik" TEXT NOT NULL,
    "desa" TEXT NOT NULL,
    "kecamatan" TEXT NOT NULL,
    "kabupaten" TEXT NOT NULL,
    "tempatLahir" TEXT NOT NULL,
    "tanggalLahir" TEXT NOT NULL,
    "noHp" TEXT NOT NULL,
    "namaPasangan" TEXT NOT NULL,
    "nomorKk" TEXT NOT NULL,
    "npwp" TEXT NOT NULL,
    "noRekening" TEXT NOT NULL,

    CONSTRAINT "Petani_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RencanaJadwal" (
    "id" TEXT NOT NULL,
    "budidaya" TEXT NOT NULL,
    "hasilUji" TEXT NOT NULL,
    "rabHektar" TEXT NOT NULL,
    "rabTotal" TEXT NOT NULL,
    "blokId" TEXT,

    CONSTRAINT "RencanaJadwal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rencana" (
    "id" TEXT NOT NULL,
    "olahLahan" TEXT NOT NULL,
    "pemberianDolomit" TEXT NOT NULL,
    "rencanaJadwalId" TEXT,

    CONSTRAINT "Rencana_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Benih" (
    "id" TEXT NOT NULL,
    "rencanaId" TEXT,
    "lahanId" TEXT,

    CONSTRAINT "Benih_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_LahanToPetani" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Cluster_supervisorId_key" ON "Cluster"("supervisorId");

-- CreateIndex
CREATE UNIQUE INDEX "Blok_korlapId_key" ON "Blok"("korlapId");

-- CreateIndex
CREATE UNIQUE INDEX "RencanaJadwal_blokId_key" ON "RencanaJadwal"("blokId");

-- CreateIndex
CREATE UNIQUE INDEX "Rencana_rencanaJadwalId_key" ON "Rencana"("rencanaJadwalId");

-- CreateIndex
CREATE UNIQUE INDEX "_LahanToPetani_AB_unique" ON "_LahanToPetani"("A", "B");

-- CreateIndex
CREATE INDEX "_LahanToPetani_B_index" ON "_LahanToPetani"("B");

-- AddForeignKey
ALTER TABLE "Cluster" ADD CONSTRAINT "Cluster_supervisorId_fkey" FOREIGN KEY ("supervisorId") REFERENCES "Supervisor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Blok" ADD CONSTRAINT "Blok_korlapId_fkey" FOREIGN KEY ("korlapId") REFERENCES "Korlap"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Blok" ADD CONSTRAINT "Blok_clusterId_fkey" FOREIGN KEY ("clusterId") REFERENCES "Cluster"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lahan" ADD CONSTRAINT "Lahan_blokId_fkey" FOREIGN KEY ("blokId") REFERENCES "Blok"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RencanaJadwal" ADD CONSTRAINT "RencanaJadwal_blokId_fkey" FOREIGN KEY ("blokId") REFERENCES "Blok"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rencana" ADD CONSTRAINT "Rencana_rencanaJadwalId_fkey" FOREIGN KEY ("rencanaJadwalId") REFERENCES "RencanaJadwal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Benih" ADD CONSTRAINT "Benih_rencanaId_fkey" FOREIGN KEY ("rencanaId") REFERENCES "Rencana"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Benih" ADD CONSTRAINT "Benih_lahanId_fkey" FOREIGN KEY ("lahanId") REFERENCES "Lahan"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LahanToPetani" ADD CONSTRAINT "_LahanToPetani_A_fkey" FOREIGN KEY ("A") REFERENCES "Lahan"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LahanToPetani" ADD CONSTRAINT "_LahanToPetani_B_fkey" FOREIGN KEY ("B") REFERENCES "Petani"("id") ON DELETE CASCADE ON UPDATE CASCADE;
