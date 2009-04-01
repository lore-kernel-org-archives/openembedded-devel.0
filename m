Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Lp0r6-0001Kk-Vm
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 15:51:49 +0200
Received: (qmail 32748 invoked by uid 1003); 1 Apr 2009 13:49:27 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 1 Apr 2009 13:49:24 -0000
Message-ID: <49D370DF.5080501@balister.org>
Date: Wed, 01 Apr 2009 09:49:19 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1238593084-9124-1-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1238593084-9124-1-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH] epiphany: update to 2.27
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
X-List-Received-Date: Wed, 01 Apr 2009 13:51:49 -0000
X-Groupsio-MsgNum: 8929
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms040001090701080303010809"

--------------ms040001090701080303010809
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister (philip@balister.org)

Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  conf/checksums.ini               |   32 ++++++++++++++++++++++++++++++++
>  recipes/gnome/epiphany_2.27.1.bb |   16 ++++++++++++++++
>  2 files changed, 48 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/gnome/epiphany_2.27.1.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index d476432..2a119dd 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -5334,6 +5334,10 @@ sha256=6cf629d628ee2ae908c9aa3c530fa05344dfe47a9b770c1d9d1e7cc16d7528b3
>  md5=af51614c7b78f8b8c68e9ece3d8f4d8f
>  sha256=cc6ff7b30911bf80d8d72d6db7cc7ecbf51b2f5bb66796b79da33f8f680402ac
>  
> +[http://ftp.gnome.org/pub/GNOME/sources/epiphany/2.27/epiphany-2.27.1.tar.bz2]
> +md5=840fb2dc0511039de378927e3bccd802
> +sha256=36d2b3652b5bbf7b459fda95ac0f25c429aa2e05e42fede3e88ce463879bdb8b
> +
>  [http://enlightenment.freedesktop.org/files/epsilon-0.3.0.007.tar.gz]
>  md5=408d3c63f9efa06e93e29a691c28985e
>  sha256=6f40962eb8d76e0e9d76ec9f461d62c6af8561028d194358aed001827cc418fc
> @@ -11198,14 +11202,26 @@ sha256=a758c8f9b55d8288e2484dd1a2dcbd9c4ca3ca3052864a45cb104f613b7f712d
>  md5=b4f7ffcc294d41a6a4c40d6e44b7734d
>  sha256=280b34fefa12c3d7a3e432c3730fe5d0d56e8d169c28b695cce9ba6d8dbe6e38
>  
> +[http://projects.linuxtogo.org/frs/download.php/221/kexecboot-0.3.tar.gz]
> +md5=3c3b8edb739146183b3ddff3e0af5f1c
> +sha256=61a918b38a4b0b97e1469cbe3d9c4307af956bd95abec2067aa2fd278739cd96
> +
>  [http://projects.linuxtogo.org/frs/?group_id=50/kexecboot-0.4.tar.gz]
>  md5=b4a4509ca3f546cfedd23aa6f99ab81d
>  sha256=b8c9d3a51f04bdecabbb4135079d408e02c98cdf3156bab8418a6830cb64b890
>  
> +[http://projects.linuxtogo.org/~jay7/kexecboot-0.4.tar.gz]
> +md5=b4a4509ca3f546cfedd23aa6f99ab81d
> +sha256=b8c9d3a51f04bdecabbb4135079d408e02c98cdf3156bab8418a6830cb64b890
> +
>  [http://projects.linuxtogo.org/frs/?group_id=50/kexecboot-0.5.tar.gz]
>  md5=a937303d7ef3fc645f9dccf89e1494e2
>  sha256=49c95d62e32b66c9f97e791f667afa82f0714bc0a0e0ad48df010f4f36de42ab
>  
> +[http://projects.linuxtogo.org/frs/download.php/226/kexecboot-0.5.tar.gz]
> +md5=a937303d7ef3fc645f9dccf89e1494e2
> +sha256=49c95d62e32b66c9f97e791f667afa82f0714bc0a0e0ad48df010f4f36de42ab
> +
>  [http://gpe.linuxtogo.org/download/source/keylaunch-2.0.10.tar.gz]
>  md5=2d81de20b26eac5ad44b759eb412e8eb
>  sha256=38715fcc508740deb3f169a01092f03ea4ce92c9ec3c2589a9510534aa52a540
> @@ -14866,6 +14882,22 @@ sha256=ee3edf1ea89a90f2b7f82ad09b83c25dc8ea8ca7cf0fce2aa921f897929b2bb9
>  md5=6f15406664ef31172c68d46567569bb8
>  sha256=9532b981c9b8974ceedd3d25a8f9a0e167a92c9da0dece47f34a4ec34e34b1cf
>  
> +[http://llvm.org/releases/1.9/llvm-1.9.tar.gz]
> +md5=866ba97420f5ce978b6a6b1cb4338890
> +sha256=17b82323151925ff5a7ad09a21781a0fa50ead4b87a339cee262271e4ededa13
> +
> +[http://llvm.org/releases/2.0/llvm-2.0.tar.gz]
> +md5=6f88002301a25f31a492052695f6138e
> +sha256=84d7ca0331963d2b2be7e18af61a80f49653c692f0bad63c5d26b2a2f7bc3375
> +
> +[http://llvm.org/releases/2.1/llvm-2.1.tar.gz]
> +md5=b930e7213b37acc934d0d163cf13af18
> +sha256=8cabd422f249ada736d864fc8a1f4d14aabefacb6f860c9beefbc53f93e0f96c
> +
> +[http://llvm.org/releases/2.4/llvm-2.4.tar.gz]
> +md5=bf43eee98c364fd79c7d2b72e645a15e
> +sha256=5fc295b3cf3de019962aee3be1c5efb49d6bf5041dae59451f6c0f544eb36bdc
> +
>  [http://llvm.org/releases/2.5/llvm-2.5.tar.gz]
>  md5=55df2ea8665c8094ad2ef85187b9fc74
>  sha256=8f3d69e63bc5d1ee2c2ee49ff07ccb7e070070a0e937813d2a6179b9e2e173ed
> diff --git a/recipes/gnome/epiphany_2.27.1.bb b/recipes/gnome/epiphany_2.27.1.bb
> new file mode 100644
> index 0000000..0c3327d
> --- /dev/null
> +++ b/recipes/gnome/epiphany_2.27.1.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "GNOME default webbrowser"
> +DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
> +RDEPENDS = "gnome-vfs-plugin-http"
> +
> +inherit gnome
> +
> +EXTRA_OECONF = "--with-engine=webkit --with-distributor-name=${DISTRO}"
> +
> +do_configure_prepend() {
> +        touch ${S}/gnome-doc-utils.make
> +        sed -i -e s:help::g Makefile.am
> +}
> +
> +FILES_${PN} += "${datadir}/icons ${datadir}/dbus-1"
> +
> +

--------------ms040001090701080303010809
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDQwMTEz
NDkxOVowIwYJKoZIhvcNAQkEMRYEFJZEA4Kp5qjKArJZ+5zCZ79vVaPXMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXYhTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXY
hTANBgkqhkiG9w0BAQEFAASCAQC3I/mbLGm9KEuMhZOwYr+ZB97XkL5eCVjZ7RYTGJDAii3i1s0W
stP89XnUDjzGZFjj7WOgduOaGqKTSX8O52CqWbhnxfwsNYcJ+nVzAkE45CgZWLUDy3Bw/594AxE/
9EBaOd9UElJZxzixz7cQLRX4PePhFJzxMcBEc2XiQ4imlYqghFhiW1aP/QNIgZz3eMk8u/V95x9Z
iDt5UQ11Je1cuHnUe1WtR2674Gp9ylFw7eIGMwjJ76kAsa/jwQJGYF21HLlBYzRn5EEMhElH0OFD
v1hxsMsRqd+G6URR6HyzVfKfHr06MfNf7NjCLL7HOjVawK+QM7DLSBtwN5xXLVqFAAAAAAAA

--------------ms040001090701080303010809--
