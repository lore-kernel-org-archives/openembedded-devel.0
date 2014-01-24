Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 584066E721
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2014 10:38:54 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1W6e9z-0006Km-EG for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jan 2014 11:38:51 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2014 11:38:51 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2014 11:38:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 24 Jan 2014 11:40:07 +0100
Message-ID: <lbtfr4$a1r$1@ger.gmane.org>
References: <1390492533-56999-1-git-send-email-javier.viguera@digi.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1390492533-56999-1-git-send-email-javier.viguera@digi.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][master/dora][PATCH] networkmanager: fix incorrect configure option
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
X-List-Received-Date: Fri, 24 Jan 2014 10:38:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Javier Viguera schreef op 23-01-14 16:55:
> The wrong option was breaking the build with:
> 
> configure: error: invalid package name: systemdsystemunitdir=
> 
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS4kMHMkyGM64RGpERArZLAJ4xWt95oDCd6oyV87wjjsywVg2ryQCfazyd
+VeA8Y8GJAftIWIc7rnz4Go=
=SCDi
-----END PGP SIGNATURE-----


