Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UNTIV-0004bQ-TT
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 21:24:39 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 204E7EA040;
	Wed,  3 Apr 2013 21:16:27 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 5112F6047C; Wed,  3 Apr 2013 21:07:29 +0200 (CEST)
Date: Wed, 3 Apr 2013 21:07:29 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130403190728.GA5202@hermes>
References: <cover.1364806552.git.apelete@seketeli.net>
	<1596531.UkNzIxF3VC@helios>
MIME-Version: 1.0
In-Reply-To: <1596531.UkNzIxF3VC@helios>
X-Operating-System: Debian GNU/Linux 7.0
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 0/2] Pull request 20130401
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
X-List-Received-Date: Wed, 03 Apr 2013 19:24:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 03-Apr-13, Paul Eggleton a =E9crit:
> On Monday 01 April 2013 11:13:24 Apelete Seketeli wrote:
> > The patches that come as a follow-up of this message add machine
> > support for Qi-Hardware's Ben Nanonote handheld.
> > The recipes were imported from "oe-classic" and fixed to comply to th=
e
> > rules in oe-core. This work is intended to be used by the JLime
> > distribution which is being ported to oe-core.
> >=20
> > The modifications are done on top of the master branch in the
> > meta-handheld layer.
> > Please pull into the meta-handheld layer.
> >=20
> > The following changes since commit a268810f7c2c1f13e01cc02bcddc23c461=
18551d:
> >=20
> >   linux-yocto-tiny-kexecboot: add patch fixing mtd on SL-C3200 (2013-=
03-20
> > 09:23:00 +0000)
> >=20
> > are available in the git repository at:
> >=20
> >   git://seketeli.fr/~apelete/meta-handheld.git add-nanonote
> >=20
> > Apelete Seketeli (2):
> >   ben-nanonote: import ben-nanonote machine support
> >   ben-nanonote: clean machine conf according to oe-core rules
>=20
> Merged these two squashed into commit (as discussed on IRC) - thanks!
>=20
> FYI you may be able to consider a switch away from kdrive since xorg is=
 a lot=20
> slimmer these days and is actually maintained, but I'll leave that up t=
o you.

Thanks for the merge, I will consider xorg when the time comes (still
got a lot of work before getting JLime to build on oe-core).

Cheers.
--=20
        Apelete


