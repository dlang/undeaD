static import std.string;

void main()
{
    import undead.regexp : RegExp, sub;
    import std.stdio : writeln;

    string foo(RegExp r) { return "ss"; }

    auto r = sub("hello", "ll", delegate string(RegExp r) { return "ss"; });
    assert(r == "hesso");

    r = sub("hello", "l", delegate string(RegExp r) { return "l"; }, "g");
    assert(r == "hello");

    auto s = sub("Strap a rocket engine on a chicken.",
            "[ar]",
            delegate string (RegExp m)
            {
                return std.string.toUpper(m[0]);
            },
            "g");
    assert(s == "StRAp A Rocket engine on A chicken.");
    s.writeln;
}
