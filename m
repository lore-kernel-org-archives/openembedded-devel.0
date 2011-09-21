Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6HBN-0005K8-BR for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 09:25:25 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6H6G-0005i9-PM for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 09:20:08 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 09:20:08 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 09:20:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 21 Sep 2011 09:15:14 +0200
Message-ID: <j5c2u2$nn1$3@dough.gmane.org>
References: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
	<1316585520-18605-9-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1316585520-18605-9-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-xfce 08/11] gtk-xfce-engine: Bump to version 2.9.0 & minor cleanup
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
X-List-Received-Date: Wed, 21 Sep 2011 07:25:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-09-11 08:11, Andreas Müller schreef:
> * Added xfce4-dev-tools-native to DEPENDS error message was |
> gtk-xfce-engine-2.9.0/configure: line 12041: syntax error near unexpected
> token `GTK,' | gtk-xfce-engine-2.9.0/configure: line 12041:
> `XDT_CHECK_PACKAGE(GTK, gtk+-2.0, 2.20.0)' * Added cairo to
> RDEPENDS_${PN} see [1]
> 
> [1] http://mail.xfce.org/pipermail/xfce/2011-September/029144.html

Cairo is a library, so the shlib resolver should pick it up automagically,
isn't it doing that?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOeY8CMkyGM64RGpERAvbUAKCgspKj7SxillxZ4FhaBZSrE7VgUwCfTASW
h+Ds9Xa5Nuy9hCmlshYuVJY=
=6W1g
-----END PGP SIGNATURE-----



