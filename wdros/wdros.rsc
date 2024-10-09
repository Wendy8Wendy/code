:if ([:pick [/system resource get version] 0 ([:len [/system resource get version]]1)] = 7) do={
##############V7部分
:put 7
##############V7部分
} else={
##############V6部分
:put 6
##############V6部分
}
/file remove wdros.rsc