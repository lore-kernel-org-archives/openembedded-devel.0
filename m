Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3304060601
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 12:15:38 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so22627253wgh.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Dec 2014 04:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hWUqezBc1c7KtKjWpzWHwB25kJ4spRRTN1VVOo+dxCg=;
	b=CY+T7oxjkRhOOPC9G1qiKdepuEMkbUTUlGG5TF9guNn1F4HLgNtI8K978v+RZNQmgZ
	t/NYGktR48Sst3OdE4KocixOOr7PeMHa8v9v867phGL9pSLMLaoMedNsgMkXdlmZJbzj
	lKkQ1Zm8XcgLRJbXvI+NLBHXwnrYg/FvET875PhhsQLylGgHJF9U9Uc2gbjmXluh7hWC
	QIjPhcain+SD3MrbLJ1saiIvw9snGIAahN+Nrwo5bcsq+A7JQ/MQ7B/rg3XVumGRkZgd
	cM1HUABBQDrfsp0h7mSQXgBxjop8sr6yB14uwyiCO9G4UiGeJ/Mi59OXHNgCLpnPUQg1
	ypGw==
X-Received: by 10.180.74.146 with SMTP id t18mr91791199wiv.62.1417695337241;
	Thu, 04 Dec 2014 04:15:37 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fo12sm54732868wic.19.2014.12.04.04.15.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 04:15:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Dec 2014 13:15:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141204121538.GA2453@jama>
References: <1417496458-47021-1-git-send-email-biannm@cn.fujitsu.com>
	<20141203175838.GE2455@jama>
	<30DC4EDFD798C94083F3E083754532CC73DE0C7E@G08CNEXMBPEKD02.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC73DE0C7E@G08CNEXMBPEKD02.g08.fujitsu.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] [Patch V2][meta-oe]dmraid: add recipe
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
X-List-Received-Date: Thu, 04 Dec 2014 12:15:40 -0000
X-Groupsio-MsgNum: 53187
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 06:09:58AM +0000, Bian, Naimeng wrote:
> I'm very sorry. I have not addressed what's wrong with my e-mail client.
> Let me send the patch as attachment instead.
> And --keep-cr is necessary for git-am when applying this patch.

You can also push it to some public repo and I'll fetch it from there,
that's the safest option for weird line endings or binary blobs.

Thanks

>=20
> Thanks=20
>  Bian
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: Thursday, December 04, 2014 1:59 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [PATCH] [Patch V2][meta-oe]dmraid: add recipe
> >=20
> > On Tue, Dec 02, 2014 at 01:00:58PM +0800, Bian Naimeng wrote:
> > > There is no update anymore since 2010, but is still supported by some
> > > distro such as Ubuntu(trusty 14.04LTS).
> >=20
> > Still doesn't apply, probably mangled by your e-mail client
> >=20
> > OE @ =E2=80=BE/meta-openembedded $ pwam 84213
> > 2014-12-03 18:54:27 URL:http://patchwork.openembedded.org/patch/84213/m=
box/
> > [67143] -> "pw-am-84213.patch" [1]
> > Applying: dmraid: add recipe
> > /OE/meta-openembedded/.git/rebase-apply/patch:65: trailing whitespace.
> >=20
> > /OE/meta-openembedded/.git/rebase-apply/patch:73: trailing whitespace.
> >=20
> > /OE/meta-openembedded/.git/rebase-apply/patch:74: trailing whitespace.
> >=20
> > /OE/meta-openembedded/.git/rebase-apply/patch:79: trailing whitespace.
> >=20
> > /OE/meta-openembedded/.git/rebase-apply/patch:85: trailing whitespace.
> >=20
> > fatal: corrupt patch at line 319
> > Patch failed at 0001 dmraid: add recipe
> > The copy of the patch that failed is found in:
> >    /OE/meta-openembedded/.git/rebase-apply/patch
> > When you have resolved this problem, run "git am --continue".
> > If you prefer to skip this patch, run "git am --skip" instead.
> > To restore the original branch and stop patching, run "git am --abort".
> >=20
> >=20
> > OE @ =E2=80=BE/meta-openembedded $ patch -p1 < pw-am-84213.patch patchi=
ng file
> > meta-oe/recipes-extended/dmraid/dmraid/01_fix_broken_linking.patch
> > patching file meta-oe/recipes-extended/dmraid/dmraid/02_disable_dmreg.p=
atch
> > patch: **** malformed patch at line 265:
> >=20
> > > +--- 1.0.0.rc16.orig/lib/.export.sym
> > > ++++ 1.0.0.rc16/lib/.export.sym
> > > +@@ -52,8 +52,6 @@ Base {
> > >
> > > + 		dso_end_rebuild;
> > >
> > > + 		hot_spare_add;
> > >
> > > + 		dso_get_members;
> > >
> > > +-		dm_register_device;
> > >
> > > +-		dm_unregister_device;
> > > + 		dm_all_monitored;
> > > + 	local:
> > >
> > > + 		*;
> >=20
> > This is the broken part, and indeed there are strange blank lines in it=
, maybe
> > mixing dos and linux line ends in different files?
>=20


> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSAUGoACgkQN1Ujt2V2gBxUIgCff7Qrw0n+LqSgrtBoqxJKn09K
NhMAmgIgsdMiLYbd+1/eF1zpEmLybA4W
=7pF/
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
