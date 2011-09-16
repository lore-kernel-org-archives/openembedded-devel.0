Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4U2c-0000Yc-2y
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 10:44:58 +0200
Received: by bke11 with SMTP id 11so4790268bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 01:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zsikANdSwo1iVlj630VzWGEZi0M71bO87uC79L+Y8tU=;
	b=OA08UBOupjkVIs4mZke6dr60cew/0yO/0ZBKKdHPYIpFF8wH5YDHD29eb/xdZorpFF
	9TthNQCkXhdv0Y3UTwOroX22qWkwigFN7hJIRVArbuJqIQ9yD5aVFpTQoQZsvxgWDCve
	Pxp54gtObmNF9UnIoSl1Ud7MhtCcNIazYnwcw=
Received: by 10.204.131.219 with SMTP id y27mr1387903bks.115.1316162384437;
	Fri, 16 Sep 2011 01:39:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm5647765bkn.7.2011.09.16.01.39.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 01:39:43 -0700 (PDT)
Date: Fri, 16 Sep 2011 10:39:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110916083935.GF7445@jama.jama.net>
References: <cover.1316156746.git.Martin.Jansa@gmail.com>
	<j4v0ug$ojv$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j4v0ug$ojv$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][PATCH 0/4] Pull request #12
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
X-List-Received-Date: Fri, 16 Sep 2011 08:44:58 -0000
X-Groupsio-MsgNum: 34288
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline

--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 10:21:36AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 16-09-11 09:08, Martin Jansa schreef:
> > The following changes since commit
> > 9c4ff53d2fa688581d257eb7e045f9e6a20470d3:
> >=20
> > vlc: update to 1.1.11 and fix xml2 build (2011-09-15 15:59:26 +0200)
> >=20
> > are available in the git repository at:=20
> > git://git.openembedded.org/meta-openembedded-contrib jansa/meta-efl=20
> > http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/meta-efl
> >
> >  pespin (4): enjoy: Add var LIC_FILES_CHKSUM to recipe enjoy: Add inher=
it
> > gettext enjoy: Update gstreamer package names in RDEPENDS enjoy: Add
> > gst-plugins-good-autodetect to RDEPENDS
>=20
> I'm not going to pull the gstreamer ones till the oe-core situation is
> sorted out on that front.

Ah.. I was hoping we could update that as soon as it's fixed in oe-core..=
=20
because now enjoy is not really usable in current form.. well we need
more then this 4 patches to make it usefull..

> My other complaint is the lack of a proper author, could you please fix t=
hat up?

Yup, updated in jansa/meta-efl.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5zC0cACgkQN1Ujt2V2gBy2qQCeNA1uGUVwPxDEXNNfmYVXEYI+
yGYAoKLNnON4tWbUKtLXqboQR6vsXP7k
=l7uK
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
