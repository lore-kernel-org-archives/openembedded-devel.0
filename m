Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1THhsB-0006cU-Lu for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 23:13:27 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1THhfm-0004iA-Ka for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 23:00:34 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2012 23:00:34 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2012 23:00:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 28 Sep 2012 23:00:19 +0200
Message-ID: <k45351$rm0$1@ger.gmane.org>
References: <1348802495-13651-1-git-send-email-jackie.huang@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
In-Reply-To: <1348802495-13651-1-git-send-email-jackie.huang@windriver.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-networking][PATCH v2 1/2] ptpd: migrate from meta-oe into meta-networking
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
X-List-Received-Date: Fri, 28 Sep 2012 21:13:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 28-09-12 05:21, jackie.huang@windriver.com schreef:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com> --- 
> .../ptpd/ptpd-1.0.0/add-limit-h.patch              |   26
> ++++++++++++++++++++ meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb |
> 20 +++++++++++++++ .../ptpd/ptpd-1.0.0/add-limit-h.patch              |
> 26 -------------------- meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
> |   20 ---------------

Can you resend that with -m?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQZg/jMkyGM64RGpERAmQGAJ9FvNdtkcgp25H/NSAQn0jUH3adAgCeIdTv
OYcMi5OfStUutSiA4pTuEG8=
=TXyy
-----END PGP SIGNATURE-----



