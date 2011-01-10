Received: from moutng.kundenserver.de ([212.227.126.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Dirk@Do13.de>) id 1PcPJH-0000s9-3X
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 22:29:51 +0100
Received: from mail.opfer.lan (do13.in-dsl.de [217.197.85.204])
	by mrelayeu.kundenserver.de (node=mrbap2) with ESMTP (Nemesis)
	id 0M0bdu-1QRce41970-00uL7O; Mon, 10 Jan 2011 22:16:42 +0100
Received: from [192.168.2.47] by mail.opfer.lan with esmtpa (Exim 4.69)
	(envelope-from <Dirk@Do13.de>) id 1PcP6I-0003W7-4a
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 22:16:41 +0100
Message-ID: <4D2B7703.2030605@Do13.de>
Date: Mon, 10 Jan 2011 22:15:47 +0100
From: Dirk Opfer <Dirk@Do13.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294585014.4036.47.camel@mattotaupa>	 <4D29FC65.9010608@gmail.com>
	<1294659553.4342.69.camel@mattotaupa>	
	<4D2B0D23.4070003@nospam.arcornews.de>
	<1294670726.4342.72.camel@mattotaupa>
In-Reply-To: <1294670726.4342.72.camel@mattotaupa>
X-Scan-Signature: 52a5e346f66052aa3727d80d37b66b0f
X-Spam-Score: -4.4 (----)
X-Provags-ID: V02:K0:jy/JUy0keTwrBrN2zeluKUBu9AbfIZHOLz/e5cAwIDt
	H8r1XYmakpLIv8MH8d3Tjg9P5he5rD9byxgAu/cLb/RZn23gaJ
	dNR8xw7D9cKe73sak3scBHXtcs+PlE65RTdswUW1/LAuQIhe4u
	RngW/u8qBsTmYHtrdTpPZwaDyuDli02D/a1OfwxhDcH6NWpRZ9
	L+ccznS0DcwG1SBE4dG3Hx4MxgDMQnxlxpEpvxE9aY=
Subject: Re: [PATCH] libcap, libcap2: use automatic packaging to fix QA errors
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
X-List-Received-Date: Mon, 10 Jan 2011 21:29:51 -0000
X-Groupsio-MsgNum: 27882
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms070301090905090405010003"

--------------ms070301090905090405010003
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 10.01.2011 15:45, schrieb Paul Menzel:
> Maybe you want to look deeper into the history of that file.  Sorry.
> It looks Dirk committed these lines when adding 1.10 in commit b823b4
> [1].
>
> Dirk, could you please comment on [2].
>

No idea why this was needed in the old version.
Looks fine to me.

Acked-by: Dirk Opfer <dirk@do13.de>

Thanks,

Dirk


--------------ms070301090905090405010003
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIILSTCCBTkw
ggMhoAMCAQICAwClnzANBgkqhkiG9w0BAQUFADBUMRQwEgYDVQQKEwtDQWNlcnQgSW5jLjEeMBwG
A1UECxMVaHR0cDovL3d3dy5DQWNlcnQub3JnMRwwGgYDVQQDExNDQWNlcnQgQ2xhc3MgMyBSb290
MB4XDTEwMDQxMjIwMjgzMFoXDTEyMDQxMTIwMjgzMFowVzETMBEGA1UEAxMKRGlyayBPcGZlcjEj
MCEGCSqGSIb3DQEJARYUZGlya0BvcGZlci1vbmxpbmUuZGUxGzAZBgkqhkiG9w0BCQEWDGRpcmtA
ZG8xMy5kZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMRLmuBr8c1wXFOFT8dDu/Wh
ROqpByuNl7CUkliQ5jgakSu5W55Fm2jy4mT+wfacBaBuAtB4JBP2eP96SaMXSyyWt0GGedIzoYQ8
rt2CcrPj+7RFob4s7v9xnpe9WYBUOigwkcQsDinfgJ/GUwMnghOjOunLqx59vgjfaNeZwRMuM/M0
tKwiIxTfpYBz4oDGsDMo3LVZR+Bf1/MMNZsWblYU8BPAD2AH7bRjW6liz4+yyReKNSfG+DL3b2jk
kHVGcz6qie8OLnOIjMqWanrDELrEHDBXOWG5uPq4MyYvgfqX7c+aiwLINIXgelS+qcyWw7TYagC/
PKP6EoAGaULulfMCAwEAAaOCAQ8wggELMAwGA1UdEwEB/wQCMAAwVgYJYIZIAYb4QgENBEkWR1Rv
IGdldCB5b3VyIG93biBjZXJ0aWZpY2F0ZSBmb3IgRlJFRSBoZWFkIG92ZXIgdG8gaHR0cDovL3d3
dy5DQWNlcnQub3JnMEAGA1UdJQQ5MDcGCCsGAQUFBwMEBggrBgEFBQcDAgYKKwYBBAGCNwoDBAYK
KwYBBAGCNwoDAwYJYIZIAYb4QgQBMDIGCCsGAQUFBwEBBCYwJDAiBggrBgEFBQcwAYYWaHR0cDov
L29jc3AuY2FjZXJ0Lm9yZzAtBgNVHREEJjAkgRRkaXJrQG9wZmVyLW9ubGluZS5kZYEMZGlya0Bk
bzEzLmRlMA0GCSqGSIb3DQEBBQUAA4ICAQA7tatU31DAl9C1K/daJNJZ9LcdABxsNHmnbWb3zkrT
+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

--------------ms070301090905090405010003--
