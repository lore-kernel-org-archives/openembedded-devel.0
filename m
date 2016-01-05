Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1404C6011C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 19:54:05 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id u188so36291342wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 11:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Vkw7vTtD6DKdjyNiP2P/E6n4J8DEoFxr8daysbNfQGw=;
	b=esQWXB1NJihcetoDx1KK/COy7Mv2i3IAFwUjiGuG7CXctRwjNvW+7ZxSIz4bq6l0ol
	SBa+3OCZDli9iEA6Y6/Kz8BSQfHTw6Or/B6oC6dVqklO8bMYy5qcQVYfPfw9Oaw+YSI/
	56qysNcTmUUPeqShkpWyPdNxCeicBtevKG4knPQCvXULt0YTuQi+LmCkSBcf2+78c7oC
	VqClHMMVhlCxyRRpuDXH06rKPBMLvd6iU2CSQZxGIKXBz1tJR+jxV+oxs51MAgB4UZdl
	02MWg64SFFdNPeEajgRmf6qqpigraU+LDKqUKfrM/vwHOHN4TJrq5J8Dfz6ia8HdgUWq
	MGSg==
X-Received: by 10.28.186.87 with SMTP id k84mr5760132wmf.13.1452023645648;
	Tue, 05 Jan 2016 11:54:05 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ke10sm92300958wjb.3.2016.01.05.11.54.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jan 2016 11:54:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 Jan 2016 20:54:15 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160105195415.GF2574@jama>
References: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
	<1449682880-21963-2-git-send-email-kergoth@gmail.com>
	<CABcZANnyzaeCgL7Ljzs82gsd_V2-SNoL5L2DZ3NeCZP41KMVPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnyzaeCgL7Ljzs82gsd_V2-SNoL5L2DZ3NeCZP41KMVPA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2][RESEND 2/3] lowpan-tools: add missing flex/bison deps
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jan 2016 19:54:08 -0000
X-Groupsio-MsgNum: 59351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kbCYTQG2MZjuOjyn"
Content-Disposition: inline

--kbCYTQG2MZjuOjyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2016 at 12:15:17PM -0700, Christopher Larson wrote:
> On Wed, Dec 9, 2015 at 10:41 AM, Christopher Larson <kergoth@gmail.com>
> wrote:
>=20
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> >
>=20
> Looks like this hasn't been applied, any objection?

No objection from me, meta-networking patches are applied by Joe, that's
why I didn't move it from master-next.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kbCYTQG2MZjuOjyn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaMH2YACgkQN1Ujt2V2gByeSQCfe+WXG510qRULp6PBD4fc61kU
di0AoJiHar5G2rrF9halUGik3nFEZVGy
=iRhK
-----END PGP SIGNATURE-----

--kbCYTQG2MZjuOjyn--
