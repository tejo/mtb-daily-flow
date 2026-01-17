const CACHE_NAME = 'mtb-flow-6';
const ASSETS_TO_CACHE = [
  './',
  './index.html',
  './manifest.json',
  './icon-192.svg',
  './icon-512.svg'
];

// Install event: Cache assets
self.addEventListener('install', (event) => {
  self.skipWaiting(); // Force waiting service worker to become active
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => {
        return cache.addAll(ASSETS_TO_CACHE);
      })
  );
});

// Activate event: Clean up old caches
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keyList) => {
      return Promise.all(keyList.map((key) => {
        if (key !== CACHE_NAME) {
          return caches.delete(key);
        }
      }));
    }).then(() => self.clients.claim()) // Claim clients immediately
  );
});

// Fetch event: Serve from cache, fall back to network, and cache runtime requests (like thumbnails)
self.addEventListener('fetch', (event) => {
  const requestUrl = new URL(event.request.url);

  // Cache YouTube thumbnails dynamically
  if (requestUrl.hostname === 'i.ytimg.com') {
    event.respondWith(
      caches.open('mtb-thumbnails').then((cache) => {
        return cache.match(event.request).then((response) => {
          return response || fetch(event.request).then((networkResponse) => {
            cache.put(event.request, networkResponse.clone());
            return networkResponse;
          });
        });
      })
    );
    return;
  }

  // Default cache-first strategy for app assets
  event.respondWith(
    caches.match(event.request)
      .then((response) => {
        return response || fetch(event.request);
      })
  );
});
