Received: from [212.247.154.65] (helo=swip.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <ulf@atmel.com>) id 1HqLxZ-00036K-CI
	for openembedded-devel@openembedded.org; Tue, 22 May 2007 06:26:57 +0200
X-Cloudmark-Score: 0.000000 []
Received: from [87.54.0.50] (account mz80686@tele2.se HELO aeglos)
	by mailfe03.swip.net (CommuniGate Pro SMTP 5.1.7)
	with ESMTPA id 503262735 for openembedded-devel@openembedded.org;
	Tue, 22 May 2007 06:26:02 +0200
Message-ID: <003a01c79c29$1985a690$26031a0a@atmel.com>
From: "Ulf Samuelsson" <ulf@atmel.com>
To: <openembedded-devel@openembedded.org>
References: <4651EFEE.50907@atmel.com>
	<189F751D-9A54-4A17-84FD-82CD2BF62403@gmx.net>
Date: Tue, 22 May 2007 06:24:27 +0200
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3028
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
Subject: Re: ERROR: Task 2246 ( ...org.openembedded.dev/packages/gnome/gnome-desktop_2.16.1.bb, do_compile) failed
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
X-List-Received-Date: Tue, 22 May 2007 04:26:57 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>=20
> Am 21.05.2007 um 21:15 schrieb Ulf Samuelsson:
>=20
>> Looks like there is an issue with the fdl.xml in this package?
>> Any workarounds?
>=20
> Did you lack internet connectivity during the build?
>=20


I have been trying to build this for a couple of days,
and sometimes the connections has been bad.


Been trying to fetch all packages in advance by=20

$ bitbake -c fetch gpe-image

but that does not work.


Best Regards
Ulf Samuelsson



