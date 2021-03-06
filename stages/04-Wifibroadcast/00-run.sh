# Do this to the WORK folder of this stage
pushd ${STAGE_WORK_DIR}

log "Removing old GIT dir"
rm -r GIT || true

mkdir -p GIT

pushd GIT

log "Download all WFB Sources"

MNT_DIR="${STAGE_WORK_DIR}/mnt"

git config --global --unset http.proxy
git config --global --unset https.proxy
log "v4l2loopback"
sudo git clone https://github.com/umlaeute/v4l2loopback.git

log "Download OpenVG"
sudo git clone https://github.com/RespawnDespair/openvg-font.git openvg

log "Download Mavlink router"
sudo git clone -b rock64 https://github.com/estechnical/mavlink-router.git
pushd mavlink-router
sudo git submodule update --init
#fix missing pymavlink
pushd modules/mavlink
sudo git clone --recurse-submodules  https://github.com/ArduPilot/pymavlink.git

popd
popd

log "Download cmavnode"
sudo git clone https://github.com/MonashUAS/cmavnode.git
pushd cmavnode
sudo git submodule update --init
popd

log "Download EZWFB - Base"
sudo git clone https://github.com/RespawnDespair/wifibroadcast-base.git
pushd wifibroadcast-base
sudo git submodule update --init
popd

log "Download EZWFB - OSD"
sudo git clone https://github.com/RespawnDespair/wifibroadcast-osd-orig.git wifibroadcast-osd
pushd wifibroadcast-osd
sudo git submodule update --init
popd

log "Download EZWFB - RC"
sudo git clone https://github.com/RespawnDespair/wifibroadcast-rc-orig.git wifibroadcast-rc

log "Download EZWFB - Status"
sudo git clone https://github.com/RespawnDespair/wifibroadcast-status.git

log "Download EZWFB - Scripts"
sudo git clone https://github.com/RespawnDespair/wifibroadcast-scripts.git

log "Download EZWFB - Misc"
sudo git clone https://github.com/RespawnDespair/wifibroadcast-misc.git

log "Download EZWFB - hello_video"
sudo git clone https://github.com/RespawnDespair/wifibroadcast-hello_video.git

log "Download EZWFB - Splash"
sudo git clone https://github.com/RespawnDespair/wifibroadcast-splash.git

log "Download FLIR one"
sudo git clone https://github.com/fnoop/flirone-v4l2.git

#return
popd
popd
