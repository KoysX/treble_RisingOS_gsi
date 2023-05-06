# treble_RisingOS_gsi

### To get started with building RisingOS GSI,
you'll need to get familiar with [Git and Repo](https://source.android.com/source/using-repo.html) as well as [How to build a GSI](https://github.com/phhusson/treble_experimentations/wiki/How-to-build-a-GSI%3F).v


### Create the directories

As a first step, you'll have to create and enter a folder with the appropriate name.
To do that, run these commands:

```bash
   mkdir rising
   cd rising
```

### To initialize your local repository, run this command:

```bash
   repo init -u https://github.com/RisingTechOSS/android -b thirteen
```
### Want to save some space ? Then use this:

```bash
   repo init --depth=1 --no-repo-verify -u https://github.com/RisingTechOSS/android -b thirteen -g default,-mips,-darwin,-notdefault
```

### Clone this repo:

```bash
   git clone https://github.com/Kuaipz/treble_RisingOS_gsi.git -b 13
```

### Preparing local manifest:

```bash
   mkdir -p .repo/local_manifests
   cp treble_RisingOS_gsi/manifest.xml .repo/local_manifests/ring.xml
```

### Afterwards, sync the source by running this command:

```bash
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)
```

### After syncing, apply the patches:

Copy the patches folder to rom folder and in rom folder

```
   bash patches/apply-patches.sh .
```

## Generating Rom Makefile

 In rom folder,
 
 ```
    cd device/phh/treble
    bash generate.sh lineage
 ```

### Turn on caching to speed up build

You can speed up subsequent builds by adding these lines to your ~/.bashrc OR ~/.zshrc file:

```
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export CCACHE_MAXSIZE=50G # 50 GB
```

## Compilation 

In rom folder,

 ```
 . build/envsetup.sh
 ccache -M 50G -F 0
 lunch treble_arm64_bvN-userdebug 
 make systemimage -j$(nproc --all)
 ```

## Compress

After compilation,
If you want to compress the build.
In rom folder,

   ```
        cd out/target/product/tdgsi_arm64_ab
        xz -z -k system.img 
   ```


## Troubleshoot
 
If you face any conflicts while applying patches, apply the patch manually.



## Notes
- If bluetooth calls or bluetooth media do not work well for you, make sure you have the "Use System Wide BT HAL" checkbox enabled on the Misc page of Treble App. If not, enable and reboot.
- If you have a non-Samsung device with a Qualcomm chipset and VoLTE isn't working with the default IMS package provided by Treble App, try installing this [alternative IMS package](https://treble.phh.me/stable/ims-caf-s.apk).



## Credits
These people have helped this project in some way or another, so they should be the ones who receive all the credit:
- [RisingTechOSS](https://github.com/RisingTechOSS)
- [Phhusson](https://github.com/phhusson)
- [Naz664](https://github.com/naz664)
- [AndyYan](https://github.com/AndyCGYan)
- [Ponces](https://github.com/ponces)
- [ChonDoit](https://github.com/ChonDoit)
