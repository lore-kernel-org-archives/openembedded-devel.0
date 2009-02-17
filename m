Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1LZRz8-0000x6-PA
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 16:35:46 +0100
Received: (qmail 5068 invoked by uid 1003); 17 Feb 2009 15:33:43 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 17 Feb 2009 15:33:43 -0000
Message-ID: <499AD8D6.3000708@balister.org>
Date: Tue, 17 Feb 2009 10:33:42 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: Autobuilder bugs versus stable branch being updated
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
X-List-Received-Date: Tue, 17 Feb 2009 15:35:47 -0000
X-Groupsio-MsgNum: 7803
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms010100060304090802010001"

--------------ms010100060304090802010001
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I think it is a but of stretch to close old autobuilder bugs with the 
comment the stable branch will not be updated.

These two issues are unrelated.

Autobuilder failures should be logged in tinderbox since they are not 
getting attention in bugzilla.

The stable branch updates are handled by users of the stable branch.

Philip

--------------ms010100060304090802010001
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICEHW4VJIUQV0u11NnfLpF2IUwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA4MDQxNDE5MTkzMVoXDTA5MDQxNDE5MTkz
MVowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxyNViPlSmMq2Kl4m7iDBI3gB7Pwhg+4vnXCKEF3qIoLwNDVl
27CP8RY0umjENzykOR6ZhzYx4fH8arNV5+nlXsH8KNnbDpd5ICTZvbUJdt1gPETmLczGy4hh8woC
u7qodyy7YZcGMiUY5LxoL7vIQHysir4rbMRV/JIdmhKfFrHb+glDe8XbfTJ3xKO+BsMgLDaSiRMe
lH6uFLAVv9oRoIJxHQhwKLvlrOSQj+ek2fL683BzOUsM4BN/fiwvtJ/y3doVEoKUp8ippOXrwLAX
FPprPAAdIydqufTxHotooFqbQzqSJv4cTNDTxf2fg9YfH2RAs8vTdc/wgIVlL8fJnQIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEASFC7i4DqutUTifbyNtEe+e9bqgqWUScDFl0BTV5fFVBX/mFpM3RBZJfq+iM5q0L7
qont3sGaXG0cdVvRk2dkuV2i0HwkmTLJ4HTLMyJ57BjMJWY9ydDiY+Ai1pINmjIgq/qI0aireByq
Nee68q+PaWE7bfW1XvfqZD56QunCijswggL9MIICZqADAgECAhB1uFSSFEFdLtdTZ3y6RdiFMA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wODA0MTQxOTE5MzFaFw0wOTA0MTQxOTE5MzFaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMcjVYj5UpjK
tipeJu4gwSN4Aez8IYPuL51wihBd6iKC8DQ1Zduwj/EWNLpoxDc8pDkemYc2MeHx/GqzVefp5V7B
/CjZ2w6XeSAk2b21CXbdYDxE5i3MxsuIYfMKAru6qHcsu2GXBjIlGOS8aC+7yEB8rIq+K2zEVfyS
HZoSnxax2/oJQ3vF230yd8SjvgbDICw2kokTHpR+rhSwFb/aEaCCcR0IcCi75azkkI/npNny+vNw
czlLDOATf34sL7Sf8t3aFRKClKfIqaTl68CwFxT6azwAHSMnarn08R6LaKBam0M6kib+HEzQ08X9
n4PWHx9kQLPL03XP8ICFZS/HyZ0CAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBAEhQu4uA6rrVE4n28jbRHvnvW6oK
llEnAxZdAU1eXxVQV/5haTN0QWSX6vojOatC+6qJ7d7BmlxtHHVb0ZNnZLldotB8JJkyyeB0yzMi
eewYzCVmPcnQ4mPgItaSDZoyIKv6iNGoq3gcqjXnuvKvj2lhO231tV736mQ+ekLpwoo7MIIDPzCC
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
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhB1uFSSFEFdLtdTZ3y6RdiFMAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDIxNzE1
MzM0MlowIwYJKoZIhvcNAQkEMRYEFKOsUsuoS8OBuyaKNSB/+lxhOziRMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXYhTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXY
hTANBgkqhkiG9w0BAQEFAASCAQApc3B9uU8seurY9Op0ILoesyw9n1KjeuizBxpkllHpQhgv96KP
QjPpPQL66Yyt3PxF9ROhZeWkGHDakom8ZfstQ2eH5yGqPlyLsr8gxPq0NIFSkzKMm4sWsPHglLOj
NPbxDZQd/pnnObneD25DnWGgYUloxG4w/dApA5Dmltq0jAzUrWKsIbjqbUHPbkcMqMR2kvoRDu0Z
Elpv91Eq72XyPdhodaL2Gk3bBVOk4zmc/4hK6i7Rx7Ocqpk6w4Ve0ZVxL7u5wQgyXTsOCtEvYG9S
kiGBMnX0ByuCVtB9Wveq5Mzep8qGXTWNZoF47ASyYNG3oxRIcAJXA4A3KhwMU33VAAAAAAAA

--------------ms010100060304090802010001--
