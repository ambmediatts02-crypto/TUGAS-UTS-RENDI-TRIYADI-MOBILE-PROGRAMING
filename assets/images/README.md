Place the five mount images here with these filenames:
- semeru.jpg
- merbabu.jpg
- maunaloa.jpg
- vesuvius.jpg
- popocatepetl.jpg

Use the PowerShell script below to download them automatically (run from project root):

```powershell
mkdir -p assets/images
Invoke-WebRequest -Uri "https://sa.kapamilya.com/absnews/abscbnnews/media/2021/afp/01/17/20210116-mt-semeru-indonesia-ash-afp-s.jpg" -OutFile "assets/images/semeru.jpg"
Invoke-WebRequest -Uri "https://media-cdn.tripadvisor.com/media/photo-s/04/a5/6f/ce/dsc-5622jpg.jpg" -OutFile "assets/images/merbabu.jpg"
Invoke-WebRequest -Uri "https://cdn.dlmag.com/wp-content/uploads/2019/07/maunaloa1.jpg" -OutFile "assets/images/maunaloa.jpg"
Invoke-WebRequest -Uri "https://cdn.images.express.co.uk/img/dynamic/78/590x/mount-vesuvius-1100807.jpg" -OutFile "assets/images/vesuvius.jpg"
Invoke-WebRequest -Uri "https://upload.wikimedia.org/wikipedia/commons/0/04/PopoAmeca2zoom.jpg" -OutFile "assets/images/popocatepetl.jpg"
```

If `Invoke-WebRequest` fails due to TLS/CORS or remote server blocking, consider manually downloading the images via browser and saving them with the above filenames into `assets/images`.
