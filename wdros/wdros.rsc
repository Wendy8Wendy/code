:if ([:pick [/system resource get version] 0 ([:len [/system resource get version]]1)] = 7) do={
##############V7部分
:put 7;/file remove file-name=wdros.rsc;
##############V7部分
} else={
##############V6部分
:put 6;/file remove file-name=wdros.rsc;
##############V6部分
}