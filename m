Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id E8F016F7C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 07:50:17 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WT54p-0008N3-Se for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2014 08:50:15 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:50:15 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:50:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 27 Mar 2014 08:50:07 +0100
Message-ID: <lh0l6v$thv$1@ger.gmane.org>
References: <cover.1395846628.git.diego.ml@zoho.com>
	<156960c12dbc26909b9d200cd312e71cd53dbd99.1395846628.git.diego.ml@zoho.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <156960c12dbc26909b9d200cd312e71cd53dbd99.1395846628.git.diego.ml@zoho.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH 1/3] python-zopeinterface: upgrade to version 4.1.1
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
X-List-Received-Date: Thu, 27 Mar 2014 07:50:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Diego Rondini schreef op 26-03-14 16:14:
> --- ...face_3.5.1.bb => python-zopeinterface_4.1.1.bb} |    4 ++-- 1 file
> changed, 2 insertions(+), 2 deletions(-) rename
> meta-oe/recipes-devtools/python/{python-zopeinterface_3.5.1.bb =>
> python-zopeinterface_4.1.1.bb} (84%)
> 
> diff --git
> a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
> b/meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb 
> similarity index 84% rename from
> meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb rename to
> meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb index
> d73a5be..4982ed7 100644 ---
> a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb +++
> b/meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb @@ -6,8
> +6,8 @@ LIC_FILES_CHKSUM =
> "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423 PR = "r1"

please drop PR when updating to a new PV

> 
> SRC_URI =
> "http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${PV}.tar.gz"
>
> 
- -SRC_URI[md5sum] = "685fc532550abb07cca6190c9cd2b901"
> -SRC_URI[sha256sum] =
> "b81d898532c47f73475c2d0c23580e289eed25923d007eca8e62750c0998bba0" 
> +SRC_URI[md5sum] = "edcd5f719c5eb2e18894c4d06e29b6c6" +SRC_URI[sha256sum]
> = "91cba7b7cd7cb82f6f4e023fe77f94dc3df4ae5287fd55def2148dc232d0c7da"
> 
> S = "${WORKDIR}/zope.interface-${PV}"
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTM9gvMkyGM64RGpERArdEAJ9b+y+3k8nltoYgoRQ6hN2C5IYr9ACgkRm7
jTOtCuXbEYyGBii66dKBlXQ=
=buLP
-----END PGP SIGNATURE-----


