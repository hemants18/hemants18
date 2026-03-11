import { ref } from "vue";
import { getEchoInstance } from "@/echo";

export const onlineAgents = ref([]);

export function initAgentPresence(companyId) {

    const echo = getEchoInstance();
    const channel = `online-agents.${companyId}`;

    // leave old channel first
    echo.leave(channel);

    echo.join(channel)

        .here((agents) => {
            onlineAgents.value = agents.map(agent => agent.id);
            // console.log("Online agents:", onlineAgents.value);
        })

        .joining((agent) => {

            if (!onlineAgents.value.includes(agent.id)) {
                onlineAgents.value.push(agent.id);
            }

            // console.log("Agent joined:", agent.id);
        })

        .leaving((agent) => {

            onlineAgents.value = onlineAgents.value.filter(
                id => id !== agent.id
            );

            // console.log("Agent left:", agent.id);
        });
}

export function leaveAgentPresence(companyId) {
    const echo = getEchoInstance();
    const channel = `online-agents.${companyId}`;

    if (echo) {
        echo.leave(channel);
        // console.log("Left channel:", channel);
    }
}