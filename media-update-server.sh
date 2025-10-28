#!/bin/bash

while true; do
	LS_BEFORE_PHOTOS="$(ls /home/madii/photo_media)"
	LS_BEFORE_VIDEOS="$(ls /home/madii/video_media)"

	sleep 10

	LS_NOW_PHOTOS="$(ls /home/madii/photo_media)"
	LS_NOW_VIDEOS="$(ls /home/madii/video_media)"

	if [[ $LS_BEFORE_PHOTOS != $LS_NOW_PHOTOS ]]; then
		chown flaskuser:flaskuser /home/madii/photo_media/*
		rsync -Pa --ignore-existing /home/madii/photo_media/* /home/flaskuser/site/static/images
	fi
	if [[ $LS_BEFORE_VIDEOS != $LS_NOW_VIDEOS ]]; then
		chown flaskuser:flaskuser /home/madii/video_media/*
		rsync -Pa --ignore-existing /home/madii/video_media/* /home/flaskuser/site/static/videos
        fi

done
