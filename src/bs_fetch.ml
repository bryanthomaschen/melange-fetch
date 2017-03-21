type ('a,'e) promise = ('a,'e) Js.promise

type body
type bodyInit
type headers
type headersInit
type response
type request
type requestInit
type arrayBuffer
type blob
type bufferSource
type formData
type readableStream
type urlSearchParams
type requestMethod =
  | Get
  | Head
  | Post
  | Put
  | Delete
  | Connect
  | Options
  | Trace
  | Patch
  | Other of string
let encodeRequestMethod =
  function
  | Get  -> "GET"
  | Head  -> "HEAD"
  | Post  -> "POST"
  | Put  -> "PUT"
  | Delete  -> "DELETE"
  | Connect  -> "CONNECT"
  | Options  -> "OPTIONS"
  | Trace  -> "TRACE"
  | Patch  -> "PATCH"
  | ((Other (method_))[@explicit_arity ]) -> method_
let decodeRequestMethod =
  function
  | "GET" -> Get
  | "HEAD" -> Head
  | "POST" -> Post
  | "PUT" -> Put
  | "DELETE" -> Delete
  | "CONNECT" -> Connect
  | "OPTIONS" -> Options
  | "TRACE" -> Trace
  | "PATCH" -> Patch
  | method_ -> ((Other (method_))[@explicit_arity ])
type referrerPolicy =
  | None
  | NoReferrer
  | NoReferrerWhenDowngrade
  | SameOrigin
  | Origin
  | StrictOrigin
  | OriginWhenCrossOrigin
  | StrictOriginWhenCrossOrigin
  | UnsafeUrl
let encodeReferrerPolicy =
  function
  | None  -> ""
  | NoReferrer  -> "no-referrer"
  | NoReferrerWhenDowngrade  -> "no-referrer-when-downgrade"
  | SameOrigin  -> "same-origin"
  | Origin  -> "origin"
  | StrictOrigin  -> "strict-origin"
  | OriginWhenCrossOrigin  -> "origin-when-cross-origin"
  | StrictOriginWhenCrossOrigin  -> "strict-origin-when-cross-origin"
  | UnsafeUrl  -> "unsafe-url"
let decodeReferrerPolicy =
  function
  | "" -> None
  | "no-referrer" -> NoReferrer
  | "no-referrer-when-downgrade" -> NoReferrerWhenDowngrade
  | "same-origin" -> SameOrigin
  | "origin" -> Origin
  | "strict-origin" -> StrictOrigin
  | "origin-when-cross-origin" -> OriginWhenCrossOrigin
  | "strict-origin-when-cross-origin" -> StrictOriginWhenCrossOrigin
  | "unsafe-url" -> UnsafeUrl
  | e ->
      raise ((Failure (("Unknown referrerPolicy: " ^ e)))[@explicit_arity ])
type requestType =
  | None
  | Audio
  | Font
  | Image
  | Script
  | Style
  | Track
  | Video
let decodeRequestType =
  function
  | "" -> None
  | "audio" -> Audio
  | "font" -> Font
  | "image" -> Image
  | "script" -> Script
  | "style" -> Style
  | "track" -> Track
  | "video" -> Video
  | e -> raise ((Failure (("Unknown requestType: " ^ e)))[@explicit_arity ])
type requestDestination =
  | None
  | Document
  | Embed
  | Font
  | Image
  | Manifest
  | Media
  | Object
  | Report
  | Script
  | ServiceWorker
  | SharedWorker
  | Style
  | Worker
  | Xslt
let decodeRequestDestination =
  function
  | "" -> None
  | "document" -> Document
  | "embed" -> Embed
  | "font" -> Font
  | "image" -> Image
  | "manifest" -> Manifest
  | "media" -> Media
  | "object" -> Object
  | "report" -> Report
  | "script" -> Script
  | "serviceworker" -> ServiceWorker
  | "sharedworder" -> SharedWorker
  | "style" -> Style
  | "worker" -> Worker
  | "xslt" -> Xslt
  | e ->
      raise
        ((Failure (("Unknown requestDestination: " ^ e)))[@explicit_arity ])
type requestMode =
  | Navigate
  | SameOrigin
  | NoCORS
  | CORS
let encodeRequestMode =
  function
  | Navigate  -> "navigate"
  | SameOrigin  -> "same-origin"
  | NoCORS  -> "no-cors"
  | CORS  -> "cors"
let decodeRequestMode =
  function
  | "navigate" -> Navigate
  | "same-origin" -> SameOrigin
  | "no-cors" -> NoCORS
  | "cors" -> CORS
  | e -> raise ((Failure (("Unknown requestMode: " ^ e)))[@explicit_arity ])
type requestCredentials =
  | Omit
  | SameOrigin
  | Include
let encodeRequestCredentials =
  function
  | Omit  -> "omit"
  | SameOrigin  -> "same-origin"
  | Include  -> "include"
let decodeRequestCredentials =
  function
  | "omit" -> Omit
  | "same-origin" -> SameOrigin
  | "imclude" -> Include
  | e ->
      raise
        ((Failure (("Unknown requestCredentials: " ^ e)))[@explicit_arity ])
type requestCache =
  | Default
  | NoStore
  | Reload
  | NoCache
  | ForceCache
  | OnlyIfCached
let encodeRequestCache =
  function
  | Default  -> "default"
  | NoStore  -> "no-store"
  | Reload  -> "reload"
  | NoCache  -> "no-cache"
  | ForceCache  -> "force-cache"
  | OnlyIfCached  -> "only-if-cached"
let decodeRequestCache =
  function
  | "default" -> Default
  | "no-store" -> NoStore
  | "reload" -> Reload
  | "no-cache" -> NoCache
  | "force-cache" -> ForceCache
  | "only-if-cached" -> OnlyIfCached
  | e -> raise ((Failure (("Unknown requestCache: " ^ e)))[@explicit_arity ])
type requestRedirect =
  | Follow
  | Error
  | Manual
let encodeRequestRedirect =
  function | Follow  -> "follow" | Error  -> "error" | Manual  -> "manual"
let decodeRequestRedirect =
  function
  | "follow" -> Follow
  | "error" -> Error
  | "manual" -> Manual
  | e ->
      raise ((Failure (("Unknown requestRedirect: " ^ e)))[@explicit_arity ])
module type Type  = sig type t end
module HeadersInit =
  struct
    type t = headersInit
    external make : < .. > Js.t -> t = "%identity"
    external makeWithArray : (string* string) array -> t = "%identity"
  end
module Headers =
  struct
    type t = headers
    external make : t = "Headers"[@@bs.new ]
    external makeWithInit : headersInit -> t = "Headers"[@@bs.new ]
    external append : string -> string = ""[@@bs.send.pipe :t]
    external delete : string = ""[@@bs.send.pipe :t]
    external get : string -> string option = ""[@@bs.send.pipe :t][@@bs.return
                                                                    {
                                                                    null_to_opt
                                                                    }]
    external has : string -> bool = ""[@@bs.send.pipe :t]
    external set : string -> string -> unit = ""[@@bs.send.pipe :t]
  end
module BodyInit =
  struct
    type t = bodyInit
    external make : string -> t = "%identity"
    external makeWithBlob : blob -> t = "%identity"
    external makeWithBufferSource : bufferSource -> t = "%identity"
    external makeWithFormData : formData -> t = "%identity"
    external makeWithUrlSearchParams : urlSearchParams -> t = "%identity"
  end
module Body =
  struct
    module Impl(T:sig type t end) =
      struct
        external body : T.t -> readableStream = ""[@@bs.get ]
        external bodyUsed : T.t -> bool = ""[@@bs.get ]
        external arrayBuffer : (arrayBuffer,unit) promise = ""[@@bs.send.pipe
                                                                :T.t]
        external blob : (blob,unit) promise = ""[@@bs.send.pipe :T.t]
        external formData : (formData,unit) promise = ""[@@bs.send.pipe :T.t]
        external json : (< .. > Js.t,unit) promise = ""[@@bs.send.pipe :T.t]
        external text : (string,unit) promise = ""[@@bs.send.pipe :T.t]
      end
    include Impl(struct type t = body end)
  end
module RequestInit =
  struct
    type t = requestInit
    let map f =
      function | ((Some (v))[@explicit_arity ]) -> Some (f v) | None  -> None
    external make :
      ?method_:string ->
        ?headers:headersInit ->
          ?body:bodyInit ->
            ?referrer:string ->
              ?referrerPolicy:string ->
                ?mode:string ->
                  ?credentials:string ->
                    ?cache:string ->
                      ?redirect:string ->
                        ?integrity:string ->
                          ?keepalive:Js.boolean -> unit -> requestInit = ""
    [@@bs.obj ]
    let make ?method_:(method_ : requestMethod option) 
      ?headers:(headers : headersInit option)  ?body:(body : bodyInit option)
       ?referrer:(referrer : string option) 
      ?referrerPolicy:((referrerPolicy : referrerPolicy)= None) 
      ?mode:(mode : requestMode option) 
      ?credentials:(credentials : requestCredentials option) 
      ?cache:(cache : requestCache option) 
      ?redirect:(redirect : requestRedirect option) 
      ?integrity:((integrity : string)= "") 
      ?keepalive:(keepalive : bool option)  =
      make ?method_:(map encodeRequestMethod method_) ?headers ?body
        ?referrer ~referrerPolicy:(encodeReferrerPolicy referrerPolicy)
        ?mode:(map encodeRequestMode mode)
        ?credentials:(map encodeRequestCredentials credentials)
        ?cache:(map encodeRequestCache cache)
        ?redirect:(map encodeRequestRedirect redirect) ~integrity
        ?keepalive:(map Js.Boolean.to_js_boolean keepalive)
  end
module Request =
  struct
    type t = request
    external make : string -> t = "Request"[@@bs.new ]
    external makeWithInit : string -> requestInit -> t = "Request"[@@bs.new ]
    external makeWithRequest : t -> t = "Request"[@@bs.new ]
    external makeWithRequestInit : t -> requestInit -> t = "Request"[@@bs.new
                                                                    ]
    external method_ : t -> string = "method"[@@bs.get ]
    let method_: t -> requestMethod =
      fun self  -> decodeRequestMethod (method_ self)
    external url : t -> string = ""[@@bs.get ]
    external headers : t -> headers = ""[@@bs.get ]
    external type_ : t -> string = "type"[@@bs.get ]
    let type_: t -> requestType = fun self  -> decodeRequestType (type_ self)
    external destination : t -> string = ""[@@bs.get ]
    let destination: t -> requestDestination =
      fun self  -> decodeRequestDestination (destination self)
    external referrer : t -> string = ""[@@bs.get ]
    external referrerPolicy : t -> string = ""[@@bs.get ]
    let referrerPolicy: t -> referrerPolicy =
      fun self  -> decodeReferrerPolicy (referrerPolicy self)
    external mode : t -> string = ""[@@bs.get ]
    let mode: t -> requestMode = fun self  -> decodeRequestMode (mode self)
    external credentials : t -> string = ""[@@bs.get ]
    let credentials: t -> requestCredentials =
      fun self  -> decodeRequestCredentials (credentials self)
    external cache : t -> string = ""[@@bs.get ]
    let cache: t -> requestCache =
      fun self  -> decodeRequestCache (cache self)
    external redirect : t -> string = ""[@@bs.get ]
    let redirect: t -> requestRedirect =
      fun self  -> decodeRequestRedirect (redirect self)
    external integrity : t -> string = ""[@@bs.get ]
    external keepalive : t -> bool = ""[@@bs.get ]
    include Body.Impl(struct type t = body end)
  end
module Response =
  struct
    type t = response
    external error : unit -> t = ""[@@bs.val ]
    external redirect : string -> t = ""[@@bs.val ]
    external redirectWithStatus : string -> int -> t = "redirect"[@@bs.val ]
    external headers : t -> headers = ""[@@bs.get ]
    external ok : t -> bool = ""[@@bs.get ]
    external redirected : t -> bool = ""[@@bs.get ]
    external status : t -> int = ""[@@bs.get ]
    external statusText : t -> string = ""[@@bs.get ]
    external type_ : t -> string = "type"[@@bs.get ]
    external url : t -> string = ""[@@bs.get ]
    external clone : t = ""[@@bs.send.pipe :t]
    include Body.Impl(struct type t = response end)
  end
external fetch : string -> (response,unit) promise = ""[@@bs.val ]
external fetchWithInit :
  string -> requestInit -> (response,unit) promise = "fetch"[@@bs.val ]
external fetchWithRequest : request -> (response,unit) promise = "fetch"
[@@bs.val ]
external fetchWithRequestInit :
  request -> requestInit -> (response,unit) promise = "fetch"[@@bs.val ]