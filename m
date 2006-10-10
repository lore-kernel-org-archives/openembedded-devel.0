Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <openembedded@hrw.one.pl>) id 1GXJih-0007Jc-DY
	for openembedded-devel@openembedded.org; Tue, 10 Oct 2006 17:40:39 +0200
Received: (qmail 11568 invoked by uid 813007); 10 Oct 2006 15:34:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 10 Oct 2006 15:34:28 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Oct 2006 17:34:27 +0200
User-Agent: KMail/1.9.4
References: <45296EB8.7070704@dominion.kabel.utwente.nl>
	<1160382102.5741.19.camel@localhost.localdomain>
In-Reply-To: <1160382102.5741.19.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200610101734.27265.openembedded@hrw.one.pl>
Subject: Re: [RFC] Removing MAINTAINER field from recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2006 15:40:40 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 9 pa=C5=BAdziernika 2006 10:21, Richard Purdie napi=
sa=C5=82:
> What is missing here is the proposed alternative. The idea we discussed
> was having a Maintainers file, similar in spirit to that in the Linux
> kernel where people can detail areas they're interested in and give some
> kind of indication of the type of support they want to give.

My suggestion:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
OpenEmbedded Maintainers List=20

Please put you full name and email-address here for the areas of OE you=20
want to support.

Note: For the hard of thinking, this list is meant to remain in=20
alphabetical order. If you could add yourselves to it in alphabetical=20
order that would be so much easier.

Person:     Real name
Mail:       Mail patches to
Website:    Web-page
Distros:    Maintained distros
Machines:   Maintained machines
Recipes:    Maintained recipes (subsystems first, then single ones)

=2D------------------------------------------------------------------------=
=2D---

Person:     Koen Kooi=20
Mail:       koen@openembedded.org
Website:    http://dominion.kabel.utwente.nl/koen/cms
Machines:   h2200, ipaq-pxa270, efika, ep93xx, netbook-pro
Distros:    Angstr=C3=B6m
Recipes:    OpenSync,, GNOME, GPE, Matchbox
Recipes:    abiword, bootchart, dia, farsight, freeciv, fuse, galago, geda,
Recipes:    gimp, gnumeric, (g)obby, imposter, inkscape
Recipes:    telepathy, tilibs, xchat, xournal.=20

Person:     Marcin Juszkiewicz
Mail:       hrw@openembedded.org
Website:    http://www.hrw.one.pl/
Machines:   collie, spitz
Distros:    OpenZaurus
Recipes:    OPIE, HostAP, Orinoco, WPA-Supplicant, Wireless tools, Keymaps
Recipes:    OpenZaurus 2.6 kernels, Qtopia fonts, DejaVu fonts, Native SDK
Recipes:    kdepimpi, subapplet, corsair, gammu, iqnotes, zbedic
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer

            That must be wonderful! I don understand it at all.




