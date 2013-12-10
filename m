Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 207B9608BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 09:26:06 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VqJZt-0008Qf-9Y for openembedded-devel@lists.openembedded.org;
	Tue, 10 Dec 2013 10:26:05 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 10:26:05 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 10:26:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 Dec 2013 10:26:28 +0100
Message-ID: <l86mmo$28c$1@ger.gmane.org>
References: <1385600219-18495-1-git-send-email-eu@felipetonello.com>	<14902072.IG3b8o4YqW@helios>
	<l77732$ggi$1@ger.gmane.org>	<1825979.KGUos5WM3r@helios>
	<l777t2$pcq$1@ger.gmane.org>
	<CAGrhNMxYxbA-dL0iQFB_mD-s94nrKupCx-vJaijp=sPy5herwQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <CAGrhNMxYxbA-dL0iQFB_mD-s94nrKupCx-vJaijp=sPy5herwQ@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] packagekit: Updated to 0.8.13
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
X-List-Received-Date: Tue, 10 Dec 2013 09:26:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Felipe Tonello schreef op 10-12-13 02:17:

> It does split into packages. I splited it up in packages just so if the
> user wants to have different backend options, it can.
> 
> The problem with this aproach, is that you will add the apt and opkg 
> dependency to the build even if the user doesn't care about it. I don't
> like this option to be honest.

It's only 2 small build time dependencies saving a lot of rebuilding and
runtime headaches.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSpt5EMkyGM64RGpERAuUXAKClv7R7D5BQ2HAHq/izXFFasdIgTwCgmxGS
ABJMGP0RcNAnlQNUb24eXds=
=Dzav
-----END PGP SIGNATURE-----


