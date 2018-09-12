import vibe.vibe;
import webchat;

void main()
{
	auto router = new URLRouter;
	// registers each method of WebChat in the router
	router.registerWebInterface(new WebChat);
	// match incoming requests to files in the public/ folder
	router.get("*", serveStaticFiles("public/"));

	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	listenHTTP(settings, router);

	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
	logInfo("Please create room like so http://127.0.0.1:8080/room?id=sexy&name=louie in your browser.");
	logInfo("To Suscribe to a room open another tab in the browser and open like so http://127.0.0.1:8080/room?id=sexy&name=herman in your browser.");
	logInfo("Now everytime you press enter on the chat, it will be broadcasted to all connected browsers");
	logInfo("Webserver created by Louie Foronda");
	runApplication();
}

void hello(HTTPServerRequest req, HTTPServerResponse res)
{
	res.writeBody("Hello, World!");
}
