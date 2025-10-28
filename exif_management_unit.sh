for file in /home/madi/my-website/site_media/photos_on_site/*; do
	if [[ -n "$(exiftool "$file" | grep "User Comment")" ]]; then
		echo "There was already User Comment in exif!"
	else
		echo "no comment in $file, commencing removing all exifdata, then adding fake exif"
		exiftool -All= "$file"	
		exiftool -EXIF:GPSLongitude="28.85672522729365"  -EXIF:GPSLatitude="55.5731326736198" -GPSLongitudeRef="East" -GPSLatitudeRef="North" "$file"
		exiftool -EXIF:UserComment="you should stop looking through exif tags" "$file"
	fi
done

# remove files with original in the name, after converting
for file in /home/madi/my-website/site_media/photos_on_site/*; do
        if [[ "$file" == *original* ]]; then
                rm "$file"
                echo "file removed!"
        else
                echo "Didn't remove file as it doesn't contain \"original\" string inside of it!"
        fi
done


