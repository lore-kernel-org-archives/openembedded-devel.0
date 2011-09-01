Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QzB0k-0004Pp-SK for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 19:25:07 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QzAvz-00011Y-Tx for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 19:20:11 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 19:20:11 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 19:20:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 01 Sep 2011 19:18:42 +0200
Message-ID: <j3oepi$f6u$1@dough.gmane.org>
References: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
	<af2d01f1621c1372d43cd0a1296c80e375202fee.1314891222.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <af2d01f1621c1372d43cd0a1296c80e375202fee.1314891222.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-handheld][PATCH 09/10] spitz, akita: add iwmmxt to PACKAGE_EXTRA_ARCHS_tune-xscale not PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Thu, 01 Sep 2011 17:25:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-09-11 17:39, Martin Jansa schreef:
> * otherwise fails with: ERROR:  Poky's config sanity checker detected a
> potential misconfiguration. Either fix the cause of this error or at your
> own risk disable the checker (see sanity.conf). Following is the list of
> potential problems / advisories:
> 
> Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
> (armv5te).

Speaking of iwmmxt, any volunteers to add the pixman iwmmxt patches to meta-oe?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOX75xMkyGM64RGpERAujsAJ96zq03L6VQigOp57pgAEj1DfWuPwCfWzdW
iSyIDpTbMQQrLiFSes95H2k=
=2Kaf
-----END PGP SIGNATURE-----



