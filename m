Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SxlFi-0007Ob-Hq for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 22:47:15 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sxl4O-0004nv-GC for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 22:35:32 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 22:35:32 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 22:35:32 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 04 Aug 2012 22:35:18 +0200
Message-ID: <jvk125$nh$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
	<6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
	<jvggnd$naj$1@dough.gmane.org>
	<CAMKF1sqqyahA8QXH2eOo0SPM-vRtygE1iiyOWMLanV=mGxLfNg@mail.gmail.com>
	<jvgr60$ig7$1@dough.gmane.org>
	<CAMKF1spLej1gvXiSYX_OfqhaFK0D2bLZ-hi-8HGHiTUVG9V29w@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CAMKF1spLej1gvXiSYX_OfqhaFK0D2bLZ-hi-8HGHiTUVG9V29w@mail.gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Sat, 04 Aug 2012 20:47:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-08-12 22:10, Khem Raj schreef:
> On Fri, Aug 3, 2012 at 8:36 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> Move gitpkgv into oe-core
> 
> OK until I fight moving it into OE-Core :) , I have sent a V4 of patchset
> which creates a copy of gitpkgv.bbclass in meta-systemd. I believe it
> will be short lived. Please take a look at them and install if ok

Can't you just symlink it from meta-oe? It will be in the same git repo
anyway. That would avoid having 2 copies.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQHYeGMkyGM64RGpERAgWIAJ9xNd5O/3TMfJCzt4yjP0/Er5JrfwCgg5pp
jDXWDi0yfnZ9IjX0uF5x0Z4=
=LkJ4
-----END PGP SIGNATURE-----



