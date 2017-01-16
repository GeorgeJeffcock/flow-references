%dw 1.0
%input payload application/xml
%output application/json skipNullOn = "everywhere"
%namespace ns0 http://www.mulesoft.org/schema/mule/core
%function toText(object) object as :string

---
{
///////////////////////////////////////////////////////////////////////	
nodes: ( flatten ({
nodesForFlow: payload.mule.*flow default [] map
		{
			id: stringToAscii($.@name)  as :string,
			type: "flow",
			caption: $.@name ++ ' [' ++ flowVars.configFileName ++ ']',
			cluster : flowVars.clusterNumber,
			root : false,
			color: flowVars.color
		},	
nodesForSubFlow: payload.mule.*sub-flow default [] map
		{
			id: stringToAscii($.@name) as :string,
			type: "sub-flow",
			caption: $.@name ++ ' [' ++ flowVars.configFileName ++ ']',
			cluster : flowVars.clusterNumber,
			root : false,
			color: flowVars.color
		},
nodesForBatch: payload.mule.*job default [] map
		{
			id: stringToAscii($.@name) as :string,
			type: "batch",
			caption: $.@name ++ ' [' ++ flowVars.configFileName ++ ']',
			cluster : flowVars.clusterNumber,
			root : false,
			color: flowVars.color
		},
nodesForException1: payload.mule.*choice-exception-strategy default [] map
		{
			id: stringToAscii($.@name) as :string,
			type: "choice-exception-strategy",
			caption: $.@name ++ ' [' ++ flowVars.configFileName ++ ']',
			cluster : flowVars.clusterNumber,
			root : false,
			color: flowVars.color
		},
nodesForException2: payload.mule.*rollback-exception-strategy default [] map
		{
			id: stringToAscii($.@name) as :string,
			type: "rollback-exception-strategy",
			caption: $.@name ++ ' [' ++ flowVars.configFileName ++ ']',
			cluster : flowVars.clusterNumber,
			root : false,
			color: flowVars.color
		},
nodesForException3: payload.mule.*catch-exception-strategy default [] map
		{
			id: stringToAscii($.@name) as :string,
			type: "catch-exception-strategy",
			caption: $.@name ++ ' [' ++ flowVars.configFileName ++ ']',
			cluster : flowVars.clusterNumber,
			root : false,
			color: flowVars.color
		},
nodesForException4: payload.mule.*mapping-exception-strategy default [] map
		{
			id: stringToAscii($.@name) as :string,
			type: "mapping-exception-strategy",
			caption: $.@name ++ ' [' ++ flowVars.configFileName ++ ']',
			cluster : flowVars.clusterNumber,
			root : false,
			color: flowVars.color
		}
		})),		
		
///////////////////////////////////////////////////////////////////////		
edgesList: ( flatten ({
///////////////////////////////////////////////////////////////////////


edgesFromFlows: payload.mule.*flow map ((currentElement, index) ->
{(
///////////////////////////////////////////////////////////////////////	
	currentElement.. pluck  {
///////////////////////////////////////////////////////////////////////
		edges: {methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@name) as :string,	caption : $$ }
		when (toText($$) == "flow-ref" and $.@name != null) otherwise
		lookup("f_processFoundDW_File", { source : stringToAscii(currentElement.@name) as :string,	target : $.set-payload.@resource, caption : toText($$), methodType : toText($$)})
	 	when (toText($$) == "transform-message" and  $.set-payload.@resource != null) otherwise
		lookup("f_processFoundDW_Inline", { source : stringToAscii(currentElement.@name) as :string, target : encode($.set-payload), caption : toText($$), methodType : toText($$)})
		when (toText($$) == "transform-message" and  $.set-payload != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "idempotent-message-filter" and $.@onUnaccepted != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "message-filter" and $.@onUnaccepted != null) otherwise
		lookup("f_processFoundComponent", { source : stringToAscii(currentElement.@name) as :string,	target : $.@class, caption : toText($$), methodType : toText($$)})
		when (toText($$) == "component" and  $.@class != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@name)  as :string,	caption : $$ }
		when (toText($$) == "execute" and $.@name != null) otherwise		
		null
///////////////////////////////////////////////////////////////////////	
})
///////////////////////////////////////////////////////////////////////		
}) unless payload.mule.*flow == null otherwise null,

	
	



// Get All Sub-Flows
edgesFromSubFlows: payload.mule.*sub-flow map ((currentElement, index) ->
{(
////////////////////////////////////////////////////////////////////
	currentElement.. pluck  {
////////////////////////////////////////////////////////////////////	
		edges: {methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@name) as :string,	caption : $$ }
		when (toText($$) == "flow-ref" and $.@name != null) otherwise
		lookup("f_processFoundDW_File", { source : stringToAscii(currentElement.@name) as :string,	target : $.set-payload.@resource, caption : toText($$), methodType : toText($$)})
	 	when (toText($$) == "transform-message" and  $.set-payload.@resource != null) otherwise
		lookup("f_processFoundDW_Inline", { source : stringToAscii(currentElement.@name) as :string, target : encode($.set-payload), caption : toText($$), methodType : toText($$)})
		when (toText($$) == "transform-message" and  $.set-payload != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "idempotent-message-filter" and $.@onUnaccepted != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "message-filter" and $.@onUnaccepted != null) otherwise
		lookup("f_processFoundComponent", { source : stringToAscii(currentElement.@name) as :string,	target : $.@class, caption : toText($$), methodType : toText($$)})
		when (toText($$) == "component" and  $.@class != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@name)  as :string,	caption : $$ }
		when (toText($$) == "execute" and $.@name != null) otherwise		
		null
////////////////////////////////////////////////////////////////////
})
////////////////////////////////////////////////////////////////////		
}) unless payload.mule.*sub-flow == null otherwise null,
	
	


edgesFromBatch: payload.mule.*job map ((currentElement, index) ->
{(
////////////////////////////////////////////////////////////////////	
	currentElement.. pluck  {
////////////////////////////////////////////////////////////////////
		edges: {methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@name) as :string,	caption : $$ }
		when (toText($$) == "flow-ref" and $.@name != null) otherwise
		lookup("f_processFoundDW_File", { source : stringToAscii(currentElement.@name) as :string,	target : $.set-payload.@resource, caption : toText($$), methodType : toText($$)})
	 	when (toText($$) == "transform-message" and  $.set-payload.@resource != null) otherwise
		lookup("f_processFoundDW_Inline", { source : stringToAscii(currentElement.@name) as :string, target : encode($.set-payload), caption : toText($$), methodType : toText($$)})
		when (toText($$) == "transform-message" and  $.set-payload != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "idempotent-message-filter" and $.@onUnaccepted != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "message-filter" and $.@onUnaccepted != null) otherwise
		lookup("f_processFoundComponent", { source : stringToAscii(currentElement.@name) as :string,	target : $.@class, caption : toText($$), methodType : toText($$)})
		when (toText($$) == "component" and  $.@class != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@name)  as :string,	caption : $$ }
		when (toText($$) == "execute" and $.@name != null) otherwise		
		null
///////////////////////////////////////////////////////////////////////
})
///////////////////////////////////////////////////////////////////////		
}) unless payload.mule.*job == null otherwise null,



edgesFromException1: payload.mule.*choice-exception-strategy map ((currentElement, index) ->
{(
////////////////////////////////////////////////////////////////////	
	currentElement.. pluck  {
////////////////////////////////////////////////////////////////////
		edges: {methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@name) as :string,	caption : $$ }
		when (toText($$) == "flow-ref" and $.@name != null) otherwise
		lookup("f_processFoundDW_File", { source : stringToAscii(currentElement.@name) as :string,	target : $.set-payload.@resource, caption : toText($$), methodType : toText($$)})
	 	when (toText($$) == "transform-message" and  $.set-payload.@resource != null) otherwise
		lookup("f_processFoundDW_Inline", { source : stringToAscii(currentElement.@name) as :string, target : encode($.set-payload), caption : toText($$), methodType : toText($$)})
		when (toText($$) == "transform-message" and  $.set-payload != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "idempotent-message-filter" and $.@onUnaccepted != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "message-filter" and $.@onUnaccepted != null) otherwise
		lookup("f_processFoundComponent", { source : stringToAscii(currentElement.@name) as :string,	target : $.@class, caption : toText($$), methodType : toText($$)})
		when (toText($$) == "component" and  $.@class != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@name)  as :string,	caption : $$ }
		when (toText($$) == "execute" and $.@name != null) otherwise		
		null
///////////////////////////////////////////////////////////////////////
})
///////////////////////////////////////////////////////////////////////		
}) unless payload.mule.*choice-exception-strategy == null otherwise null,




edgesFromException2: payload.mule.*rollback-exception-strategy map ((currentElement, index) ->
{(
////////////////////////////////////////////////////////////////////	
	currentElement.. pluck  {
////////////////////////////////////////////////////////////////////
		edges: {methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@name) as :string,	caption : $$ }
		when (toText($$) == "flow-ref" and $.@name != null) otherwise
		lookup("f_processFoundDW_File", { source : stringToAscii(currentElement.@name) as :string,	target : $.set-payload.@resource, caption : toText($$), methodType : toText($$)})
	 	when (toText($$) == "transform-message" and  $.set-payload.@resource != null) otherwise
		lookup("f_processFoundDW_Inline", { source : stringToAscii(currentElement.@name) as :string, target : encode($.set-payload), caption : toText($$), methodType : toText($$)})
		when (toText($$) == "transform-message" and  $.set-payload != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "idempotent-message-filter" and $.@onUnaccepted != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "message-filter" and $.@onUnaccepted != null) otherwise
		lookup("f_processFoundComponent", { source : stringToAscii(currentElement.@name) as :string,	target : $.@class, caption : toText($$), methodType : toText($$)})
		when (toText($$) == "component" and  $.@class != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@name)  as :string,	caption : $$ }
		when (toText($$) == "execute" and $.@name != null) otherwise		
		null
///////////////////////////////////////////////////////////////////////
})
///////////////////////////////////////////////////////////////////////		
}) unless payload.mule.*rollback-exception-strategy == null otherwise null,





edgesFromException3: payload.mule.*catch-exception-strategy map ((currentElement, index) ->
{(
////////////////////////////////////////////////////////////////////	
	currentElement.. pluck  {
////////////////////////////////////////////////////////////////////
		edges: {methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@name) as :string,	caption : $$ }
		when (toText($$) == "flow-ref" and $.@name != null) otherwise
		lookup("f_processFoundDW_File", { source : stringToAscii(currentElement.@name) as :string,	target : $.set-payload.@resource, caption : toText($$), methodType : toText($$)})
	 	when (toText($$) == "transform-message" and  $.set-payload.@resource != null) otherwise
		lookup("f_processFoundDW_Inline", { source : stringToAscii(currentElement.@name) as :string, target : encode($.set-payload), caption : toText($$), methodType : toText($$)})
		when (toText($$) == "transform-message" and  $.set-payload != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "idempotent-message-filter" and $.@onUnaccepted != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "message-filter" and $.@onUnaccepted != null) otherwise
		lookup("f_processFoundComponent", { source : stringToAscii(currentElement.@name) as :string,	target : $.@class, caption : toText($$), methodType : toText($$)})
		when (toText($$) == "component" and  $.@class != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@name)  as :string,	caption : $$ }
		when (toText($$) == "execute" and $.@name != null) otherwise		
		null
///////////////////////////////////////////////////////////////////////
})
///////////////////////////////////////////////////////////////////////		
}) unless payload.mule.*catch-exception-strategy == null otherwise null,


edgesFromException4: payload.mule.*mapping-exception-strategy map ((currentElement, index) ->
{(
////////////////////////////////////////////////////////////////////	
	currentElement.. pluck  {
////////////////////////////////////////////////////////////////////
		edges: {methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@name) as :string,	caption : $$ }
		when (toText($$) == "flow-ref" and $.@name != null) otherwise
		lookup("f_processFoundDW_File", { source : stringToAscii(currentElement.@name) as :string,	target : $.set-payload.@resource, caption : toText($$), methodType : toText($$)})
	 	when (toText($$) == "transform-message" and  $.set-payload.@resource != null) otherwise
		lookup("f_processFoundDW_Inline", { source : stringToAscii(currentElement.@name) as :string, target : encode($.set-payload), caption : toText($$), methodType : toText($$)})
		when (toText($$) == "transform-message" and  $.set-payload != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name) as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "idempotent-message-filter" and $.@onUnaccepted != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@onUnaccepted)  as :string,	caption : $$ }
		when (toText($$) == "message-filter" and $.@onUnaccepted != null) otherwise
		lookup("f_processFoundComponent", { source : stringToAscii(currentElement.@name) as :string,	target : $.@class, caption : toText($$), methodType : toText($$)})
		when (toText($$) == "component" and  $.@class != null) otherwise
		{methodType : $$,	source : stringToAscii(currentElement.@name)  as :string,	target : stringToAscii($.@name)  as :string,	caption : $$ }
		when (toText($$) == "execute" and $.@name != null) otherwise		
		null
///////////////////////////////////////////////////////////////////////
})
///////////////////////////////////////////////////////////////////////		
}) unless payload.mule.*mapping-exception-strategy == null otherwise null




	
	
	
///////////////////////////////////////////////////////////////////////		
}))
///////////////////////////////////////////////////////////////////////	
}