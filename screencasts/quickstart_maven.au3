#include <Constants.au3>


Send("{LWIN}bash")
Sleep(1000)
Send("{ENTER}")
Send("{F9}")
Sleep(500)

WinWaitActive("[CLASS:ConsoleWindowClass]")
Send("{LWINDOWN}{UP}{LWINUP}")
;Send("{LWINDOWN}{SHIFTDOWN}{RIGHT}{SHIFTUP}{UP}{LWINUP}")

Sleep(1500)

AutoItSetOption("SendKeyDelay", 50)
Send("mkdir quickstart_maven{ENTER}")
Send("cd quickstart_maven{ENTER}")
Send("ls{ENTER}")
Sleep(1000)
Send("vi pom.xml{ENTER}")
Send("{LWINDOWN}{UP}{LWINUP}")
Sleep(1000)
Send("i")
Send("<project xmlns=""http://maven.apache.org/POM/4.0.0""{ENTER}")
Send("         xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance""{ENTER}")
AutoItSetOption("SendKeyDelay", 20)
Send("         xsi:schemaLocation=""http://maven.apache.org/POM/4.0.0{ENTER}")
Send("                    http://maven.apache.org/xsd/maven-4.0.0.xsd"">{ENTER}")
AutoItSetOption("SendKeyDelay", 10)
Send("    <modelVersion>4.0.0</modelVersion>{ENTER}")
Send("    <groupId>docs-as-co.de</groupId>{ENTER}")
Send("    <artifactId>asciidocTest</artifactId>{ENTER}")
Send("    <version>0.1</version>{ENTER}")
Send("    <build>{ENTER}")
Send("        <defaultGoal>generate-resources</defaultGoal>{ENTER}")
Send("        <plugins>{ENTER}")
Send("            <plugin>{ENTER}")
Send("                <groupId>org.asciidoctor</groupId>{ENTER}")
Send("                <artifactId>asciidoctor-maven-plugin</artifactId>{ENTER}")
Send("                <version>1.5.6</version>{ENTER}")
Send("                <configuration>{ENTER}")
Send("                    <backend>html5</backend>{ENTER}")
Send("                </configuration>{ENTER}")
Send("                <executions>{ENTER}")
Send("                    <execution>{ENTER}")
Send("                        <id>output-html</id>{ENTER}")
Send("                        <phase>generate-resources</phase>{ENTER}")
Send("                        <goals>{ENTER}")
Send("                            <goal>process-asciidoc</goal>{ENTER}")
Send("                        </goals>{ENTER}")
Send("                    </execution>{ENTER}")
Send("                </executions>{ENTER}")
Send("            </plugin>{ENTER}")
Send("        </plugins>{ENTER}")
Send("    </build>{ENTER}")
Send("</project>{ENTER}")
Sleep(1000)
AutoItSetOption("SendKeyDelay", 50)
Send("{ESC}:wq{ENTER}")
Sleep(500)

Send("mkdir -p src/main/asciidoc{ENTER}")

Send("vi src/main/asciidoc/test.adoc{ENTER}")
Send("{LWINDOWN}{UP}{LWINUP}")
Sleep(1000)
Send("i")
Send("= Headline{ENTER}")
Send("{ENTER}")
Send("Paragraph one{ENTER}")
Send("{ENTER}")
Send("Paragraph two{ENTER}")
Send("{ENTER}")
Send("== Second Headline{ENTER}")
Send("{ENTER}")
Send("a link to https://docs-as-co.de{ASC 091}docs-as-co.de{ASC 093}{ENTER}")
Sleep(1000)
Send("{ESC}:wq{ENTER}")
Sleep(500)

Send("mvn{ENTER}")
ProcessWait("java")
ConsoleWrite("java found"+@CRLF)
Sleep(5000)
ProcessWaitClose("java")
ConsoleWrite("java closed"+@CRLF)
Sleep(13000)
Send("find target{ENTER}")
Sleep(1000)
Send("firefox target/generated-docs/test.html &{ENTER}")
WinWaitActive("[CLASS:vcxsrv/x X rl]")
Send("{ALT TAB}")
Sleep(1000)
Send("{LWINDOWN}{SHIFTDOWN}{RIGHT}{SHIFTUP}{UP}{LWINUP}")
Sleep(2000)
Send("{F10}")
Sleep(1000)
WinClose("[CLASS:vcxsrv/x X rl]")
WinWaitClose("[CLASS:vcxsrv/x X rl]")
;Send("{ALT TAB}")
Sleep(2500)
Send("cd ..{ENTER}")
Send("rm -r quickstart_maven{ENTER}")
Send("exit{ENTER}")

; Now quit by sending a "close" request to the calculator window using the classname
; WinClose("[CLASS:ConsoleWindowClass]")

; Now wait for the calculator to close before continuing
; WinWaitClose("[CLASS:ConsoleWindowClass]")

; Finished!
