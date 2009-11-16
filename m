Received: from [209.85.216.183] (helo=mail-px0-f183.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john3909@gmail.com>) id 1N9pPb-0006HI-UM
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 01:25:47 +0100
Received: by pxi13 with SMTP id 13so994009pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2009 16:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:reply-to:from:to:references
	:in-reply-to:subject:date:organization:message-id:mime-version
	:content-type:content-transfer-encoding:x-mailer:thread-index
	:content-language;
	bh=h1qdYxA8HGOyva6/WJEemf0IdtqYgnKHSz2rn3Xp9h4=;
	b=ClikgJJnB5Ef/hNiLyShF5pv//Qlvmzosw+bJ4XY+bRydELOEGTaiU7fhKddpfLMQ9
	ptYd2mGIgbTENunS2gMIYCYpozA816igROl4cxrUDoddF6B0ytgg83UN1iRqnO/LOnvk
	se4FWtm1Nxt4KOo7CGBXdgWMT33lDtC67nIBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=reply-to:from:to:references:in-reply-to:subject:date:organization
	:message-id:mime-version:content-type:content-transfer-encoding
	:x-mailer:thread-index:content-language;
	b=l6Nd82lhelqcyOVqSlZgkUiZyirBw+tYP/Gk/GqdkLnzLd0Ky+z9i4bvz5JwRPbDP8
	gbApIFMvCM7Fdl1Qal3nSjCQChRV1tUoAHzWchXeMU6zuHeWNRf16vUbYJKbV//VTxHg
	6IYM8EBZXlcIvWD7rCfvGxmmlKbCUqNbD3oVs=
Received: by 10.115.151.5 with SMTP id d5mr5731498wao.204.1258331061493;
	Sun, 15 Nov 2009 16:24:21 -0800 (PST)
Received: from inspiron9400 (99-26-125-126.lightspeed.sndgca.sbcglobal.net
	[99.26.125.126])
	by mx.google.com with ESMTPS id 22sm3834935pxi.2.2009.11.15.16.24.19
	(version=SSLv3 cipher=RC4-MD5); Sun, 15 Nov 2009 16:24:20 -0800 (PST)
From: "John \(GMail\)" <john3909@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
References: <alpine.LFD.2.00.0911150948430.14311@localhost>
	<200911160100.38336.marcin@juszkiewicz.com.pl>
In-Reply-To: <200911160100.38336.marcin@juszkiewicz.com.pl>
Date: Sun, 15 Nov 2009 16:24:18 -0800
Organization: U.S. Power, Inc
Message-ID: <008e01ca6653$24000420$6c000c60$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcpmUfAYP571mADEQXyqP/0YmDe3KQAAEu9g
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: john3909@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: any ETA on a working dev beagleboard demo image?
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
X-List-Received-Date: Mon, 16 Nov 2009 00:25:47 -0000
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf =
Of
> Marcin Juszkiewicz
> Sent: Sunday, November 15, 2009 4:01 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] any ETA on a working dev beagleboard demo image?
>=20
> Dnia niedziela, 15 listopada 2009 o 15:56:36 Robert P. J. Day =
napisa=C5=82(a):
>=20
> >   yes, i know i'm sounding like a broken record, but i have an =
invite
> > to give a short local demo of the beagleboard this tuesday and i'd
> > like to do it with an angstrom development demo image, just because =
i
> > prefer to live out there on the edge.
>=20
> You can always move back to some revision before recent changes =
happened,
> you
> can use Angstrom narcissus to generate working image.
I can confirm that beagleboard-demo-image builds successfully on both =
the DEV and the Stable branches using Ubuntu 9.10 x64. My last build was =
based on SHA1 ID: 916ed3c
>=20
> >   at the moment, there is just the one package standing in the way =
--
> > guile-native -- and as i recall, someone posted what looked like a
> > manual fix.  is that being turned into a patch at any point?
>=20
> Did you tried to make it a patch? Patches are always welcome.
>=20
> > i realize i'm nagging, but it's literally been *weeks* since that
> > particular bitbake target actually built, and every time it looks =
like
> > it's getting close to being buildable, more packages break.
>=20
> Maybe start tagging your copy of OE to know which version was =
buildable for
> you? It will make life easier to make 'git bisect' to find out what =
broke it.
>=20
> > i appreciate that development means exactly that but, at the very
> > least, even the development branch should *build*, even if there are
> > run issues.
>=20
> No, it is not 'org.openembedded.always-building' branch. This is =
development
> branch where everything can happen. At OEDEM it was decided that many =
core
> changes will be made and we accepted some breakage during that time. =
We are
> working on making it buildable again but testing takes time.
>=20
> > p.s.  perhaps it would be useful to start tagging the development
> > branch at points where it builds, just so someone can always retreat
> > to the most recent known good build.
>=20
> "where it builds" is not a definition. For me one revision builds for
> at91sam9263ek/x11-image target but not for progear/xfce-image for =
example. Or
> build on my Debian system but breaks in Ubuntu 9.04 virtual. There is =
no such
> thing as 'it builds for everyone' and you should know that from your =
xterm-207
> problem which was not a problem for me (as it was building under my =
Debian and
> I do not have a client who would use Fedora for builds).
>=20
> > or perhaps start a branch named, oh, "bleeding", which, when it =
builds
> > properly, can be merged back into development.  whatever.  but it
> > strikes me that it's overwhelmingly pointless to have a development
> > branch that doesn't build since that gives no one the opportunity to
> > actually test it.
>=20
> There is a tag on .dev branch which marks moment before OE core =
changes
> landed: "pre-nov2009-core-updates" - maybe checkout that version and =
just
> cherry-pick those updates which are needed to make OE buildable for =
you?
>=20
> Regards,
> --
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



