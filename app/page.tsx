import { getServerSession } from "next-auth";
import User from "./user";
import { authOptions } from "@/lib/authOptions";

export default async function Home() {
  const session = await getServerSession(authOptions);

  return (
    <main className="">
      <div>{JSON.stringify(session)}</div>
      <div>
        <User></User>
      </div>
    </main>
  );
}
