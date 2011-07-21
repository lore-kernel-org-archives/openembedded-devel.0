Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QjnKw-0000YP-0O
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 09:06:22 +0200
Received: by fxh10 with SMTP id 10so3074757fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 00:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R3Q32hmZB61FXt1RFUKiuoJTrgZYWfkMZHRNWGJLIp4=;
	b=T3re+4cZS2nk1OiZyPejJD+ezTQ3IwqI0085YxUMvILxQZOsh/hpUjvhIP4I1uW1Ut
	Yw8HhRixrqpq7pxqJL34W5efGdD0w2Y6obMW1BU3odprYewq69n6J1lDdTs+wDS34c92
	50wqLb50WTsO/96ygWnZW14/cVSrXorBmZpj4=
Received: by 10.223.76.17 with SMTP id a17mr2108664fak.32.1311231711364;
	Thu, 21 Jul 2011 00:01:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f7sm463093faa.32.2011.07.21.00.01.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 00:01:49 -0700 (PDT)
Date: Thu, 21 Jul 2011 09:01:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110721070142.GE3443@jama.jama.net>
References: <cover.1311195484.git.Martin.Jansa@gmail.com>
	<j08gt2$tdv$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j08gt2$tdv$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 0/5] Pull request #18
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
X-List-Received-Date: Thu, 21 Jul 2011 07:06:23 -0000
X-Groupsio-MsgNum: 33263
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Content-Disposition: inline

--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 08:27:46AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 20-07-11 22:58, Martin Jansa schreef:
> > The following changes since commit 037a063303d35c2fab8097d977aa5625c916=
c565:
> >=20
> >   connman: update to 0.76 (2011-07-20 09:13:00 +0200)
> >=20
> > are available in the git repository at:
> >   git://git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
> >   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?=
h=3Djansa/meta-oe
> >=20
> > Martin Jansa (5):
> >   vala-dbus-binding-tool: inherit perlnative
> >   pidgin: inherit perlnative
> >   tangogps: add misssing dependency bluez4
> >   bluez4: add missing dependency usbpath
> >   vala-terminal: inherit perlnative
>=20
> Thanks, I pulled these in and will push to the OE servers once ssh gets f=
ixed. In the meantime, it's at github: https://github.com/koenkooi/meta-oe/=
commits/master

Thanks,

maybe wait with push a bit more please as there is discussion about
similar patch series on oe-core and Tom maybe has better fix for it (but
that fix doesn't work for me sofar).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4nztYACgkQN1Ujt2V2gBwPKACdEyRY//I4RLLTsjrJatXFApUL
7U0AmgMwCddZpgW3HvW2AXjiZKHVrvXC
=m8Kb
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--
