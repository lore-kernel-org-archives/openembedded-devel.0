Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id F1C5D6FC0F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 11:01:49 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hi2so3947553wib.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 04:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ylGPyW+TApj5dHL/m2cDBDBVAA9Ts4ZcKhYfB5AY0Mc=;
	b=GQGvLXV6uHRQOHZNy5DZl9lhIQo4uGeivdmENjU8zYEvTQFbz7C81DRg3FNXq2yP6q
	my2NdNJcaEmmk12hCRZPZBedrmliDHbxj1bqf8X6Wca1qmeYswpXoDuJ0DJE4vwcSbp4
	WvRwAf2ZXXfX6w+50JZNld/HVlFru/GOGF/MWntejsRJHDr0lW7CKcqavMKbDwqKVi/S
	g1nQHTN2sbSec4RpobN8qc6ul7v+EmsAYdAQiP0WCO+uWRO+e2IugatEIbph4OaFrLUA
	4ZnuUOnFMBOjRs/6x+SFKzGoR1eDHdlRUfrqswTnT7TDGlp8zN4v+q82y38zf9x8dCDj
	IN1Q==
X-Received: by 10.180.82.199 with SMTP id k7mr24967903wiy.34.1403521304916;
	Mon, 23 Jun 2014 04:01:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w5sm32379570wif.3.2014.06.23.04.01.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 04:01:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Jun 2014 13:01:43 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140623110143.GB2437@jama>
References: <536A7C42.6030502@balister.org> <20140511145337.GE22774@jama>
	<20140616134850.GP2428@jama>
	<CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>
	<CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>
	<CAP9ODKr1QTT++D-iiAwT5LgftiZdmzT34xMM_2dkHF5Ti99KnA@mail.gmail.com>
	<CAOd_LFz4ArrStfheb4+KKhwhWPDft5BYjqNk7Y05Ja=oDk+ZSg@mail.gmail.com>
	<20140618142125.GJ2117@jama>
	<CAOd_LFxAsqciQfwvwmsHxwxSd7=4A27y2-tWqETU0GTBBG2ZGw@mail.gmail.com>
	<53A7D3FE.30309@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <53A7D3FE.30309@dresearch-fe.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Mon, 23 Jun 2014 11:01:50 -0000
X-Groupsio-MsgNum: 50516
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 09:15:10AM +0200, Steffen Sledz wrote:
> On 18.06.2014 16:34, Cliff Brake wrote:
> > On Wed, Jun 18, 2014 at 10:21 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> On Wed, Jun 18, 2014 at 10:04:52AM -0400, Cliff Brake wrote:
> >=20
> >>
> >>> Otavio, Armin, would you like me to add your emails to the maintainer
> >>> lists in these readme's as well?
> >>
> >> Should I wait 1 more day before merging branch above for possible
> >> maintainer additions?
> >=20
> > Yes, that would be a good idea.  I'll send a pull request tomorrow, or
> > after I hear back from others.
> >=20
> > If there are other outstanding daisy patches, please let me know.
> >=20
> > As far as a procedure to merge changes, I propose that initially one
> > of the branch maintainers sends a pull request to the maillist .
> > Another maintainer ack the pull request, and then Martin (or other
> > main branch maintainer) merges and pushes.  This will initially give
> > us a little bit more review.  Eventually we may transition to one of
> > us pushing changes directly after co-maintainer ack. The goal is
> > obviously to keep daisy building and as stable as possible.
>=20
> Ping!
>=20
> My live555 patch is still waiting. :(

I've just merged it, but next time such patch needs to be merged in
master first (where it was merged by me on Saturday) and then
cherry-picked to release branch.

Otherwise we risk that some fix is only in release branch and the issue
stays in master.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOoCRcACgkQN1Ujt2V2gByYrgCcDHqYJAmnsFRFhtWMvjf6OzGh
TiQAn2VN0m1axkXeUlWrLfTjAY9yorQm
=cKcp
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
