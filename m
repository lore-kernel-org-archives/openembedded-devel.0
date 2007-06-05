Received: from [198.82.23.235] (helo=www.balister.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philip@balister.org>) id 1Hvbaa-000496-Sr
	for openembedded-devel@openembedded.org; Tue, 05 Jun 2007 18:08:57 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by www.balister.org (8.13.8/8.13.8) with ESMTP id l55G6eUZ011209
	for <openembedded-devel@openembedded.org>;
	Tue, 5 Jun 2007 12:06:41 -0400
Message-ID: <46658A10.8070900@balister.org>
Date: Tue, 05 Jun 2007 12:06:40 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 1.5.0.12 (X11/20070530)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <ae36f8040706040616y6de8ab01hb8699de1fbd239b2@mail.gmail.com>	<4664154E.5000302@dominion.kabel.utwente.nl>
	<ae36f8040706050853y637e41acj50c22400c7a2029a@mail.gmail.com>
In-Reply-To: <ae36f8040706050853y637e41acj50c22400c7a2029a@mail.gmail.com>
Subject: Re: target os of angstrom
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
X-List-Received-Date: Tue, 05 Jun 2007 16:08:58 -0000
X-Groupsio-MsgNum: 2188
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms080000020107080604090400"

--------------ms080000020107080604090400
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

This is a fairly good explanation:

http://wiki.debian.org/ArmEabiPort

And yes, EABI is Embedded ABI.

Philip

Luís Cargnini wrote:
> so eabi is the embedded abpplication binary interface ?
> 
> On 6/4/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Luís Cargnini schreef:
>>> please how to set the angstrom distro not to
>>> TARGET_OS      = "linux-gnueabi"
>>>
>>> but to
>>> TARGET_OS      = "linux-gnu"
>>>
>>> according to distro this is set to eabi (big-endian) and i need
>>> little-endian
>> Wrong. arm-angstrom-linux-gnueabi is little-endian,
>> armeb-angstrom-linux-gnueabi
>> bigendian. Note how 'eabi' has nothing to do with endiannes
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>
>> iD8DBQFGZBVOMkyGM64RGpERArU/AJ9e09YEV3/MGra5HtCLzJWqRYhfhACfaUfU
>> G0kj4pg1KPgjT+BCzFulAZc=
>> =OGGK
>> -----END PGP SIGNATURE-----
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> 
> 

--------------ms080000020107080604090400
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICEHzDFPOZ2p8t9T4wm358rqkwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA3MDQxNDEzMTkyOVoXDTA4MDQxMzEzMTky
OVowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvJS5tUVsXVRltIKV57mvyOnqjrDpQX8YvC35MubnQf7RctFZ
65G/JPVfYuJzo0956WHCLCSPC1mhaA5bVNCogPweIYq9EoZZsTijl3qrP6AkCdfr47S5fwIps4vZ
X3zFZ1BXZ7up+wrl+s0Xp3i6IJrdVysiAbz5oUF1Fl7Go0SzLgwQa+m7LL2XqFaMM3jIH+qUxu72
tDt43Jjl97/8YGsdNWQRipOWA+VvK6JS5yse1IxEI73mWZWeQMe4y6TEtp/8kcWxCB7aIjrMNQMN
szDZVB2pvaRXapwf5HKxY7zLuScR94reAR0hBmusQ2xPuhDGbbjEdkvgcST2yR0ZlwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAbLC8HLx4GoPVKDTTePeZ6Atrqtro0XmJi/Nqw7DJyWG5mzqAS2HdIFnxOuAk9srp
nbYSpM8lXwnRtLaIrlnawIMDtCrvBQ4RSnrUsxxDVVa+FJYDP2nzYFFul8eXoZfCUiYil1flfdYN
U5QulSNRWJZkmYvowYVfU81qKnZ0TFAwggL9MIICZqADAgECAhB8wxTzmdqfLfU+MJt+fK6pMA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wNzA0MTQxMzE5MjlaFw0wODA0MTMxMzE5MjlaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALyUubVFbF1U
ZbSClee5r8jp6o6w6UF/GLwt+TLm50H+0XLRWeuRvyT1X2Lic6NPeelhwiwkjwtZoWgOW1TQqID8
HiGKvRKGWbE4o5d6qz+gJAnX6+O0uX8CKbOL2V98xWdQV2e7qfsK5frNF6d4uiCa3VcrIgG8+aFB
dRZexqNEsy4MEGvpuyy9l6hWjDN4yB/qlMbu9rQ7eNyY5fe//GBrHTVkEYqTlgPlbyuiUucrHtSM
RCO95lmVnkDHuMukxLaf/JHFsQge2iI6zDUDDbMw2VQdqb2kV2qcH+RysWO8y7knEfeK3gEdIQZr
rENsT7oQxm24xHZL4HEk9skdGZcCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBAGywvBy8eBqD1Sg003j3megLa6ra
6NF5iYvzasOwyclhuZs6gEth3SBZ8TrgJPbK6Z22EqTPJV8J0bS2iK5Z2sCDA7Qq7wUOEUp61LMc
Q1VWvhSWAz9p82BRbpfHl6GXwlImIpdX5X3WDVOULpUjUViWZJmL6MGFX1PNaip2dExQMIIDPzCC
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
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhB8wxTzmdqfLfU+MJt+fK6pMAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDYwNTE2
MDY0MFowIwYJKoZIhvcNAQkEMRYEFFxA/Jr1JgTSHpPRjFGaerH2EcPuMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyuqTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyu
qTANBgkqhkiG9w0BAQEFAASCAQAH3yGdO94S94vf1780Mwa7dGYF6AgN7ze61zZGAiKlEHkStxAl
Ok181KpGLJLiMBTpkql1BN/OQuA9JlwvHknIlJOyxOjG+RDn1Zu8xEneRopJ8mhpu6Yiq/2jBFbw
KiSXtTRXb2IkMmjsAqMnGWv4FCa956QegV91BdNv2rzMHeZEYErRJnwyH3jYCToKNKqS1Oad3tGz
WU+8xlKYWxopJTVAB0/Piag97/d8c3MNYnJ9r/7BXydxPE8WA6eDW8IOMTcAm6B/mOn30MljwNDy
GvxlsWVNViPrhyNRqCQnnh9Hb6UrVZcivJSJEhsopLAjxR11LPzV9FyJYm7h4NSOAAAAAAAA

--------------ms080000020107080604090400--
