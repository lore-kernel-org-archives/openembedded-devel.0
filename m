Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OYDiM-0007tD-6C for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 09:46:11 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 12 Jul 2010 09:31:29 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Mon, 12 Jul 2010 09:41:04 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 12 Jul 2010 09:41:04 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 12 Jul 2010 09:41:02 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819E6A@deimsg40.de.net.world>
In-Reply-To: <201007120932.46708.roman@khimov.ru>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH] busybox: add suport for FEATURE_INDIVIDUAL setup
Thread-Index: Acshg/SyBhyzFdvJRyO/OcjBfAOSPAAEYBoQ
References: <201007071352.09254.khimov@altell.ru><1278499134-24718-1-git-send-email-khimov@altell.ru>
	<201007120932.46708.roman@khimov.ru>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 12 Jul 2010 07:41:04.0160 (UTC)
	FILETIME=[94DDD200:01CB2195]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: add suport for FEATURE_INDIVIDUAL setup
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
X-List-Received-Date: Mon, 12 Jul 2010 07:46:11 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: quoted-printable

For me the patch works.=20

Wolfgang Hauser

-----Urspr=A8=B9ngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Roman I Khimov
Gesendet: Montag, 12. Juli 2010 07:33
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] [PATCH] busybox: add suport for FEATURE_INDIVIDUAL =
setup

=A7=A3 =A7=E3=A7=E0=A7=E0=A7=D2=A7=EB=A7=D6=A7=DF=A7=DA=A7=DA =
=A7=E0=A7=E4 =A7=B3=A7=E2=A7=D6=A7=D5=A7=D1 07 =A7=DA=A7=F0=A7=DD=A7=F1 =
2010 14:38:54 =A7=D1=A7=D3=A7=E4=A7=E0=A7=E2 Roman I Khimov =
=A7=DF=A7=D1=A7=E1=A7=DA=A7=E3=A7=D1=A7=DD:
> Where each applet is installed as a tiny binary linked against shared
> libbusybox.
>=20
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
>  recipes/busybox/busybox.inc |   74
>  ++++++++++++++++++++++++++++++++++++------- 1 files changed, 62
>  insertions(+), 12 deletions(-)
>=20

OK for .dev?

--=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3


