import{u as P,f as L,h as k,j as Y}from"./vue-flow-core-436bf019.js";import{T as v}from"./TrashIcon-bc49cd17.js";import{_ as b}from"./_plugin-vue_export-helper-c27b6911.js";import{q,r as E,c as Q,f as l,z as d,u as i,a as g,g as x,F as C,o as B}from"./app-71688fef.js";const M=["fill"],N={inheritAttrs:!1},z=Object.assign(N,{__name:"customEdge",props:{id:{type:String,required:!0},sourceX:{type:Number,required:!0},sourceY:{type:Number,required:!0},targetX:{type:Number,required:!0},targetY:{type:Number,required:!0},sourcePosition:{type:String,required:!0},targetPosition:{type:String,required:!0},data:{type:Object,required:!1},markerEnd:{type:String,required:!1},style:{type:Object,required:!1}},setup(s){const t=s,{applyEdgeChanges:X}=P(),f=(e,r)=>{X([{type:"remove",id:r}]),e.stopPropagation()},m=e=>[`
  M ${e.sourceX-7.5} ${e.sourceY}
  L ${e.sourceX+15} ${e.sourceY}

  Q ${e.sourceX+30} ${e.sourceY}
  ${e.sourceX+30} ${e.sourceY+(e.sourceY>e.targetY?-15:15)}
  L ${e.sourceX+30} ${e.targetY-(e.sourceY>e.targetY?45:75)}
  Q ${e.sourceX+30} ${e.targetY-60}
   ${e.sourceX+15} ${e.targetY-60}
  L ${e.targetX-30} ${e.targetY-60}
  Q ${e.targetX-45} ${e.targetY-60}
   ${e.targetX-45} ${e.targetY-45}
  L ${e.targetX-45} ${e.targetY-15}
  Q ${e.targetX-45} ${e.targetY}
   ${e.targetX-30} ${e.targetY}
  L ${e.targetX} ${e.targetY}`,(e.sourceX+e.targetX)/2,e.targetY-60],_=e=>[`
  M ${e.sourceX} ${e.sourceY-7.5}
  L ${e.sourceX} ${e.sourceY+15}
  Q ${e.sourceX} ${e.sourceY+30}
   ${e.sourceX-15} ${e.sourceY+30}
  L ${e.targetX-15} ${e.sourceY+30}
  Q ${e.targetX-30} ${e.sourceY+30}
   ${e.targetX-30} ${e.sourceY+parseInt(e.sourceY<e.targetY-30?45:15)}
  L ${e.targetX-30} ${e.targetY+parseInt(e.sourceY<e.targetY-30?-15:15)}
  Q  ${e.targetX-30} ${e.targetY}
    ${e.targetX-15} ${e.targetY}
  L ${e.targetX} ${e.targetY}
`,e.targetX-15,e.targetY],h=e=>[`M ${e.sourceX}, ${e.sourceY}
     C ${e.targetX}, ${e.sourceY}
     ${e.targetX}, ${e.targetY}
    ${e.targetX}, ${e.targetY}`,e.sourceX-25,e.sourceY],$=(e,r=8)=>[`M${e.sourceX+r}, ${e.sourceY} C ${e.sourceX} ${e.targetY} ${e.sourceX} ${e.targetY} ${e.targetX}, ${e.targetY}`,(e.sourceX+e.targetX)/2,e.targetY],y=e=>[`M ${e.sourceX} ${e.sourceY} L ${e.targetX} ${e.targetY}`,(e.sourceX+e.targetX)/2,(e.sourceY+e.targetY)/2],a=e=>{e===!0?n.value="#8492a6":n.value="red"},o=q(()=>{const[e,r,u,c]=[t.sourceX<t.targetX&&t.sourceY>t.targetY,t.sourceX>t.targetX&&t.sourceY>t.targetY,t.sourceX>t.targetX&&t.sourceY<t.targetY,t.sourceX<t.targetX&&t.sourceY<t.targetY];if(t.sourcePosition==="left"){if(t.targetPosition==="left"){if(a(e||r||c),r)return h(t)}else{if(t.targetPosition==="right")return a(r||u),Y(t);t.targetPosition}return $(t)}else if(t.sourcePosition==="right"){if(t.targetPosition==="left"){if(/right-redirector/.test(t.id)&&(r||u))return m(t);a(e||c)}else t.targetPosition==="right"||t.targetPosition==="bottom"&&a(e);return Y(t)}else if(t.sourcePosition==="bottom"){if(t.targetPosition==="left"){if(u||r)return _(t);a(c)}else t.targetPosition==="right"?a(u):t.targetPosition==="bottom"&&a(u||c);return $(t,0)}else t.targetPosition==="left"||t.targetPosition==="right"||t.targetPosition;return y(t)});let n=E("#8492a6");return(e,r)=>(B(),Q(C,null,[l(i(L),{id:s.id,style:d({"stroke-width":4,stroke:i(n)}),path:o.value[0],"marker-end":"url(#triangle)",markerWidth:"4"},null,8,["id","style","path"]),g("defs",null,[g("marker",{id:"triangle",viewBox:"0 0 1 10",refX:"1",refY:"5",markerUnits:"strokeWidth",markerHeight:"8",markerWidth:"8",orient:"auto",fill:i(n)},[...r[1]||(r[1]=[g("path",{d:"M 0 1.5 L 4 5 L 0 8.5 z"},null,-1)])],8,M)]),l(i(k),null,{default:x(()=>[g("div",{style:d({pointerEvents:"all",position:"absolute",transform:`translate(-50%, -50%) translate(${o.value[1]}px,${o.value[2]}px)`,"z-index":9999}),class:"nodrag nopan"},[g("div",{class:"edge__button_delete",onClick:r[0]||(r[0]=u=>f(u,s.id))},[l(i(v))])],4)]),_:1})],64))}}),V=b(z,[["__scopeId","data-v-43069cd9"]]);export{V as default};
