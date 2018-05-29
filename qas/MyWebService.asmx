[WebMethod]
public string SayHello(string firstName, string lastName)
{
    return "Hello " + firstName + " " + lastName;
}

[WebMethod]
public string SayHelloJson(string firstName, string lastName)
{
    var data = new { Greeting = "Hello", Name = firstName + " " + lastName };

    // We are using an anonymous object above, but we could use a typed one too (SayHello class is defined below)
    // SayHello data = new SayHello { Greeting = "Hello", Name = firstName + " " + lastName };

    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();

    return js.Serialize(data);
}

[WebMethod]
public SayHello SayHelloObject(string firstName, string lastName)
{
    SayHello o = new SayHello();
    o.Greeting = "Hello";
    o.Name = firstName + " " + lastName;

    return o;
}