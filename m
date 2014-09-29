Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 912136FDEB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 16:23:41 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so2986619wgg.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OZE/qH+uxLW2CSY47oPPJh5X1QqmJDCjAyFFIGjwz6o=;
	b=CtZpOE7PGnL2suEn5jUxJDOSQLgVMsIm/0DLwl+M+3IFxPTv18kmOoYEj3wuay7gbd
	WfRNLqIV8EUZZPqG0/5JXUxYJGvvgjg/nC+Tf4vd3PjEdEnhzSEHxgenwT99QSxIy5hG
	EGw5RxCajkvQcPXJaqOx+eSL3p7Ttq9nykptXD1ExAaiCdi885W51HGm0v4YlJMmpoGE
	5u5Bxh8Mp5qivBCE3g2AyV1vzSK6fh0YQPJTHv1hYI+p/Ut8uOjTRhj5F/FkLMPQahy6
	YrLkJgd7e3YHg/y7S8N6vpxijSpv6B+Ou/o7UDSjXqwXUatTTHhJdkTT9kzvl8g4obf3
	yuVA==
X-Received: by 10.180.198.211 with SMTP id je19mr17199562wic.78.1412007822257; 
	Mon, 29 Sep 2014 09:23:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ua8sm16241832wjc.7.2014.09.29.09.23.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 09:23:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Sep 2014 18:24:33 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140929162433.GS25706@jama>
References: <1411881077-86222-1-git-send-email-coldnew.tw@gmail.com>
	<20140928054750.GQ25706@jama> <m2y4t4f7fl.fsf@gmail.com>
	<CAP9ODKpSRCE5b_q0a_P2UNqp0AkiZYZezsJE7Z6C6G0g-2wisA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpSRCE5b_q0a_P2UNqp0AkiZYZezsJE7Z6C6G0g-2wisA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH v2] qt5: Add Qt 5.3.2 packages
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
X-List-Received-Date: Mon, 29 Sep 2014 16:23:41 -0000
X-Groupsio-MsgNum: 52277
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tgGnixv3tJWXBxdL"
Content-Disposition: inline

--tgGnixv3tJWXBxdL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2014 at 12:16:22PM -0300, Otavio Salvador wrote:
> On Sun, Sep 28, 2014 at 5:55 AM, Yen-Chin Lee <coldnew.tw@gmail.com> wrot=
e:
> >
> > Martin Jansa writes:
> >
> >> On Sun, Sep 28, 2014 at 01:11:17PM +0800, Yen-Chin Lee wrote:
> >>> Qt 5.3.2 has been released in September 16th, 2014.
> >>>
> >>> We still keep QT_VERSION to 5.3.1, if users want to upgrade to QT 5.3=
=2E2
> >>> they should modified the QT_VERSION variable on their own.
> >>>
> >>
> >> I would remove the 5.3.1 version (and _git recipes will later be used
> >> for 5.4)
> >
> > Wow! That's great news! Actually I also want to test the Qt 5.4 version,
> > it's nice if we can has Qt 5.4 git support soon.
>=20
> So could you rework the patches to upgrade the 5.3.1 recipes to 5.3.2 one=
s?
>=20

I've already updated them in jansa/master branch

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tgGnixv3tJWXBxdL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQph8EACgkQN1Ujt2V2gBzzsACgrjBNcx7/8rLpgtgNLXJSCnOl
6dwAnRR0T8IOmFBZULng65Sflj63p9hw
=8/b9
-----END PGP SIGNATURE-----

--tgGnixv3tJWXBxdL--
