import Echo from 'laravel-echo';
import Pusher from 'pusher-js';

let echoInstance = null;

export function getEchoInstance(pusherKey, pusherCluster) {
    if (!echoInstance) {
        // window.Pusher = Pusher;
        // echoInstance = new Echo({
        //     broadcaster: 'pusher',
        //     key: pusherKey,
        //     cluster: pusherCluster,
        //     encrypted: true,
        // });

       window.Pusher = Pusher;
       echoInstance = new Echo({
            broadcaster: 'reverb',
            key: import.meta.env.VITE_REVERB_APP_KEY,
            wsHost: import.meta.env.VITE_REVERB_HOST,
            wsPort: import.meta.env.VITE_REVERB_PORT ?? 8080,
            wssPort: import.meta.env.VITE_REVERB_PORT ?? 8080,
            forceTLS: false,
            disableStats: true,
            enabledTransports: ['ws', 'wss'],
        });

        if (!echoInstance) {
            console.error('Echo not initialized');
            return;
        }

    }
    return echoInstance;
}