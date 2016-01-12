Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 7875F73289
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 07:19:29 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1aItEl-0002mo-EU for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2016 08:19:27 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 08:19:27 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 08:19:27 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 12 Jan 2016 08:19:20 +0100
Message-ID: <n729do$3mh$1@ger.gmane.org>
References: <1452569693-1863-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
In-Reply-To: <1452569693-1863-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Subject: Re: [meta-networking][PATCH] samba-4.1.12: Modify patches.
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
X-List-Received-Date: Tue, 12 Jan 2016 07:19:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-01-16 om 04:34 schreef Li Xin:
> when PATCHTOOL = "patch" is setted in conf/local.conf,the following 
> patches will occur errors in the step of do_patch. *
> 01-fix-force-user-sec-ads.patch * 03-net-ads-kerberos-pac.patch *
> 05-fix-gecos-field-with-samlogon.patch *
> 11-fix-overwriting-of-spns-during-net-ads-join.patch *
> 13-fix-aes-enctype.patch So modify it.
> 

[..]

> -From 80f3551d4f594438dcc93dd82a7953c4a913badd Mon Sep 17 00:00:00 2001 
> -From: Andreas Schneider <asn@samba.org> -Date: Mon, 16 Dec 2013 12:57:20
> +0100 -Subject: [PATCH 1/7] s3-lib: Add winbind_lookup_usersids(). +From
> 30f7627320c6918f3290d6516de2d94bbcad6320 Mon Sep 17 00:00:00 2001 +From:
> Li Xin <lixin.fnst@cn.fujitsu.com> +Date: Sun, 3 Jan 2016 22:19:43 +0900 
> +Subject: [PATCH 1/5] s3-lib: Add winbind_lookup_usersids().

No. Just no.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFWlKj4MkyGM64RGpERAi9nAJ4waTgN4wJcqG6Aebvt+bJ7puTLAACdHFp/
vHZ2z+tzjoW42VAQPcFkJ2k=
=Olys
-----END PGP SIGNATURE-----


