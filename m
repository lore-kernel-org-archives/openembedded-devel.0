Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RyWQC-0007E9-2r
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 23:36:56 +0100
Received: by eaal10 with SMTP id l10so1285973eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 14:28:41 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.95.201 as permitted sender) client-ip=10.14.95.201; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.95.201 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.95.201])
	by 10.14.95.201 with SMTP id p49mr5509945eef.53.1329517721721 (num_hops
	= 1); Fri, 17 Feb 2012 14:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gaUb0IM+t2wBVmKvCCyiR1hAHSkOmDUbNqZiR9DFyL4=;
	b=g1GDvNv5x5PnHy4Wk4hxjWHEdIXAIlwTgyxwzBuc4Skz9pkXklWXcL/gqU0Fhlmyhq
	s+UpOmF6eO678DG5mTz5JdG4vGpuBSS3f2fUrim1QA77G+rPi3hhDXn+7J8M7YofsaOv
	GyC4t7rec4oDCAAbOvMo0jQB2GvgjjsRiWRa4=
Received: by 10.14.95.201 with SMTP id p49mr4477075eef.53.1329517721659;
	Fri, 17 Feb 2012 14:28:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm43628644eei.3.2012.02.17.14.28.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 14:28:41 -0800 (PST)
Date: Fri, 17 Feb 2012 23:28:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120217222839.GJ5822@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-6-git-send-email-schnitzeltony@googlemail.com>
	<20120217093459.GG5822@jama.jama.net>
	<CALbNGRTU6F7Yd1wQODe31XP4tNJqVhNdEvWO5KiUM-75T=Losw@mail.gmail.com>
	<CAP9ODKovximS_938ok1FS72HapPxd+d3UfPHyOyz2jrB9wfZPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKovximS_938ok1FS72HapPxd+d3UfPHyOyz2jrB9wfZPw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][v2] 05/22] automatically install all *.service and *.socket supplied in recipe's SRC_URI
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
X-List-Received-Date: Fri, 17 Feb 2012 22:36:56 -0000
X-Groupsio-MsgNum: 37218
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRtZRu2mMGBZ6YQ7"
Content-Disposition: inline

--wRtZRu2mMGBZ6YQ7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2012 at 05:05:03PM -0200, Otavio Salvador wrote:
> On Fri, Feb 17, 2012 at 16:44, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>=20
> > * I the name 'systemd_unitdir' OK?
> > * Would it make sense to abstract "${base_libdir}/systemd/system" (too)
>=20
>=20
> I think systemd_unitdir only is enough.

agreed

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wRtZRu2mMGBZ6YQ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8+1JcACgkQN1Ujt2V2gBwoLQCfbFEAMBcMb0sjm9eP2ykKIgaf
bP0AnAtARzMlZFcTdV29oJGi08C5ZoB3
=uLQy
-----END PGP SIGNATURE-----

--wRtZRu2mMGBZ6YQ7--
