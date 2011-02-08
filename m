Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1PmqT8-0004zb-Nc
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 17:31:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 853A62C81A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Feb 2011 16:29:35 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHKZk1rXoXvB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Feb 2011 16:29:31 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 0EF7E2C7D7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Feb 2011 16:29:30 +0000 (UTC)
Message-ID: <4D516F8B.4090703@gmail.com>
Date: Tue, 08 Feb 2011 17:30:03 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D51566B.9060603@mentor.com>
In-Reply-To: <4D51566B.9060603@mentor.com>
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Tue, 08 Feb 2011 16:31:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Tom Rini ha scritto, Il 08/02/2011 15:42:
> Hey all,
>=20
> As March is fast approaching I want to gather the list of DISTRO /
> MACHINE / BBPKGS targets that the various distributions would like to
> see at least compile tested (volunteers for HW testing welcome!). Today=
,
> I have the following setup to be built:
>=20
> minimal / minimal-uclibc:
> qemux86/ppc/arm/mips/mips64/sh4/mipsel, mpc8315e-rdb, p2020ds, p2020rdb
> +
> nas-server-image/native-sdk-image/console-image/minimal-image/x11-image=
/meta-toolchain/qt4-x11-demo-image/qt4e-demo-image
>=20
>=20
> angstrom-2008.1 / angstrom-2010.x:
> hawkboard, mini2440, mini6410, beagleboard + console-image /
> qt4-x11-demo-image / qt4e-demo-image
>=20
> slugos / ucslug:
> nslu2be/le + slugos-image
>=20
> I'm building all of these for 32bit Ubuntu 8.04, RHEL5 and will be
> adding Ubuntu 10.04 for the next run.  What more do people want added?
> I'm looking to fill this matrix out to something that runs "over the
> weekend" and I've still got plenty of room to spare (which is why I've
> bcc'd everyone in the MAINTAINERS file with a Distro by their name).
>=20
> And of course if you wish to handle building what you care about
> yourself instead, that's great!  Please just take this as a gentle
> reminder that there's a release coming up so it's time to crank the
> builders up and make sure your stuff is working.
>=20

Tom,
I periodically test the following with Debian Lenny 5.0 x86_64, but I'd
like to see them in your list too.

DISTRO: kaeilos
MACHINE : ronetix-pm9263/at91sam9263ek
IMAGE: minimal-image/x11-image/meta-toolchain/qt4e-demo-image

Thank you


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



