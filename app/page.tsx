"use client"

import { getServerSession } from "next-auth";
import User from "./user";
import { authOptions } from "@/lib/authOptions";

export default async function Home() {
  const session = await getServerSession(authOptions);

  const handleButton = async () => {
    fetch("http://localhost:3000/api/blok", {
      method: "POST",
      body: JSON.stringify({
        status: 200,
        message: "success"
      })
    })
  }

  return (
    <main className="">
      <div>{JSON.stringify(session)}</div>
      <div>
        <User></User>
      </div>
      <div>
        <button onClick={() => handleButton}>
          tst
        </button>
      </div>
    </main>
  );
}
