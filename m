Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NBUvQ-0007rR-Vw
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 15:57:32 +0100
Received: from [192.168.1.150] (e180135046.adsl.alicedsl.de [85.180.135.46])
	by drlauer-research.com (Postfix) with ESMTP id 898A258410F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 16:42:46 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <he6a5m$jph$1@ger.gmane.org>
References: <he689r$c57$1@ger.gmane.org> <4B06A6A7.1080204@SSpaeth.de>
	<200911201531.00181.marcin@juszkiewicz.com.pl>
	<1258727981.13348.7.camel@opal>  <he6a5m$jph$1@ger.gmane.org>
Organization: Vanille-Media
Date: Fri, 20 Nov 2009 15:56:04 +0100
Message-ID: <1258728964.13348.12.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: MACHINE_FEATURE changes
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
X-List-Received-Date: Fri, 20 Nov 2009 14:57:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 20.11.2009, 15:47 +0100 schrieb Koen Kooi:
> On 20-11-09 15:39, Michael 'Mickey' Lauer wrote:
> > Am Freitag, den 20.11.2009, 15:30 +0100 schrieb Marcin Juszkiewicz:
> >> Dnia pi=C4=85tek, 20 listopada 2009 o 15:24:39 Sebastian Spaeth napi=
sa=C5=82(a):
> >>
> >>> Better suggestions on how to achieve this are welcome.
> >>
> >> In distro config:
> >>
> >> MACHINE_FEATURES_om-gta01 =3D "this that those butnoapm"
> >>
> >> This way your distro has what you want and others have what was set =
in machine
> >> config.
> >
> > Good idea.
> >
> > For the records though, I would consider it being the machine
> > maintainer's call to define the machine config. If he decides that ap=
m
> > is very misleading on said machine, perhaps because without taking
> > special care about the peripheral devices there will no be proper
> > suspend in the first place, then I might be inclined to follow this
> > reasoning and leave apm out there...
>=20
> If that's the case, it should be at least noted in the commit message=20
> clearly. In this case it was a commit from someone very new to OE and i=
t=20
> didn't include any explanation or SOBs or ACKs.

True.

Since according to the MAINTAINERS file I seem to be the maintainer of
this machine I think i will reserve my right to change it then. Distros
which absolutely want apm on those Openmoko devices can still include
it.


> Since this is about the machine the is the default in our GettingStarte=
d=20
> wiki, a mail to this list would have been nice as well, if only to=20
> increase the google juice :)

Heh, right.

:M:




