Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1LyPOP-0003mV-7E
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 13:53:01 +0200
Received: (qmail 3521 invoked by uid 1003); 27 Apr 2009 11:47:56 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 27 Apr 2009 11:47:54 -0000
Message-ID: <49F59B68.1010208@balister.org>
Date: Mon, 27 Apr 2009 07:47:52 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF77C@hiob.intern.dresearch.de>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF78E@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF78E@hiob.intern.dresearch.de>
Subject: Re: gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Apr 2009 11:53:02 -0000
X-Groupsio-MsgNum: 9821
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms040300050502010409070900"

--------------ms040300050502010409070900
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Sledz, Steffen wrote:
> Ping.
> 
> At the moment we are not able to make a build out of the .dev tree. :(

For what machine and distro?

Philip




> 
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org 
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On 
>> Behalf Of Sledz, Steffen
>> Sent: Friday, April 24, 2009 1:55 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
>>
>> gcc_4.2.4.bb reports these errors for a few days. Can someone 
>> please have a look at it.
>>
>> ERROR: QA Issue: No GNU_HASH in the elf binary: 
>> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
>> 4.2.4-r3/install/gcc/usr/bin/arm-angstrom-linux-gnueabi-gcc'
>> ERROR: QA Issue: No GNU_HASH in the elf binary: 
>> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
>> 4.2.4-r3/install/gcc/usr/libexec/gcc/arm-angstrom-linux-gnueab
>> i/4.2.4/collect2'
>> ERROR: QA Issue: non -dev package contains symlink .so: gcc 
>> path 
>> '/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/gcc
>> /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.2.4/libgcc_s.so'
>> ERROR: QA Issue: No GNU_HASH in the elf binary: 
>> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
>> 4.2.4-r3/install/g++/usr/bin/arm-angstrom-linux-gnueabi-g++'
>> ERROR: QA Issue: No GNU_HASH in the elf binary: 
>> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
>> 4.2.4-r3/install/g++/usr/libexec/gcc/arm-angstrom-linux-gnueab
>> i/4.2.4/cc1plus'
>> ERROR: QA Issue: No GNU_HASH in the elf binary: 
>> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
>> 4.2.4-r3/install/cpp/usr/bin/arm-angstrom-linux-gnueabi-cpp'
>> ERROR: QA Issue: No GNU_HASH in the elf binary: 
>> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
>> 4.2.4-r3/install/cpp/usr/libexec/gcc/arm-angstrom-linux-gnueab
>> i/4.2.4/cc1'
>> ERROR: QA Issue: No GNU_HASH in the elf binary: 
>> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
>> 4.2.4-r3/install/gfortran/usr/bin/arm-angstrom-linux-gnueabi-gfortran'
>> ERROR: QA Issue: No GNU_HASH in the elf binary: 
>> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
>> 4.2.4-r3/install/gfortran/usr/libexec/gcc/arm-angstrom-linux-g
>> nueabi/4.2.4/f951'
>> ERROR: QA Issue: No GNU_HASH in the elf binary: 
>> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
>> 4.2.4-r3/install/gcov/usr/bin/arm-angstrom-linux-gnueabi-gcov'
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Error in executing: /opt/openembedded/recipes/gcc/gcc_4.2.4.bb
>> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Error in executing: /opt/openembedded/recipes/gcc/gcc_4.2.4.bb
>> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Error in executing: /opt/openembedded/recipes/gcc/gcc_4.2.4.bb
>> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Error in executing: /opt/openembedded/recipes/gcc/gcc_4.2.4.bb
>> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Build of /opt/openembedded/recipes/gcc/gcc_4.2.4.bb 
>> do_package failed
>> ERROR: Task 1281 (/opt/openembedded/recipes/gcc/gcc_4.2.4.bb, 
>> do_package) failed
>> ERROR: '/opt/openembedded/recipes/gcc/gcc_4.2.4.bb' failed
>>
>> Thx,
>> Steffen
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

--------------ms040300050502010409070900
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICECwlen/oUcoDd1VrNqKp/fwwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA5MDQxNTAwNDQ1OFoXDTEwMDQxNTAwNDQ1
OFowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx5Xoie8CV9dJeiaiKRdylvicHE9Aha6f9/CLlVs+Ezob7fIu
Ra4P9ugzZZ2VCtPMQU3Qsjw35mVmYaKXB1U+fZeffbyad6OJEIK1jhqBIz5jtJMc/YWXn/bRmqCl
MfTCgilUMOcsfiHAbmLVhYiNbEhOuy6vWdxSSolHqVa/IHE72qqjhoYWHd+5XVfx1c4jW+CePNMQ
EHxjCzuD+wq6Mzle72dXw+bnyIpG99hB26uNmV//h5iz1VmJU63FZWynSjG79NcY9+mTWXeX213V
V6kJ2wce2rETbYvKQ7err6NnZnG/tiwGI1M7fQqQAti+CkDciLJ129LO+APVYZQgEwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAIUyDAPIEniN6SUdbDiBqi2dtITdnkoUItm/tX9TRn66P0VtWug7k7xjo6piWRE7B
ZwhihotNY0ZnjlK+h0VorxfY63B5tarRB6qJ7f26ukmpltwWWLDB2hWFoKUCn6PE2NTdj+1xNinh
ZNQHy4GyygXjlVfVSn/ZnaGJ31z4PK0wggL9MIICZqADAgECAhAsJXp/6FHKA3dVazaiqf38MA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wOTA0MTUwMDQ0NThaFw0xMDA0MTUwMDQ0NThaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeV6InvAlfX
SXomoikXcpb4nBxPQIWun/fwi5VbPhM6G+3yLkWuD/boM2WdlQrTzEFN0LI8N+ZlZmGilwdVPn2X
n328mnejiRCCtY4agSM+Y7STHP2Fl5/20ZqgpTH0woIpVDDnLH4hwG5i1YWIjWxITrsur1ncUkqJ
R6lWvyBxO9qqo4aGFh3fuV1X8dXOI1vgnjzTEBB8Yws7g/sKujM5Xu9nV8Pm58iKRvfYQdurjZlf
/4eYs9VZiVOtxWVsp0oxu/TXGPfpk1l3l9td1VepCdsHHtqxE22LykO3q6+jZ2Zxv7YsBiNTO30K
kALYvgpA3IiyddvSzvgD1WGUIBMCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBACFMgwDyBJ4jeklHWw4gaotnbSE3
Z5KFCLZv7V/U0Z+uj9FbVroO5O8Y6OqYlkROwWcIYoaLTWNGZ45SvodFaK8X2OtwebWq0Qeqie39
urpJqZbcFliwwdoVhaClAp+jxNjU3Y/tcTYp4WTUB8uBssoF45VX1Up/2Z2hid9c+DytMIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE
pjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+n
ttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4
oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmww
CwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0
HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCA2QwggNgAgEBMHYwYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAsJXp/6FHKA3dVazaiqf38MAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDQyNzEx
NDc1M1owIwYJKoZIhvcNAQkEMRYEFCs6r1B0ACnYRvdgDXf7JWqk9plUMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQCG1S3zviRBV3uqodq3rjpA3paHf/TwFZBZblfsiNe+7Evyocqf
0oJBvqyEt0jeSX5ialn3Nc8J1xjjrwfluDhFqH+fJTv03qEYnn+NVDgKn0/wPaZht22tvTBhx8FC
MGmlCY3IENNBj95eTn27y+S0D4YzEnSGWII9jFguiMsDtW3gl3rMzrXTkUwMLlfqYzAo/Fd+O6kz
UU0OSCsveS/WKVdJSkoxMTG8wVhWCHPWlGhBTP5pwrhr6NWsAbcJIubzOo9Fp8IA0tV04RqlJF0z
N52LjgG8OAQ0gf7B9ZvZjwjAAhaDV+0g08VKXupiiFofHcCH26IxA4npfoItD0iwAAAAAAAA

--------------ms040300050502010409070900--
