Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RrXNV-0005XL-K7 for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jan 2012 17:13:17 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RrX1O-0002nc-83 for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jan 2012 16:50:26 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2012 16:50:26 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2012 16:50:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 29 Jan 2012 16:50:09 +0100
Message-ID: <jg3prg$frd$1@dough.gmane.org>
References: <1327845574-26155-1-git-send-email-schnitzeltony@googlemail.com>
	<1327845574-26155-2-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1327845574-26155-2-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-xfce 2/4] xfce4-genmon-plugin: initial add 3.3.1
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
X-List-Received-Date: Sun, 29 Jan 2012 16:13:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-01-12 14:59, Andreas Müller schreef:
> * build tested from scratch * run tested on overo
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> --- 
> .../genmon/files/port-to-libxfce4ui.patch          |  150
> ++++++++++++++++++++ .../genmon/xfce4-genmon-plugin_3.3.1.bb            |
> 11 ++ 2 files changed, 161 insertions(+), 0 deletions(-) create mode
> 100644
> meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch 
> create mode 100644
> meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.3.1.bb
> 
> diff --git
> a/meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch
> b/meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch 
> new file mode 100644 index 0000000..ebb9405 --- /dev/null +++
> b/meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch 
> @@ -0,0 +1,150 @@

> +Upstrem atatus: pending https://bugzilla.xfce.org/show_bug.cgi?id=8406

Typo :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8laq4ACgkQMkyGM64RGpEW0gCcCHLq0ilyrh1e4GxNPF3jEPmy
ZLMAniNJWXPuojV7+97xUZiSlcsSID3x
=2XhH
-----END PGP SIGNATURE-----



