import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  await prisma.$disconnect(); // comment this if you need to seed

  await prisma.cluster.createMany({
    data: [
      {
        nama: "CLUSTER1"
      },
      {
        nama: "CLUSTER2"
      },
      {
        nama: "CLUSTER3"
      }
    ]
  })

  await prisma.supervisor.createMany({
    data: [
      {
        telp: "085824514921"
      },
      {
        telp: "081521425384"
      },
      {
        telp: "087352318423"
      }
    ]
  })

  await prisma.blok.createMany({
    data: [
      {
        nama: "BLOK1",
        desa: "DESA1",
        kecamatan: "KECAMATAN1",
        kabupaten: "KABUPATEN1",
        luas: 200.6,
      },
      {
        nama: "BLOK2",
        desa: "DESA2",
        kecamatan: "KECAMATAN2",
        kabupaten: "KABUPATEN2",
        luas: 300.1,
      },
      {
        nama: "BLOK3",
        desa: "DESA3",
        kecamatan: "KECAMATAN3",
        kabupaten: "KABUPATEN3",
        luas: 400.2,
      }
    ]
  })

  const petani = await prisma.petani.createMany({
    data : [
      {
        nama : "TARYONO HR",
        nik : "3215201009730003",
        tempatLahir : "KARAWANG",
        tanggalLahir : "100973",
        desa : "CIKUNTUL TIMUR",
        kecamatan : "TEMPURAN",
        namaPasangan : "TARSIH",
        noHp : "083213921031",
        nomorKk : "3215201404120024",
        noRekening : "321313213",
        npwp : "321313131",
        kabupaten : "TEMPURAN"
      },
      {
        nama: "SITI RAHAYU",
        nik: "3215201108740002",
        tempatLahir: "BANDUNG",
        tanggalLahir: "110874",
        desa: "CILILIN",
        kecamatan: "CILILIN",
        namaPasangan: "BUDI",
        noHp: "081234567890",
        nomorKk: "3215201404120025",
        noRekening: "987654321",
        npwp: "543210987",
        kabupaten: "BANDUNG",
      },
      {
        nama: "BUDI SANTOSO",
        nik: "3215200905550001",
        tempatLahir: "SEMARANG",
        tanggalLahir: "090555",
        desa: "KARANGANYAR",
        kecamatan: "UNGARAN",
        namaPasangan: "SRI WULANDARI",
        noHp: "081567890123",
        nomorKk: "3215201404120026",
        noRekening: "123456789",
        npwp: "987654321",
        kabupaten: "SEMARANG",
      },
      {
        nama: "ANDI SURYANDI",
        nik: "546565454546545454",
        tempatLahir: "SEMARANG",
        tanggalLahir: "040703",
        desa: "KARANGANYAR",
        kecamatan: "UNGARAN",
        namaPasangan: "WULAN",
        noHp: "084525421321",
        nomorKk: "3215201404120026",
        noRekening: "333333333",
        npwp: "3333122221",
        kabupaten: "SEMARANG",
      }
      
    ]
  });

  const lahan = await prisma.lahan.createMany({
    data : [
      {
        nama : "Lahan 1",
        luas : 60.2
      },
      {
        nama : "Lahan 2",
        luas : 65.2
      },
      {
        nama : "Lahan 3",
        luas : 69.2
      },
    ]
  })

  const korlap = await prisma.korlap.createMany({
    data : [
      {
        nama : "korlap 1"
      },
      {
        nama : "korlap 2"
      },
      {
        nama : "korlap 3"
      },
    ]
  })
}
main()
  .then(() => prisma.$disconnect())
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
