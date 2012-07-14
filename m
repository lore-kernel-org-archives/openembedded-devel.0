Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sq0RM-0003dG-Qt
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jul 2012 13:23:12 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 8DDC7EA04B;
	Sat, 14 Jul 2012 13:16:31 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 0E47D60297; Sat, 14 Jul 2012 13:11:53 +0200 (CEST)
Date: Sat, 14 Jul 2012 13:11:53 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120714111153.GG6220@hermes>
References: <1342120276-15557-1-git-send-email-apelete@seketeli.net>
	<CAMKF1srhMSq0OZ097zO4nWQ1QYWovDQ6O_10y35T4UA4wycg5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srhMSq0OZ097zO4nWQ1QYWovDQ6O_10y35T4UA4wycg5Q@mail.gmail.com>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [oe-classic][PATCH 0/2] tzcode/tzdata: update SRC_URI
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
X-List-Received-Date: Sat, 14 Jul 2012 11:23:13 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 12-Jul-12, Khem Raj a =E9crit:
> On Thu, Jul 12, 2012 at 12:11 PM, Apelete Seketeli <apelete@seketeli.ne=
t> wrote:
> > Hello,
> >
> > The official repository of the time zone database was shut down on
> > 2011-10-06, so the corresponding recipes needed to be updated to fetc=
h
> > the time zone source packages from alternative mirrors.
> >
> > The two patches that come as follow up of this message is what it's
> > all about.
>=20
> please add [maintenance-2011.03] to subject and rebase the patches of
> the same branch in order for them to show up in maintainers sandbox
>=20
> >
> > Apelete Seketeli (2):
> >   tzcode: update SRC_URI
> >   tzdata: update SRC_URI
> >
> >  recipes/tzcode/tzcode-native.inc |    4 ++--
> >  recipes/tzdata/tzdata.inc        |    2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > --
> > 1.7.10.4

I'm trying to fix muffinman-image to make it build on
2011.03-maintenance (I've been trying this on master until now). I'm
planning to request a pull of all the changes I am currently
submitting for review once it's done.
Hoping this is not a bad way of proceeding.

Cheers.
--=20
        Apelete


