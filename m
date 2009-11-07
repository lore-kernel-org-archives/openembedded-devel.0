Received: from [212.18.0.10] (helo=mail-out.m-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1N6oLU-0002HR-6P
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 17:41:03 +0100
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id 5FA511C0009F;
	Sat,  7 Nov 2009 17:30:13 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id D2F4A90247;
	Sat,  7 Nov 2009 17:30:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan1.mnet-online.de [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id aGY1ERL0XEKO; Sat,  7 Nov 2009 17:30:13 +0100 (CET)
Received: from mrdenker.localdomain (ppp-88-217-30-114.dynamic.mnet-online.de
	[88.217.30.114])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTP;
	Sat,  7 Nov 2009 17:30:13 +0100 (CET)
From: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 7 Nov 2009 17:30:08 +0100
User-Agent: KMail/1.12.1 (Linux/2.6.30.8-64.fc11.x86_64; KDE/4.3.1; x86_64; ; )
References: <200910222339.32881.david.lanzendoerfer@o2s.ch>
	<200911052309.39050.marcin@juszkiewicz.com.pl>
	<1257460931.4676.9.camel@andromeda>
In-Reply-To: <1257460931.4676.9.camel@andromeda>
MIME-Version: 1.0
Message-Id: <200911071730.09092.mok@mnet-online.de>
X-SA-Exim-Connect-IP: 212.18.0.10
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: Re: Patches
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
X-List-Received-Date: Sat, 07 Nov 2009 16:41:03 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag 05 November 2009 23:42:11 schrieb Michael 'Mickey' Lauer:
> Am Donnerstag, den 05.11.2009, 23:09 +0100 schrieb Marcin Juszkiewicz:
> > Dnia czwartek, 5 listopada 2009 o 22:33:31 Koen Kooi napisa=C5=82(a):
> > > No, if your machine requires a special format you should use +=3D, th=
at
> > > way you get the stuff in local.conf and the thing the machine require=
s.
> >
> > Exactly - I am tired of builds which ends only in jffs2 when I want to
> > check rootfs contents after doing multimachine nightly build.
>=20
> Right. +=3D sounds good.
>=20
hmm, what does this mean for om-gta01/2 for example? I just applied a patch=
=20
that changes that +=3D into the weak ?=3D ...

As for the openmoko phones you can either use a tar.gz for booting from SD =
or=20
jffs2 to boot from flash. But I might just want to build one of those?

Thanks
=2D-=20

Klaus 'mrmoku' Kurzmann


