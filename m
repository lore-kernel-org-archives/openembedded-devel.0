Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ua2K3-0004h9-Qh for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 13:14:13 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ua22c-0003jG-9b for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 12:56:10 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 May 2013 12:56:10 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 May 2013 12:56:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 May 2013 12:55:57 +0200
Message-ID: <kmdavo$etd$1@ger.gmane.org>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-oe/meta-gnome 00/15] outstanding patches with fixes
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
X-List-Received-Date: Wed, 08 May 2013 11:14:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-05-13 00:41, Andreas Müller schreef:
> [01-03] further glib 2.36 [04-05] reanimate gnome-terminal [06-11]
> pdf-viewer [11-15] postinst improvements
> 
> The following changes since commit
> 8fec906a4584f9cbc467fb0e406bb6a705848b64:
> 
> smartmontools: import from OE classic (2013-05-07 18:59:01 +0200)
> 
> are available in the git repository at: 
> git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git
> fixes-here-and-there
> 
> Andreas Müller (15): libbonobo: fix build with glib 2.36 libbonobo:
> remove unreferenced patch gnome-vfs: fix build with glib 2.36 
> gnome-terminal: move out of nonworking gnome-terminal: update to 2.30.2 
> poppler: remove unrecognized configure options poppler: merge include
> files into poppler - only poppler requires them poppler: update to
> 0.22.3 poppler-data: update to 0.4.6 and stylize a bit epdfview: move to
> nonworking evince: fix/remove postinst by inheriting gsettings dconf:
> fix/remove postinst by inheriting gsettings proftpd: remove postinst -
> directory can be setup offline in do_install gnome-panel: let
> gconf.bblass take care for postinst rp-pppoe: move chmod form postinst to
> offline do_install

These look good to me, can we also include them in the dylan branch?



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRii89MkyGM64RGpERAuFyAKCe3bShKqEFiMEMdMYwUtq9uQizzACfRa+j
y9qzIKPi0EQQlKRdazd1kMo=
=uHZj
-----END PGP SIGNATURE-----



