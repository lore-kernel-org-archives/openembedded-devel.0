Return-Path: <joe@deserted.net>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8756E717
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:37:12 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so2463042ier.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 05:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=HBiqyfeSqQy4EfclWJjPce4q1qoU6AziYS1JWYsaKCs=;
	b=TIi6rovYdTqBrbzsaesM9DWiGkyUid+2Rw6rzSXMqglcQYDJ3X2PJnzlidg4VSaqZF
	QWEoHFdtLYcbDBD2rdqE5yEihWuKhcquU+GoU+G0+dHAJqA61oEN8GWKvL2F1erfTS17
	jKI5ePdiU8q2ZsC92LW8TKZQen2W3wvTWZjXM51D2WZLB9+vicwVtSupqyUUEJUylN5Q
	zRlNkplMIDrDAlhcfIndWpzGNO90q0Cchwrj6H2Tn/17zzUtkGiXwDripmNJsd2waxpD
	MsLzhqcOq2wnxiQa6vpjJ8njDAgeV3Hm/gZQS1Iy6u4nTLmkt7lpc+DBJJ0pgnUsc9Rr
	dT+g==
X-Gm-Message-State: ALoCoQl/nBs65tu0KtS32Xpp+HvQCyYy87dEO4nfLH9QphLWssQY3Jrf3JA7x/i2s6nCoesdkaof
X-Received: by 10.50.40.105 with SMTP id w9mr7415739igk.3.1394800633451;
	Fri, 14 Mar 2014 05:37:13 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	bf7sm78876127igb.9.2014.03.14.05.37.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 14 Mar 2014 05:37:12 -0700 (PDT)
Date: Fri, 14 Mar 2014 08:37:09 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140314123706.GA3469@deserted.net>
References: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
	<5362182.lGPryEyDJx@peggleto-mobl5.ger.corp.intel.com>
	<CAJTo0LbSeFKkk0JrEYQAS3Lb2NVAJYuraaBAkNCgT_-LUW+Gdw@mail.gmail.com>
	<5621583.lHbqxaxFpZ@peggleto-mobl5.ger.corp.intel.com>
	<6B3DF93B-C645-42A0-A36E-4EE3923E3905@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6B3DF93B-C645-42A0-A36E-4EE3923E3905@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Mar 2014 12:37:17 -0000
X-Groupsio-MsgNum: 48663
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors] On 14.03=
=2E01 (Sat 14:57) Khem Raj wrote:

>=20
> On Mar 1, 2014, at 2:48 PM, Paul Eggleton <paul.eggleton@linux.intel.com>=
 wrote:
>=20
> > On Saturday 01 March 2014 20:18:44 Burton, Ross wrote:
> >> On 1 March 2014 09:59, Paul Eggleton <paul.eggleton@linux.intel.com> w=
rote:
> >>> That would be nice, but since you can't actually distribute a product=
 that
> >>> connects to the main pool.ntp.org server (you need to register your o=
wn
> >>> NTP
> >>> pool [1]) we've elected not to set any default so that you are encour=
aged
> >>> to do the right thing and explicitly set your own.
> >>=20
> >> We should probably put this in the documentation.  I'll file a bug.
> >=20
> > Whose documentation though? ntp is part of meta-networking rather than =
OE-
> > Core.
> >=20
>=20
> README for meta-networking is best place.=20

I agree.  I'm working through my backlog of merges right now but I've
not seen a readme patch.  If I missed it, please let me know, otherwise
when I get a chance I'll propose a readme documenting this myself.

-J.

>=20
> > Cheers,
> > Paul
> >=20
> > --=20
> >=20
> > Paul Eggleton
> > Intel Open Source Technology Centre
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
-Joe MacDonald.
:wq

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlMi9+kACgkQwFvcllog0XzPmwCfaQrbTQuhl7dU3IuecSyF/M4c
Gj4An326RRMrzqEuQPaoN5S4+R2DmTz1
=9+Gv
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
