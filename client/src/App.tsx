import { useState } from "react"

interface Joke {
  setup: string
  punchline: string
}

function App() {
  const [joke, setJoke] = useState<Joke | null>(null)
  const [loading, setLoading] = useState(false)

  const fetchJoke = async () => {
    setLoading(true)
    try {
      const res = await fetch("/api/joke")
      const data: Joke = await res.json()
      setJoke(data)
    } catch (err) {
      console.error(err)
    } finally {
      setLoading(false)
    }
  }

  return (
    <div>
      <h1>Jokes App</h1>
      <button onClick={fetchJoke} disabled={loading}>
        {loading ? "Loading..." : "Get Joke"}
      </button>
      {joke && (
        <div>
          <p>{joke.setup}</p>
          <p>{joke.punchline}</p>
        </div>
      )}
    </div>
  )
}

export default App