#!/bin/bash

# upload videos
rsync -Pa --ignore-existing /home/madi/my-website/site_media/silly_videos/* madii@107.174.70.103:/home/madii/video_media

# upload photos
rsync -Pa --ignore-existing /home/madi/my-website/site_media/photos_on_site/* madii@107.174.70.103:/home/madii/photo_media
