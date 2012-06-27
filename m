Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SjvSU-0000jN-Kc
	for openembedded-devel@openembedded.org; Wed, 27 Jun 2012 18:51:14 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id E4E29EA040;
	Wed, 27 Jun 2012 18:47:03 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 72245604DE; Wed, 27 Jun 2012 18:40:21 +0200 (CEST)
Date: Wed, 27 Jun 2012 18:40:21 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120627164021.GF25892@hermes>
References: <1340546103-17137-1-git-send-email-apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <1340546103-17137-1-git-send-email-apelete@seketeli.net>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [oe-classic][PATCH 0/1] base-passwd: update recipe SRC_URI
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
X-List-Received-Date: Wed, 27 Jun 2012 16:51:14 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Le 24-Jun-12, Apelete Seketeli a =E9crit:
>=20
> The base-passwd-3.5.20.bb SRC_URI was defined as a link relative to
> the ${DEBIAN_MIRROR} variable. The resolution of the corresponding
> absolute link leaded to the index page of snapshot.debian.org.
>=20
> The patch that come as a follow-up of this message updates the SRC_URI
> to fix this issue. It is targeting oe-classic.
>=20
> Apelete Seketeli (1):
>   base-passwd: update SRC_URI of base-passwd-3.5.20 recipe
>=20
>  recipes/base-passwd/base-passwd_3.5.20.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --=20
> 1.7.10

I need the patch for base-passwd_3.5.20 found in this thread in order
to build muffinman-image in oe-classic (it does not build anymore in
its current state). Can someone please review those patches ?

Cheers.
--=20
        Apelete


