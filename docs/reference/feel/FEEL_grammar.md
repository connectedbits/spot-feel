1. expression =
   1.a textual expression |
   1.b boxed expression ;
2. textual expression =
   2.a function definition | for expression | if expression | quantified expression |
   2.b disjunction |
   2.c conjunction |
   2.d comparison |
   2.e arithmetic expression |
   2.f instance of |
   2.g path expression |
   2.h filter expression | function invocation |
   2.i literal | simple positive unary test | name | "(" , textual expression , ")" ;
3. textual expressions = textual expression , { "," , textual expression } ;
4. arithmetic expression =
   4.a addition | subtraction |
   4.b multiplication | division |
   4.c exponentiation |
   4.d arithmetic negation ;
5. simple expression = arithmetic expression | simple value ;
6. simple expressions = simple expression , { "," , simple expression } ;
7. simple positive unary test =
   7.a [ "<" | "<=" | ">" | ">=" ] , endpoint |
   7.b interval ;
8. interval = ( open interval start | closed interval start ) , endpoint , ".." , endpoint , ( open interval end | closed
   interval end ) ;
9. open interval start = "(" | "]" ;
10. closed interval start = "[" ;
11. open interval end = ")" | "[" ;
12. closed interval end = "]" ;
13. simple positive unary tests = simple positive unary test , { "," , simple positive unary test } ;
14. simple unary tests =
    14.a simple positive unary tests |
    14.b "not", "(", simple positive unary tests, ")" |
    14.c "-";
15. positive unary test = simple positive unary test | "null" ;
16. positive unary tests = positive unary test , { "," , positive unary test } ;
17. unary tests =
    17.a positive unary tests |
    17.b "not", " (", positive unary tests, ")" |
    17.c "-"
18. endpoint = simple value ;
19. simple value = qualified name | simple literal ;
20. qualified name = name , { "." , name } ;
21. addition = expression , "+" , expression ;
22. subtraction = expression , "-" , expression ;
23. multiplication = expression , "\*" , expression ;
24. division = expression , "/" , expression ;
25. exponentiation = expression, "\*\*", expression ;
26. arithmetic negation = "-" , expression ;
27. name = name start , { name part | additional name symbols } ;
28. name start = name start char, { name part char } ;
29. name part = name part char , { name part char } ;
30. name start char = "?" | [A-Z] | "\_" | [a-z] | [\uC0-\uD6] | [\uD8-\uF6] | [\uF8-\u2FF] | [\u370-\u37D] |
    [\u37F-\u1FFF] | [\u200C-\u200D] | [\u2070-\u218F] | [\u2C00-\u2FEF] | [\u3001-\uD7FF] | [\uF900-\uFDCF] |
    [\uFDF0-\uFFFD] | [\u10000-\uEFFFF] ;
31. name part char = name start char | digit | \uB7 | [\u0300-\u036F] | [\u203F-\u2040] ;

32. additional name symbols = "." | "/" | "-" | "’" | "+" | "\*" ;
33. literal = simple literal | "null" ;
34. simple literal = numeric literal | string literal | Boolean literal | date time literal ;
35. string literal = '"' , { character – ('"' | vertical space) }, '"' ;
36. Boolean literal = "true" | "false" ;
37. numeric literal = [ "-" ] , ( digits , [ ".", digits ] | "." , digits ) ;
38. digit = [0-9] ;
39. digits = digit , {digit} ;
40. function invocation = expression , parameters ;
41. parameters = "(" , ( named parameters | positional parameters ) , ")" ;
42. named parameters = parameter name , ":" , expression ,
    { "," , parameter name , ":" , expression } ;
43. parameter name = name ;
44. positional parameters = [ expression , { "," , expression } ] ;
45. path expression = expression , "." , name ;
46. for expression = "for" , name , "in" , expression { "," , name , "in" , expression } , "return" , expression ;
47. if expression = "if" , expression , "then" , expression , "else" expression ;
48. quantified expression = ("some" | "every") , name , "in" , expression , { name , "in" , expression } , "satisfies" ,
    expression ;
49. disjunction = expression , "or" , expression ;
50. conjunction = expression , "and" , expression ;
51. comparison =
    51.a expression , ( "=" | "!=" | "<" | "<=" | ">" | ">=" ) , expression |
    51.b expression , "between" , expression , "and" , expression |
    51.c expression , "in" , positive unary test ;
    51.d expression , "in" , " (", positive unary tests, ")" ;
52. filter expression = expression , "[" , expression , "]" ;
53. instance of = expression , "instance" , "of" , type ;
54. type = qualified name ;
55. boxed expression = list | function definition | context ;
56. list = "[" [ expression , { "," , expression } ] , "]" ;
57. function definition = "function" , "(" , [ formal parameter { "," , formal parameter } ] , ")" ,
    [ "external" ] , expression ;
58. formal parameter = parameter name ;
59. context = "{" , [context entry , { "," , context entry } ] , "}" ;
60. context entry = key , ":" , expression ;
61. key = name | string literal ;
62. date time literal = ( "date" | "time" | "date and time" | "duration" ) , "(" , string literal , ")" ;
