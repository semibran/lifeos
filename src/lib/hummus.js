export function fromSeconds (secsTotal) {
  const secs = secsTotal % 60
  const minsTotal = (secsTotal - secs) / 60
  const mins = minsTotal % 60
  const hours = (minsTotal - mins) / 60

  let time = secs.toString()
  if (secs < 10) {
    time = '0' + time
  }

  time = mins + ':' + time
  if (hours && mins < 10) {
    time = '0' + time
  }

  if (hours) {
    time = hours + ':' + time
  }

  return time
}

export function toSeconds (currentTime) {
  let secs = 0
  const time = currentTime.split(':')
  secs += parseInt(time[0]) * 60 * 60 + parseInt(time[1]) * 60 + parseInt(time[2])
  return secs
}
