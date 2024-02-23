import { prisma } from "@/lib/prisma";
import { log } from "console";
import { NextRequest } from "next/server";

export async function GET(req: Request){
    const bloks = await prisma.blok.findMany();

    return Response.json(bloks);
}

export async function POST(req: NextRequest){

    log(req.json())
    // const bloks = await prisma.blok.create({
    //     data: {

    //     }
    // })

    return Response.json("success")
}