Received: from [212.247.155.33] (helo=swip.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <ulf@atmel.com>) id 1Hq1H6-0001kt-93
	for openembedded-devel@openembedded.org; Mon, 21 May 2007 08:21:47 +0200
X-Cloudmark-Score: 0.000000 []
Received: from [81.233.24.250] (account mz80686@tele2.se HELO aeglos)
	by mailfe10.swip.net (CommuniGate Pro SMTP 5.1.7)
	with ESMTPA id 325584277 for openembedded-devel@openembedded.org;
	Mon, 21 May 2007 08:20:58 +0200
Message-ID: <005201c79b6f$56130270$0302a8c0@atmel.com>
From: "Ulf Samuelsson" <ulf@atmel.com>
To: <openembedded-devel@openembedded.org>
References: <00b801c79fd9$ee494f90$0302a8c0@atmel.com>
	<4650C225.9010907@dominion.kabel.utwente.nl>
Date: Mon, 21 May 2007 08:14:43 +0200
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3028
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
Subject: Re: OpenEmbedded insist on downloading existing package
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
X-List-Received-Date: Mon, 21 May 2007 06:21:51 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Ulf Samuelsson schreef:
>> I have defined the download location to and
>> I have linux-2.6.21.1.tar.bz2 in this directory.
>=20
> is linux-2.6.21.1.tar.bz2.md5 present there?
>=20
>> OpenEmbedded seems to ignore this and insists on *downloading*
>> linux-2.6.21.1.tar.bz2 before use.
>=20
> if the md5 stamp isn't present it will try to download it again till =
the downloads
> completes and linux-2.6.21.1.tar.bz2.md5 has been created.
>=20


Thanks, I will try this...

Best Regards
Ulf Samuelsson



