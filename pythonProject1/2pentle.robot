*** Variables ***
${string}   piesek
@{list}   pierwszy   drugi   trzeci  czwarty  piaty
@{list of numbers}    1    2   3   4   5
&{dictionary}    slowo=${string}   numer=30   lista=@{list}
@{imiona}    Kamil    Marta   Augusto   Marek
@{nazwiska}  Kowalski    Malinowski   Nowak   Nijaki
*** Test Cases ***
Nest Loop
    @{letters}   Create List   a   b   c   d
    Log   ${letters}
    @{numbers}   Create List   ${1}   ${2}   ${3}
    Log   ${numbers}
    FOR  ${letter}  IN  @{letters}
        FOR ${number}  IN  @{numbers}
            Log ${letter} ${number}
        END
    END







For Loop In Dictionary
    Log  ${dictionary}
    FOR   ${keys_and_values}   IN  &{dictionary}
        Log ${keys_and_values}
    END

For Loop In Range With Index
    FOR ${i}   IN RANGE   4
        LOG   ${imiona}[${i}]  @{nazwiska}[${i}]
    END


For Loop In List
    FOR   ${item}  IN  @{list_of_numbers}
        IF ${item}  == 3  Log   ${item}
    END


For Loop In Range 10

  FOR ${i}   IN RANGE   10
       Log   ${i}
    END$

For Loop In Range 4 10