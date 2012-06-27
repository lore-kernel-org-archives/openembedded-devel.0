Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SjvOQ-0006ru-Pr
	for openembedded-devel@openembedded.org; Wed, 27 Jun 2012 18:47:02 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 1F501EA040;
	Wed, 27 Jun 2012 18:42:52 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id ACB01604DE; Wed, 27 Jun 2012 18:36:09 +0200 (CEST)
Date: Wed, 27 Jun 2012 18:36:09 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120627163609.GD25892@hermes>
References: <20120623191635.GN4845@hermes>
MIME-Version: 1.0
In-Reply-To: <20120623191635.GN4845@hermes>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [oe-classic][udev][PATCH 0/5] update recipe SRC_URI
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
X-List-Received-Date: Wed, 27 Jun 2012 16:47:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Le 23-Jun-12, Apelete Seketeli a =E9crit:
>=20
> Some of the udev source tarballs are no longer available on the
> kernel.org repository. As a consequence, the corresponding recipes in
> oe classic fail to build. I found a mirror where these source tarballs
> are still available, and updated the recipes in oe classic
> accordingly.
>=20
> The five patches that come as a follow-up of this message are what
> it's all about.
>=20
> Apelete Seketeli (5):
>   udev: update SRC_URI of udev-151 recipe
>   udev: update SRC_URI of udev-154 recipe
>   udev: update SRC_URI of udev-162 recipe
>   udev: update SRC_URI of udev-165 recipe
>   udev: update SRC_URI of udev-168 recipe
>=20
>  recipes/udev/udev_151.bb |    2 +-
>  recipes/udev/udev_154.bb |    2 +-
>  recipes/udev/udev_162.bb |    2 +-
>  recipes/udev/udev_165.bb |    2 +-
>  recipes/udev/udev_168.bb |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> --=20
> 1.7.10

I need the five patches for udev found in this thread in order to
build muffinman-image in oe-classic (it does not build anymore in its
current state). Can someone please review those patches ?

Cheers.
--=20
        Apelete


