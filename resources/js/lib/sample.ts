export const WhatsAppFlowSample = {
  nodes: [
    {
      id: '1',
      type: 'start',
      label: 'Start',
      position: { x: 100, y: 50 },
      data: { title: 'Start Node' },
      events: {},
    },
    {
      id: '2',
      type: 'keyword',
      label: 'Keyword',
      position: { x: 100, y: 200 },
      data: {
        title: 'Keyword Node',
        keywords: ['hi', 'hello', 'help'], // Match user messages
      },
      events: {},
    },
    {
      id: '3',
      type: 'sendMessage',
      label: 'Send Message',
      position: { x: 350, y: 200 },
      data: {
        title: 'Send Message',
        text: 'Hello! How can I help you today?',
        media: null, // optional image/video link
      },
      events: {},
    },
    {
      id: '4',
      type: 'buttonReply',
      label: 'Button Reply',
      position: { x: 600, y: 200 },
      data: {
        title: 'Button Reply',
        buttons: [
          { id: 'b1', title: 'Check Balance' },
          { id: 'b2', title: 'Contact Support' },
        ],
      },
      events: {},
    },
    {
      id: '5',
      type: 'listReply',
      label: 'List Reply',
      position: { x: 850, y: 200 },
      data: {
        title: 'List Reply',
        list: [
          { id: 'l1', title: 'Option 1' },
          { id: 'l2', title: 'Option 2' },
        ],
      },
      events: {},
    },
    {
      id: '6',
      type: 'delay',
      label: 'Delay',
      position: { x: 350, y: 350 },
      data: {
        title: 'Delay Node',
        duration: 3000, // 3 seconds
      },
      events: {},
    },
    {
      id: '7',
      type: 'condition',
      label: 'Condition',
      position: { x: 600, y: 350 },
      data: {
        title: 'Condition Node',
        condition: 'userInput === "check_balance"', // Example condition
      },
      events: {},
    },
    {
      id: '8',
      type: 'assignAgent',
      label: 'Assign Agent',
      position: { x: 850, y: 350 },
      data: {
        title: 'Assign Agent Node',
        agentId: 'agent_123',
      },
      events: {},
    },
    {
      id: '9',
      type: 'webhook',
      label: 'Webhook',
      position: { x: 1100, y: 350 },
      data: {
        title: 'Webhook Node',
        url: 'https://your-api.com/webhook',
        method: 'POST',
        body: { user: '{{userId}}', action: '{{action}}' },
      },
      events: {},
    },
  ],
  edges: [
    { id: 'e1', source: '1', target: '2', type: 'default' },
    { id: 'e2', source: '2', target: '3', type: 'default' },
    { id: 'e3', source: '3', target: '4', type: 'default' },
    { id: 'e4', source: '4', target: '5', type: 'default' },
    { id: 'e5', source: '3', target: '6', type: 'default' },
    { id: 'e6', source: '6', target: '7', type: 'default' },
    { id: 'e7', source: '7', target: '8', type: 'default' },
    { id: 'e8', source: '8', target: '9', type: 'default' },
  ],
  position: [0, 0],
  zoom: 1,
  viewport: { x: 0, y: 0, zoom: 1 },
};

export default WhatsAppFlowSample;
