Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3cmI-0000BN-ND for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 02:29:22 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3OId-0000pO-Gg for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2013 11:01:47 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2013 11:01:47 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2013 11:01:47 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 07 Feb 2013 11:01:19 +0100
Message-ID: <kevu1a$phk$1@ger.gmane.org>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
	<1360102723-27891-5-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <1360102723-27891-5-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe-meta-systemd 4/5] pointercal-xinput: remove
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
X-List-Received-Date: Fri, 08 Feb 2013 01:29:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-02-13 23:18, Andreas Müller schreef:
> Calibration values are stored now in /etc/xorg.conf.d/99-<device>.conf.
> After this is accepted patches to layers appending pointercal-xinput will
> be send.

How does this work with board where you can plug in different touchscreen
(like beaglebone) or difference touchscreen controllers (beagleboard, olimex
allwinner boards, etc)?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRE3tvMkyGM64RGpERAiSbAJ9lhIi1jSmhhM9UIePDIzICyQlTLQCfWgyi
oh3uluQd0wpW/61WheXTrz4=
=FYL8
-----END PGP SIGNATURE-----



