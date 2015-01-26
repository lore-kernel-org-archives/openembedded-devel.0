Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 100BD60670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 18:16:06 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YFoCj-0000dz-0o for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2015 19:16:05 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 19:16:05 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 19:16:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 26 Jan 2015 19:15:58 +0100
Message-ID: <ma608u$6b8$1@ger.gmane.org>
References: <CADO9-pf7FC6Qhh+K2HvZ2xBdYCY-qvMoGh9Xa5tE_XF9LRuuPA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
In-Reply-To: <CADO9-pf7FC6Qhh+K2HvZ2xBdYCY-qvMoGh9Xa5tE_XF9LRuuPA@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH]] Add XFCE iamge build file
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
X-List-Received-Date: Mon, 26 Jan 2015 18:16:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yong Li schreef op 26-01-15 om 01:46:
> From 44c7c064bd7d735e31c2fea0149fc293db78c536 Mon Sep 17 00:00:00 2001 
> From: Yong Li <sdliyong@gmail.com> Date: Mon, 26 Jan 2015 08:39:37 +0800 
> Subject: [PATCH] Add XFCE iamge build file
> 
> Signed-off-by: Yong Li <sdliyong@gmail.com> --- 
> meta/recipes-graphics/images/core-image-xfce.bb | 15 +++++++++++++++ 1
> file changed, 15 insertions(+) create mode 100644
> meta/recipes-graphics/images/core-image-xfce.bb
> 
> diff --git a/meta/recipes-graphics/images/core-image-xfce.bb 
> b/meta/recipes-graphics/images/core-image-xfce.bb new file mode 100644 
> index 0000000..1d9bfdc --- /dev/null +++
> b/meta/recipes-graphics/images/core-image-xfce.bb @@ -0,0 +1,15 @@ 
> +SUMMARY = "A very basic Wayland image with a terminal"

Wayland you say?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUxoReMkyGM64RGpERAjgjAKC9pQay+oNiSAcCPvt//P8R8bnAewCgs/eM
BsL1m5Bvwvi6mAGEl8l71sE=
=KpzI
-----END PGP SIGNATURE-----


