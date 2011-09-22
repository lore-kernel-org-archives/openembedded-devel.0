Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6l5Y-0000AU-NA for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:21:24 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6l0P-0000ko-Ig for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:16:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2011 17:16:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2011 17:16:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Sep 2011 17:15:51 +0200
Message-ID: <j5fjf7$k29$1@dough.gmane.org>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-xfce V2 00/13] various updates
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
X-List-Received-Date: Thu, 22 Sep 2011 15:21:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-09-11 17:06, Andreas Müller schreef:
> V1 -> V2: * patches are available in the git repository at: 
> git://gitorious.org/schnitzeltony-oe-meta/meta-xfce-update.git
> xfce-patch

awesome!

> * xfce.bbclass: ${PN} -> ${BPN} to fix native URI * xfce4-dev-tools:
> remove SRC_URI * xfce-utils: changed position of RDEPENDS_${PN} *
> gtk-xfce-engine: no RDEPENDS on cairo * thunar: update to 1.2.3 *
> xfce4-panel: update to 4.8.6
> 
> Andreas Müller (13): xfce4-dev-tools: add native support garcon: DEPENDS
> xfce4-dev-tools -> xfce4-dev-tools-native libxfce4util: DEPENDS
> xfce4-dev-tools -> xfce4-dev-tools-native xfce-utils: add openssh-misc to
> RDEPENDS_${PN} xfce4-session: Bump to version 4.8.2 garcon: Bump to
> version 0.1.9 libxfce4util: Bump to version 4.8.2 gtk-xfce-engine: Bump
> to version 2.9.0 & minor cleanup xfdesktop: Bump to version 4.8.3 &
> recreate patch xfce4-notifyd: Add initial recipe with version 0.2.2 
> task-xfce-base: add xfce4-notifyd

That one needs a PR bump, but I'll do that manually. All 13 should go in today.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOe1EnMkyGM64RGpERAraDAJ46Hza/La4PW3gYWED2Sz015wYhDwCfc7cm
IMKGmfkhnopaX8opor3b15A=
=8/R6
-----END PGP SIGNATURE-----



