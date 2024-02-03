import { getServerSession } from "next-auth";
import { authOptions } from "./api/auth/[...nextauth]/route";
import User from "./user";

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
