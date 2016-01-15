Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id F155C731D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:52:55 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l65so19115188wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 04:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7O2OXSPEBV8Dh8WM+XI6j3nl3olWhUcPg5+lJtJx4aY=;
	b=eQoG2vqCxnwwo4oLfW1tISqOcj8rMduXVF14TkDNu6x5ZkjrOtUmBuaZBlg5t+kfae
	i06pD1RGOCwhqueu0Y7p53jlAYfoSFUfFBUgVLXiaHUNfLhqkyZquZ6I/W6n6WO9auwP
	rYdOvmtCePUMh56jp4mS/z+E5XaaGOxIHZhJyGgSdQWK2P2DIg/MXOUOQtFqKjIsDad3
	hx8tS5bIwnA9qMU0YW0Otfszr00r9D6lG7hMZTJB1a5IcFax/DtSnNA3xwvqPpTFufyX
	YP7FCYmaZ2HoxgjfZechIoX3t9Jf/w8yTW/Qx6qAHO7zPTUEPKftM+FYEIBNtGOr74XO
	4CTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=7O2OXSPEBV8Dh8WM+XI6j3nl3olWhUcPg5+lJtJx4aY=;
	b=buGEywcX68RcEKlj2lVqoJsWxTrhBEoNU5fjr8Ga51S451V8xjm387XlwDXYgV4bN7
	uZBSxTRu+bhXWcPmguq1jR97ItP8kquJt9hzrIurpvY/pOuhaPuAi+YtuFnbX5Tf0xzn
	ZQCnrMSZ9ReQircs0kI0WK27o94SbYKMcPr0CvU4UB1dGfb/UQMfsCmCL9+B+e3yXFHB
	fyZM+FpEZ2aMOrugmHrZxOxJh+jDsUJm95/A0cWRDEGGey6EzeQaUVJ5bOVf0he+SMIs
	WrhSMPMvEP2PvcLOH5tgncX72JfTX+paV67kRriPumHBDch9iTJOPZ1jN3Z/60AggLk4
	3JWw==
X-Gm-Message-State: AG10YORXhm0/2W2pQ4GDUQhijI0PTMnKuReS39XwMdnHRf3Q3TJLOA+wfttiJwExOXDqtQ==
X-Received: by 10.28.179.84 with SMTP id c81mr3325361wmf.30.1452862376037;
	Fri, 15 Jan 2016 04:52:56 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u69sm2424008wmu.20.2016.01.15.04.52.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jan 2016 04:52:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Jan 2016 13:53:49 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160115125349.GC2607@jama>
References: <1452631365-11516-1-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1452631365-11516-1-git-send-email-adrian.freihofer@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: koen@dominion.thruhere.net
Subject: Re: [meta-oe][PATCHv3 0/3] networkmanager: 1.0.6 -> 1.0.10
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
X-List-Received-Date: Fri, 15 Jan 2016 12:52:56 -0000
X-Groupsio-MsgNum: 59559
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline

--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2016 at 09:42:42PM +0100, Adrian Freihofer wrote:
> networkmanager
> - update to 1.0.10
> - add patches, one of them fixes broken openvpn
> - fix pppd rdepend
> networkmanager-openvpn: Update to 1.0.8
>=20
> Adrian Freihofer (2):
>   networkmanager: add patches
>   networkmanager-openvpn: Update to 1.0.8
>=20
> Dai Caiyun (1):
>   networkmanager: 1.0.6 -> 1.0.10

This seems to break gnome-panel build:
| In file included from clock-location.c:22:0:
|
/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/Netw=
orkManager/NetworkManager.h:31:31:
fatal error: nm-version-macros.h: No such file or directory
| compilation terminated.
| make[5]: *** [clock_applet-clock-location.o] Error 1
| make[5]: *** Waiting for unfinished jobs....

Can you please test it?

>=20
>  .../networkmanager/networkmanager-openvpn_1.0.6.bb |  31 ------
>  .../networkmanager/networkmanager-openvpn_1.0.8.bb |  31 ++++++
>  ...ilure-to-configure-routes-due-to-wrong-de.patch |  54 ++++++++++
>  ...-clear-ppp_watch_id-upon-pppd-termination.patch |  29 +++++
>  ...date-ip_iface-only-if-IP-interface-exists.patch |  45 ++++++++
>  .../networkmanager/networkmanager_1.0.10.bb        | 120 +++++++++++++++=
++++++
>  .../networkmanager/networkmanager_1.0.6.bb         | 117 ---------------=
-----
>  7 files changed, 279 insertions(+), 148 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager-openvpn_1.0.6.bb
>  create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager-openvpn_1.0.8.bb
>  create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
>  create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
>  create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch
>  create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager_1.0.10.bb
>  delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager_1.0.6.bb
>=20
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaY690ACgkQN1Ujt2V2gBzVMACggnTlT+Sd0z7Q3pdUe40SvDoL
S7kAoJAq3MxaYwhWf/e2CLs8RhpKfZDz
=LE2X
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
