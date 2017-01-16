%dw 1.0
%output application/json
---
payload map
{
	source: flowVars.payload_source,
	target: stringToAscii($) as :string,
	caption: flowVars.payload_caption,
	methodType: flowVars.payload_methodType
} 