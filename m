Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qyf5v-0007yr-Fq for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 09:20:19 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qyf16-0000zo-Gc for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 09:15:20 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 09:15:20 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 09:15:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 31 Aug 2011 09:15:03 +0200
Message-ID: <j3kn1n$tqr$1@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-xfce] thunar-volman: Add initial recipe with version 0.6.0
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
X-List-Received-Date: Wed, 31 Aug 2011 07:20:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-08-11 01:06, Andreas Müller schreef:
> * build & partially run tested on overo
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmx.de> --- .../thunar-volman/thunar-volman_0.6.0.bb           |   12 ++++++++++++ 1 files changed, 12 insertions(+), 0 deletions(-) create mode 100644 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
> 
> diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb new file mode 100644 index 0000000..ad11d84 --- /dev/null +++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb @@ -0,0 +1,12 @@ +DESCRIPTION =
> "Automatic management of removable drives and media for thunar" +SECTION = "x11" +LICENSE = "GPLv2" +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" +DEPENDS = "exo gtk+ libxfce4ui libxfce4util xfconf libnotify" + +PR = "r0"

please remove PR in new recipes
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXd93MkyGM64RGpERAkUGAJ46wom0rFseqaFM70VY/N+2k2oN/ACfUX8U
Y5VegGQ0zBN2aQCwuik9LeQ=
=70Pp
-----END PGP SIGNATURE-----



