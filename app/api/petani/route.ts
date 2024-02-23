import { prisma } from "@/lib/prisma";

export async function GET(req: Request){
    const petani = await prisma.petani.findMany();

    return Response.json(petani);
}