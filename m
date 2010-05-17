Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OE4rv-0007gC-7C
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 20:16:48 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OE4o2-0004sc-PS from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 11:12:46 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 17 May 2010 11:12:46 -0700
Received: from 172.30.80.86 ([172.30.80.86]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon, 17 May 2010 18:12:45 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	17 May 2010 11:12:42 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimXPVpXkm-vJbKvsYim3zM_ckn6XEH_XtS_pDot@mail.gmail.com>
References: <hsql3t$o5c$1@dough.gmane.org> <20100517055550.GA6686@gmail.com>
	<hsr2pr$4vp$1@dough.gmane.org>
	<AANLkTin6PIr6ZgeYS6rB9IGK83vQH9Tn9xreVOwOAt0M@mail.gmail.com>
	<hsrsq8$d0r$1@dough.gmane.org>
	<AANLkTimXPVpXkm-vJbKvsYim3zM_ckn6XEH_XtS_pDot@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Mon, 17 May 2010 11:12:42 -0700
Message-ID: <1274119962.25944.147.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 17 May 2010 18:12:46.0378 (UTC)
	FILETIME=[8D3750A0:01CAF5EC]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question: is 'gcc' supposed to replace the libstdc++.la installed by 'gcc-cross'?
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
X-List-Received-Date: Mon, 17 May 2010 18:16:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-05-17 at 10:45 -0700, Khem Raj wrote:=20
> On Mon, May 17, 2010 at 10:02 AM, Koen Kooi <k.kooi@student.utwente.nl> w=
rote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 17-05-10 18:49, Khem Raj wrote:
> >> On Mon, May 17, 2010 at 2:38 AM, Koen Kooi <k.kooi@student.utwente.nl>=
 wrote:
> >
> >> I could not build a console-image as I ran out of disk space. Have you
> >> considered removing
> >> -g3 from default angstrom builds.
>=20
> what is -g3 offering over -g at -O2 and how good the additional debug inf=
o is ?

-g3 offers lots of stuff, spelled out in some doc or another is macro
expansion, for example.  I don't know if it offers enough stuff that you
say don't need the sources themselves around still too tho.  Koen?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


