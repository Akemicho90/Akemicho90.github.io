'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "cf8149ab215fa4a5e84e9b1216061d98",
"assets/AssetManifest.json": "1321da95d6c715284f018835c36bb347",
"assets/assets/icons/airconditioner.png": "f480e4857a3081298deb9c5baf814362",
"assets/assets/icons/bottle-of-water.png": "e9c10fcf72ad654c80ae190497fb0b8e",
"assets/assets/icons/clouds.png": "4c6399e70be76e4272c36cc732bf2485",
"assets/assets/icons/doctorsbag.png": "a2f26a8f1fed2a40a05717d74f1d375e",
"assets/assets/icons/dry.png": "5087fd2fb078ddbeb38d64f5c42e7281",
"assets/assets/icons/humidity.png": "3804b12abf34c3f0f4ed54ab3c8f03e3",
"assets/assets/icons/no-rain.png": "3e0b2039248ab4f6ecb75ba3c4549be6",
"assets/assets/icons/rain.png": "ec7361a22a70f273740082aca7ffda40",
"assets/assets/icons/renewableenergy.png": "92a5da23cbc93c6a6b1fdbf92422d602",
"assets/assets/icons/search.png": "079d64d7ce0da3db304d42824c617907",
"assets/assets/icons/shirt.png": "c07a4ee6652fb48be838ce02a99aa3d4",
"assets/assets/icons/skin.png": "76da167ec52221f69d029a4c348b200a",
"assets/assets/icons/sparklingwater.png": "179bc158fa3a2a7dc1ddce85ece0ba50",
"assets/assets/icons/sunrise.png": "9881e4bd4d496ba40793a5ff0c5b107b",
"assets/assets/icons/sunset.png": "978d5fb125d00aa056dc18301801941e",
"assets/assets/icons/temperature-outside.png": "e0a87baa4cfb4ffb8d7456c51a4179ff",
"assets/assets/icons/thermometer.png": "82271702180e3bb522764da07baa72d3",
"assets/assets/icons/umbrella.png": "8965a74b35dc2fe867bcf9907dbca9f9",
"assets/assets/icons/weatherlogo.png": "5f5cf1037246ee1a3029d63a6d84671b",
"assets/assets/icons/windspeed.png": "55b6ee8c473952bde995a7f340f1a6c8",
"assets/assets/weather/01d.png": "6a7d9f787a87f83090010986f49b6de9",
"assets/assets/weather/01n.png": "54f5016d12c859a5dcadb0cc4142bd0b",
"assets/assets/weather/02d.png": "26ba54ea066a854140f7fd8c3a17a19b",
"assets/assets/weather/02n.png": "92ee5ac3260778fecaa2909d24392324",
"assets/assets/weather/03d.png": "f78f82de403ff4ebfbcc290ea1eb04b7",
"assets/assets/weather/03n.png": "f78f82de403ff4ebfbcc290ea1eb04b7",
"assets/assets/weather/04d.png": "b8bc18062b81dd5d8c53b908177e8e9a",
"assets/assets/weather/04n.png": "b8bc18062b81dd5d8c53b908177e8e9a",
"assets/assets/weather/09d.png": "7b84187f2a4f8e133e23716a5a4fad0e",
"assets/assets/weather/09n.png": "c3ccb495e81f36f0a0f1f14c71ff9657",
"assets/assets/weather/10d.png": "7b84187f2a4f8e133e23716a5a4fad0e",
"assets/assets/weather/10n.png": "c3ccb495e81f36f0a0f1f14c71ff9657",
"assets/assets/weather/11d.png": "62d423feaef03378270aa03d6c1aaf7f",
"assets/assets/weather/11n.png": "6b27dda3a5fa3b9d596b8cbb2c34c166",
"assets/assets/weather/13d.png": "3c527a68b4821e67fe01ae1ac7d00120",
"assets/assets/weather/13n.png": "3c527a68b4821e67fe01ae1ac7d00120",
"assets/assets/weather/50d.png": "e820e76eec5a9d47298de19b850328aa",
"assets/assets/weather/50n.png": "d97b7cf8b97863f74515627fc17282ba",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "30a548635ed5f335a350fc811011b7d0",
"assets/NOTICES": "6f3da82859aeb704614f5f0403e67fb5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "59d2eeedbc954489728ff4b833575f78",
"/": "59d2eeedbc954489728ff4b833575f78",
"main.dart.js": "6d35e7fa02f34bd189733a6cf6a8c678",
"manifest.json": "300d92ebcc8969676f3a0570f3c240e3",
"version.json": "8a43535f7f10cc5d3f1ae59c8bc75bc7"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
