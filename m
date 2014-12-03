Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 517D160030
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 17:58:37 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id k14so20319499wgh.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2014 09:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FFFwe4pNgGgIqEJKQZ5IDLNgViT4alufc2I0/1mn/8I=;
	b=IAF/VTYQ1TNl6ElJx2vX/cv/w6st9+yP6XBevIwNutgFvZh78hVqHYQvGhKW0qqXb3
	BqMZAGtHhf+hB/QC4lAih+VZx6xefkk+Y8/kia3MDwuR4zPXMLBhaGZ9F3I6lvGzrgd7
	TjBLb7YcFCaMMSQ69lalw6q3KFfugvFDPj8D5Y9bARTBO7h1NrLbSsbN/UfDwtXdRIin
	7gczqwreblaXi/lnhf/ve5h3QoIz3ZXhOdRt83WtA6u+2xCbzj83Z0jOS7dd0JKYch3u
	udKd3yZOAtARfnFa3w9Qr64YNIZBLKSdC8DxhxaDcEWz4rGDiloqbhzh4QYyGjiv/t5Z
	cJag==
X-Received: by 10.194.156.201 with SMTP id wg9mr9199248wjb.59.1417629517631;
	Wed, 03 Dec 2014 09:58:37 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n8sm37230830wjx.0.2014.12.03.09.58.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 09:58:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Dec 2014 18:58:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141203175838.GE2455@jama>
References: <1417496458-47021-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417496458-47021-1-git-send-email-biannm@cn.fujitsu.com>
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
X-List-Received-Date: Wed, 03 Dec 2014 17:58:44 -0000
X-Groupsio-MsgNum: 53170
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Content-Disposition: inline

--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2014 at 01:00:58PM +0800, Bian Naimeng wrote:
> There is no update anymore since 2010, but is still supported by some
> distro such as Ubuntu(trusty 14.04LTS).

Still doesn't apply, probably mangled by your e-mail client

OE @ ~/meta-openembedded $ pwam 84213
2014-12-03 18:54:27 URL:http://patchwork.openembedded.org/patch/84213/mbox/=
 [67143] -> "pw-am-84213.patch" [1]
Applying: dmraid: add recipe
/OE/meta-openembedded/.git/rebase-apply/patch:65: trailing whitespace.
=20
/OE/meta-openembedded/.git/rebase-apply/patch:73: trailing whitespace.
=20
/OE/meta-openembedded/.git/rebase-apply/patch:74: trailing whitespace.
=20
/OE/meta-openembedded/.git/rebase-apply/patch:79: trailing whitespace.
=20
/OE/meta-openembedded/.git/rebase-apply/patch:85: trailing whitespace.
=20
fatal: corrupt patch at line 319
Patch failed at 0001 dmraid: add recipe
The copy of the patch that failed is found in:
   /OE/meta-openembedded/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


OE @ ~/meta-openembedded $ patch -p1 < pw-am-84213.patch
patching file meta-oe/recipes-extended/dmraid/dmraid/01_fix_broken_linking.=
patch
patching file meta-oe/recipes-extended/dmraid/dmraid/02_disable_dmreg.patch
patch: **** malformed patch at line 265:=20

> +--- 1.0.0.rc16.orig/lib/.export.sym
> ++++ 1.0.0.rc16/lib/.export.sym
> +@@ -52,8 +52,6 @@ Base {
>=20
> + 		dso_end_rebuild;
>=20
> + 		hot_spare_add;
>=20
> + 		dso_get_members;
>=20
> +-		dm_register_device;
>=20
> +-		dm_unregister_device;
> + 		dm_all_monitored;
> + 	local:
>=20
> + 		*;

This is the broken part, and indeed there are strange blank lines in it, ma=
ybe
mixing dos and linux line ends in different files?


--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlR/T04ACgkQN1Ujt2V2gBzriwCeNrqACQZj7tujFHVdfnC3SBhI
ou8An3plYl8packhxKjYnvSeoBhDdB7Z
=ePJJ
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--
