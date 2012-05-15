Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SUCeF-00048l-Fk for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 09:58:23 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SUCUa-0002An-1J for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 09:48:24 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 09:48:23 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 09:48:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 15 May 2012 09:48:02 +0200
Message-ID: <jot1nl$vcb$1@dough.gmane.org>
References: <1336166708-14019-1-git-send-email-gizero@gmail.com>
	<1336233109-26164-1-git-send-email-gizero@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <1336233109-26164-1-git-send-email-gizero@gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [meta-oe][PATCH v2] libmodbus: ported recipe from classic and updated
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2012 07:58:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-05-12 17:51, Andrea Galbusera schreef:
> * based on recipe by Radoslav Kolev which was in classic * updated to
> latest released version 3.0.2 * v2 drops git version of recipe * v2 drops
> no longer used PRIORITY
> 
> Signed-off-by: Andrea Galbusera <gizero@gmail.com> --- 
> .../recipes-extended/libmodbus/libmodbus_3.0.2.bb  |   18
> ++++++++++++++++++ 1 files changed, 18 insertions(+), 0 deletions(-) 
> create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> 
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb new file mode
> 100644 index 0000000..5926bc4 --- /dev/null +++
> b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb @@ -0,0 +1,18 @@ 
> +SUMMARY = "A Modbus library" +DESCRIPTION = "libmodbus is a C library
> designed to provide a fast and robust \ +implementation of the Modbus
> protocol. It runs on Linux, Mac OS X, FreeBSD, \ +QNX and Windows." 
> +HOMEPAGE = "http://www.libmodbus.org/" +SECTION = "libs" + +LICENSE =
> "LGPLv2.1+" +LIC_FILES_CHKSUM =
> "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c" + +PR =
> "r0"

Drop that
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPsgoyAAoJEHZqAkdh1vT6jHsP/3FzoPMuoKnCpE8DS8r/7Tj6
iE126Y0KV7O8qb0Myr9EeUAFhuiuwp2RXJlznrMHVqNVOJa46dvAnmbcq6v/r/xR
QQQGuRnqLOJwSJpWuphxRqbUHKFIAQYePSuIdzqAydJxEH017yz+btAryoxHQd/g
He78sRYvpFkavoFhjBpcFXDYcW9JZFHc7iFKThv3qDaWNbbabd2p4McM8x1O0FjJ
pybhuLaAbsae5pB2BWItncf60IEY1BiKhjraJ6658XSLNZf8oEt8XOh3BzNRMTSC
AFwWZpvfIiz8h6IG7nYv5Cfnrw59mYoH+c5hLr8tRNpCsUSYr95uQc+oa1Y6ldrN
24bsgkQv4VPwH7yRVDruZSb3FJna99pP9KSmTzvOYCeJio/vIq1LyskCCSyiX09i
iB/P0QFubAH67k3m2VNrbFB+YZE/VSe7KJDAPbONKduaNKQQCSapAngi+4TWlsGR
5lR/e+LsPk4YpqWcm97L/beJfSLpwlNkhWrkGYjYtkxOztkvO7Tj1OoLiYMoFnIz
rW+FnLNk4pmhM6fD76yNpn9YtJCOCPIvNvTkKcfkRDR6UPK3Jvy9nWvNlgZvqnPr
F4PQ5mcqdR/3l9TM9iAIA6zX4tiIOMBef2Mxzk3z0MmGtIM6+FcZFGAin39ggA+z
dZyJP6aXgvnQehZhhAU4
=YKDQ
-----END PGP SIGNATURE-----



