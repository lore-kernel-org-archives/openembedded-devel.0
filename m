Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UJs4D-0003uj-4p
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Mar 2013 22:03:05 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 7397BEA040;
	Sun, 24 Mar 2013 21:57:54 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id CEE1E61ACE; Sun, 24 Mar 2013 21:46:03 +0100 (CET)
Date: Sun, 24 Mar 2013 21:46:03 +0100
From: Apelete Seketeli <apelete@seketeli.net>
To: Tom Rini <tom.rini@gmail.com>
Message-ID: <20130324204603.GC6454@hermes>
References: <cover.1363255209.git.apelete@seketeli.net>
	<20130322221414.GB6454@hermes> <20130324132149.GA9388@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20130324132149.GA9388@bill-the-cat>
X-Operating-System: Debian GNU/Linux 7.0
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance][PATCH v5 0/2] Pull request 20130314
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
X-List-Received-Date: Sun, 24 Mar 2013 21:03:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 24-Mar-13, Tom Rini a =E9crit:
> On Fri, Mar 22, 2013 at 11:14:14PM +0100, Apelete Seketeli wrote:
> > Hi Tom,
> >=20
> > Le 14-Mar-13, Apelete Seketeli a ?crit:
> > > Hello,
> > >=20
> > > The patches that come as a follow-up of this message fix an issue
> > > found while building muffinman-image on top of the 2011.03-maintena=
nce
> > > branch, and also build a ubi image for the ben-nanonote machine.
> > > This work is intended to be used as a basis for porting the JLime
> > > distribution to oe-core.
> > >=20
> > > These modifications were tested by successfully building
> > > muffinman-image from scratch on a Debian Wheezy host.
> > > Please pull into 2011.03-maintenance branch.
> > >=20
> > > The following changes since commit ff679935b073a89c4e407d259bcc2eea=
9148fb91:
> > >=20
> > >   opkg-utils: bump SRCREV to latest (2012-10-26 11:11:59 +0200)
> > >=20
> > > are available in the git repository at:
> > >=20
> > >   git://seketeli.fr/~apelete/oe.git muffinman-image-fix
> > >=20
> > > Apelete Seketeli (2):
> > >   gnutls: update SRC_URI
> > >   jlime-2010.1: build ubi image for ben-nanonote machine
> > >=20
> > >  conf/bitbake.conf              |    2 +-
> > >  conf/distro/jlime-2010.1.conf  |    3 ++-
> > >  conf/machine/ben-nanonote.conf |   12 ++++++++++++
> > >  recipes/gnutls/gnutls.inc      |    3 ++-
> > >  4 files changed, 17 insertions(+), 3 deletions(-)
> >=20
> > It's been a week and no more reviews, could you please take a look at
> > it and see if it's good to be pulled ?
>=20
> Applied to 2011.03-maintenance, thanks for your patience!

Thanks for applying it, and thanks to everyone who helped me fix the
patches.

Cheers.
--=20
        Apelete


