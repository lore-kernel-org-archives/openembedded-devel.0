Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id CBA1C6AA18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 13:25:18 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1W49QC-0000p0-7h for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jan 2014 14:25:16 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 14:25:16 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 14:25:16 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 17 Jan 2014 14:27:57 +0100
Message-ID: <lbbav2$lth$1@ger.gmane.org>
References: <1389880695-22678-1-git-send-email-ml@communistcode.co.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1389880695-22678-1-git-send-email-ml@communistcode.co.uk>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCHv2] libsoc: update to 0.5
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
X-List-Received-Date: Fri, 17 Jan 2014 13:25:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jack Mitchell schreef op 16-01-14 14:58:
> From: Jack Mitchell <jack@embed.me.uk>


Missing SOB line

> 
> --- meta-oe/recipes-support/libsoc/{libsoc_0.4.bb => libsoc_0.5.bb} | 2
> +- 1 file changed, 1 insertion(+), 1 deletion(-) rename
> meta-oe/recipes-support/libsoc/{libsoc_0.4.bb => libsoc_0.5.bb} (87%)
> 
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.4.bb
> b/meta-oe/recipes-support/libsoc/libsoc_0.5.bb similarity index 87% 
> rename from meta-oe/recipes-support/libsoc/libsoc_0.4.bb rename to
> meta-oe/recipes-support/libsoc/libsoc_0.5.bb index da3c442..c381799
> 100644 --- a/meta-oe/recipes-support/libsoc/libsoc_0.4.bb +++
> b/meta-oe/recipes-support/libsoc/libsoc_0.5.bb @@ -6,7 +6,7 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
> 
> inherit autotools
> 
> -SRCREV = "f6827b7b5c581b586d3bcc4813d418101ae1e85b" +SRCREV =
> "e5846ca199316603f0fec0748c57a781ced46950" SRC_URI =
> "git://github.com/jackmitch/libsoc.git"
> 
> S = "${WORKDIR}/git"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS2S/dMkyGM64RGpERAikUAJ9wW1P8Q7beuIYTy8eZxU2heQT6yQCfTOQA
gIJxFNQHCBIKK8+piRq8824=
=8Xsh
-----END PGP SIGNATURE-----


