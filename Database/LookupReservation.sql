SELECT 
reservationID,
hotelName,
hotelPictureURL,
checkIn,
checkOut,
roomDescription,
CONCAT(IF(wifi > 0, 'WiFi',''), '', IF(breakfast>0, 'Breakfast', ''), '', IF(parking>0, 'Parking', '')) AS Amenities,
price,
guests
FROM provisio.reservations r
	JOIN provisio.hotels h
		ON r.hotelID = h.hotelID
    JOIN provisio.rooms rm
		ON r.roomID = rm.roomID