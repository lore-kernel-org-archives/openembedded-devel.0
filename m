Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QypJU-0002g6-JU for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 20:15:00 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QypEk-0003nd-Ve for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 20:10:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 20:10:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 20:10:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 31 Aug 2011 20:05:18 +0200
Message-ID: <j3lt4u$gb3$2@dough.gmane.org>
References: <1314807853-3174-1-git-send-email-schnitzeltony@gmx.de>
	<1314807853-3174-2-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1314807853-3174-2-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-xfce][PATCH v2 1/1] thunar-volman: Add initial recipe with version 0.6.0
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
X-List-Received-Date: Wed, 31 Aug 2011 18:15:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-08-11 18:24, Andreas Müller schreef:
> * build & partially run tested on overo

applied, thanks!

> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmx.de> --- 
> .../thunar-volman/thunar-volman_0.6.0.bb           |   10 ++++++++++ 1
> files changed, 10 insertions(+), 0 deletions(-) create mode 100644
> meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
> 
> diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
> b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb new file
> mode 100644 index 0000000..377561c --- /dev/null +++
> b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb @@ -0,0
> +1,10 @@ +DESCRIPTION = "Automatic management of removable drives and
> media for thunar" +SECTION = "x11" +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" +DEPENDS = "exo
> gtk+ libxfce4ui libxfce4util xfconf libnotify" + +inherit xfce + 
> +SRC_URI[md5sum] = "2f166662dd100d5195da238af417f305" +SRC_URI[sha256sum]
> = "b1afd2b3b285cfcf07c11caa3d37fa5ff1fc06f7dc68fcca07f9a0d70daa694f"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXnfeMkyGM64RGpERAl94AJ4raJIgDgg6TCbxZaHVsoD6eKPEvACglMGy
7LUxQX5t2Z875mYPCwbywAE=
=Ejcr
-----END PGP SIGNATURE-----



