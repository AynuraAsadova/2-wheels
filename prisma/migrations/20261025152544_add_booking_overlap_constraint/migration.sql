ALTER TABLE "bookings"
  ADD CONSTRAINT bookings_no_overlap
  EXCLUDE USING gist (
    tstzrange("start_at", "end_at") WITH &&
  )
  WHERE (status IN ('pending', 'confirmed'));