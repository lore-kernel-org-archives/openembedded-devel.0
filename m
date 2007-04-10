Received: from [198.82.23.224] (helo=www.balister.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philip@balister.org>) id 1HbK0z-0000VK-T3
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 19:20:22 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by www.balister.org (8.13.8/8.13.8) with ESMTP id l3AHKL7M026549
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 13:20:21 -0400
Message-ID: <461BC751.4090606@balister.org>
Date: Tue, 10 Apr 2007 13:20:17 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 1.5.0.10 (X11/20070302)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <461BB515.7030108@balister.org>
	<200704101902.04699.repvik@kynisk.com>
In-Reply-To: <200704101902.04699.repvik@kynisk.com>
Subject: Re: RFC: U-Boot package clean up
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2007 17:20:22 -0000
X-Groupsio-MsgNum: 1814
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms030301060807030204030204"

--------------ms030301060807030204030204
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Øyvind Repvik wrote:
> I think I moved uboot-utils away from the uboot-utils directory and into 
> u-boot. Either way, it's not quite done yet. I'll take a look at them and 
> remove whichever one is "wrong".
>>   uboot-utils_1.1.2.bb <- This is PR5 and the one in the uboot-utils is PR4

I think uboot-utils belongs in the u-boot directory.

Can we modify u-boot.inc to create the u-boot-utils package internally?

Philip

--------------ms030301060807030204030204
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICEBHvMir6xnUSDyiLP20+hb4wDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDQxNDEyNDMyNVoXDTA3MDQxNDEyNDMy
NVowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq3dpPM5m9xXgeamg5R4O98aJ573uQPAU0hARVdQQeipeYZTD
642AZkuc0T+u+pTHVGp2RYX8/2ihbnSxqDMXiYsaKG5q+7QVXIe/gIQSD1WhmDUcDaZ9cFU04ogh
SosFnIQFDzgde1Npi0hixmAUR/W0yJ/h1qAw4Gl5+RA+XMD7bSQ8JzbnaVyxzHa7lWz2TtT7SG7U
+xBKaxUoPiujB86EZplhKaK/aBNi1Qexo6ibCzr5L0MalCyTY0wyvLkuB8fVLneGmS9k+FixKnET
n/AI5dv1Rvnw98pT1iLdxD9bxaygntLM43B+MFrk7ovEUS5kKnIaOVq8szeo/eRUXwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEEBQADgYEAieX+0Zb3MOoVi4spKQb4SE/qINe6cqFUBKcQWh5AjcOlr8UQlKr5kv2KXGlg786S
s6svdkqqI8ecfLbzT/mi1fSHAIoXIRwoVZATRto7UUW7RjHq9too/h2Ady0cFMCheKA/qRZ6ptRh
8JCIoqnvD5EGexK1Tk4OPeeBlK9QuocwggL9MIICZqADAgECAhAR7zIq+sZ1Eg8oiz9tPoW+MA0G
CSqGSIb3DQEBBAUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wNjA0MTQxMjQzMjVaFw0wNzA0MTQxMjQzMjVaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKt3aTzOZvcV
4HmpoOUeDvfGiee97kDwFNIQEVXUEHoqXmGUw+uNgGZLnNE/rvqUx1RqdkWF/P9ooW50sagzF4mL
Gihuavu0FVyHv4CEEg9VoZg1HA2mfXBVNOKIIUqLBZyEBQ84HXtTaYtIYsZgFEf1tMif4dagMOBp
efkQPlzA+20kPCc252lcscx2u5Vs9k7U+0hu1PsQSmsVKD4rowfOhGaZYSmiv2gTYtUHsaOomws6
+S9DGpQsk2NMMry5LgfH1S53hpkvZPhYsSpxE5/wCOXb9Ub58PfKU9Yi3cQ/W8WsoJ7SzONwfjBa
5O6LxFEuZCpyGjlavLM3qP3kVF8CAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAInl/tGW9zDqFYuLKSkG+EhP6iDX
unKhVASnEFoeQI3Dpa/FEJSq+ZL9ilxpYO/OkrOrL3ZKqiPHnHy280/5otX0hwCKFyEcKFWQE0ba
O1FFu0Yx6vbaKP4dgHctHBTAoXigP6kWeqbUYfCQiKKp7w+RBnsStU5ODj3ngZSvULqHMIIDPzCC
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
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAR7zIq+sZ1Eg8oiz9tPoW+MAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDQxMDE3
MjAxN1owIwYJKoZIhvcNAQkEMRYEFKnR7yp454UgGek9Wc6UKGEW/qZ1MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQEe8yKvrGdRIPKIs/bT6FvjCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQEe8yKvrGdRIPKIs/bT6F
vjANBgkqhkiG9w0BAQEFAASCAQB1LO6AHd545ujRPTqFbuexuY25nht8+hWZ0ZxPbYXLO2r1GhHQ
sen9IK4ufBYX4m3XmfOB7CV/dr6NIjGQvvJNy4/4piGdhDz7SODuDIBey+aExeeZXZYXwKLU3ytj
PUIxdpiosSaMhfqtD+3h91kfG1iRzDbCKmK5erExwcigx8BhXKVNPL9u2VCMDwQ2T6WnQlUfUKHv
xN7pQY4SynwdLZJXMc93M7VSY+4ELS5KD3yaUJ6pW1LfMLN7rE3pbUnQLMDbRLS11DJSdDxxMjbm
9IVPlQ+y0dySU6hYjZEaD+y1obH3BQwml4WSe9eLNVl6TYXOZGtgf/xkQi/aLEOdAAAAAAAA

--------------ms030301060807030204030204--
