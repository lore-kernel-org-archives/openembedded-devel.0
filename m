Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6Gt3-0004ob-Qr for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 09:06:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6Gnx-0006bL-Mw for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 09:01:13 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 09:01:13 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 09:01:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 21 Sep 2011 09:01:00 +0200
Message-ID: <j5c23c$k7e$1@dough.gmane.org>
References: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-xfce 00/11] various updates
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
X-List-Received-Date: Wed, 21 Sep 2011 07:06:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-09-11 08:11, Andreas Müller schreef:
> * xfce4-dev-tools mainly contain autoconf extensions -> native * bump to
> latest mainline versions * xfce4-notifyd added
> 
> The recipes were build tested and run tested on overo.
> 
> Andreas Müller (11): xfce4-dev-tools: add native support garcon: DEPENDS
> xfce4-dev-tools -> xfce4-dev-tools-native libxfce4util: DEPENDS
> xfce4-dev-tools -> xfce4-dev-tools-native xfce-utils: add openssh-misc to
> RDEPENDS_${PN} xfce4-session: Bump to version 4.8.2 garcon: Bump to
> version 0.1.9 libxfce4util: Bump to version 4.8.2 gtk-xfce-engine: Bump
> to version 2.9.0 & minor cleanup xfdesktop: Bump to version 4.8.3 &
> recreate patch xfce4-notifyd: Add initial recipe with version 0.2.2 
> task-xfce-base: add xfce4-notifyd

Do you have a git repo were there can be pulled from?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOeYusMkyGM64RGpERAsJoAJ9rneOoFcu2WwjWRWlBnC3hBmPVVwCgj7j9
YTeGg0rmZwI578nPmy2bSIM=
=+x1d
-----END PGP SIGNATURE-----



