Received: from [66.207.66.26] (helo=www.balister.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philip@balister.org>) id 1HvCfc-000708-8Y
	for openembedded-devel@openembedded.org; Mon, 04 Jun 2007 15:32:31 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by www.balister.org (8.13.8/8.13.8) with ESMTP id l54DUHQw009321
	for <openembedded-devel@openembedded.org>;
	Mon, 4 Jun 2007 09:30:17 -0400
Message-ID: <466413E9.10707@balister.org>
Date: Mon, 04 Jun 2007 09:30:17 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 1.5.0.12 (X11/20070530)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <ae36f8040706040616y6de8ab01hb8699de1fbd239b2@mail.gmail.com>
In-Reply-To: <ae36f8040706040616y6de8ab01hb8699de1fbd239b2@mail.gmail.com>
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
X-List-Received-Date: Mon, 04 Jun 2007 13:32:43 -0000
X-Groupsio-MsgNum: 2182
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms050500000007000009020808"

--------------ms050500000007000009020808
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Is there a particular reason you need little-endian? Does this make it 
easier to communicate with the DSP?

Philip

Luís Cargnini wrote:
> please how to set the angstrom distro not to
> TARGET_OS      = "linux-gnueabi"
> 
> but to
> TARGET_OS      = "linux-gnu"
> 
> according to distro this is set to eabi (big-endian) and i need
> little-endian
> 
> 

--------------ms050500000007000009020808
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA3MDYwNDEz
MzAxN1owIwYJKoZIhvcNAQkEMRYEFOsoZ8IegzHAB18rKd5iCTiE3UY5MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyuqTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQfMMU85nany31PjCbfnyu
qTANBgkqhkiG9w0BAQEFAASCAQBaCKQ+sQxI66uxOQOLGuesF9uZ87Q3buwB8mkuD4oZ+jnD5cv+
uTs96WgYJdxAT1f0GYIlRrUnKtBHmsc7X02KEWSqPQ17wTbOa9DXD3Oiospd4BWsRXB1BUEF222f
L3HlT1lITmkPZA4/0d8cpD6iE4hVoqH8HAJmn3M/szAV+zoqD+nW2Is1vhtH6XZLoMXT6IB8iD4g
cgeXXOwVvDvqYQiTqaam977QZwleuT4F9zfOYjkAz+R1a62mk6yn/6TQSbkTy3rspUsxZbzGsQ//
46UPVxTaIFBT62hOaOr6Hu5ZZnxoy4P0mflwa8pOf1t5t5nUct3Rl5hSR2LtvlWLAAAAAAAA

--------------ms050500000007000009020808--
