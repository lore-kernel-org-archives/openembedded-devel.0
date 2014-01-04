Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 29B6060E41
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 15:12:34 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VzStq-0005zz-T4 for openembedded-devel@lists.openembedded.org;
	Sat, 04 Jan 2014 16:12:30 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 16:12:30 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 16:12:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 04 Jan 2014 16:14:43 +0100
Message-ID: <la98c9$n4j$1@ger.gmane.org>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][for-dylan][PATCH 0/9] Dylan backports
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
X-List-Received-Date: Sat, 04 Jan 2014 15:12:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Jansa schreef op 04-01-14 12:13:
> The following changes since commit
> 44754206632dd5b0725aeb43e99e4ff9e0245dca:
> 
> net-snmp: Backport fix for NETSNMP_NO_SYSTEMD typos (2013-10-10 21:30:38
> +0200)
> 
> are available in the git repository at:
> 
> git://git.openembedded.org/meta-openembedded-contrib
> jansa/dylan-backports 
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/dylan-backports
>
>  Martin Jansa (9): tbb: Disable thumb rfkill: Fix build when WORKDIR is
> included in some git checkout cifs-utils: Add PACKAGECONFIG for
> cifscreds, cifsupcall gateone: Drop allarch mime-support: Drop allarch 
> zram: Drop allarch usb-modeswitch-data: Exclude SIGGEN dependency on
> usb-modeswitch fbset-modes: Explicitly set MACHINE_ARCH tvheadend:
> Disable dvdscan

All these look OK to me for dylan

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSyCVjMkyGM64RGpERAmaOAJ0QUbKWiz3CpiGkx10GjnAvteL79wCeKUGV
o6+SAXguLS6oADcWcDYdR08=
=rYts
-----END PGP SIGNATURE-----


