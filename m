Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UJAUO-00040i-7o
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 23:31:22 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id D5D7BEA040;
	Fri, 22 Mar 2013 23:26:37 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id 0A87D61ACE; Fri, 22 Mar 2013 23:14:14 +0100 (CET)
Date: Fri, 22 Mar 2013 23:14:14 +0100
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322221414.GB6454@hermes>
References: <cover.1363255209.git.apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <cover.1363255209.git.apelete@seketeli.net>
X-Operating-System: Debian GNU/Linux 7.0
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Fri, 22 Mar 2013 22:31:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tom,

Le 14-Mar-13, Apelete Seketeli a =E9crit:
> Hello,
>=20
> The patches that come as a follow-up of this message fix an issue
> found while building muffinman-image on top of the 2011.03-maintenance
> branch, and also build a ubi image for the ben-nanonote machine.
> This work is intended to be used as a basis for porting the JLime
> distribution to oe-core.
>=20
> These modifications were tested by successfully building
> muffinman-image from scratch on a Debian Wheezy host.
> Please pull into 2011.03-maintenance branch.
>=20
> The following changes since commit ff679935b073a89c4e407d259bcc2eea9148=
fb91:
>=20
>   opkg-utils: bump SRCREV to latest (2012-10-26 11:11:59 +0200)
>=20
> are available in the git repository at:
>=20
>   git://seketeli.fr/~apelete/oe.git muffinman-image-fix
>=20
> Apelete Seketeli (2):
>   gnutls: update SRC_URI
>   jlime-2010.1: build ubi image for ben-nanonote machine
>=20
>  conf/bitbake.conf              |    2 +-
>  conf/distro/jlime-2010.1.conf  |    3 ++-
>  conf/machine/ben-nanonote.conf |   12 ++++++++++++
>  recipes/gnutls/gnutls.inc      |    3 ++-
>  4 files changed, 17 insertions(+), 3 deletions(-)

It's been a week and no more reviews, could you please take a look at
it and see if it's good to be pulled ?

Cheers.
--=20
        Apelete


