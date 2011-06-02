Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QSDJN-0008Js-OY for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 21:12:13 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QSDGE-0006YL-Gg for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 21:08:50 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 21:08:50 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 21:08:50 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 02 Jun 2011 21:08:33 +0200
Message-ID: <is8n3h$p57$1@dough.gmane.org>
References: <cover.1307040582.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1307040582.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 0/2] Pull request #16
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
X-List-Received-Date: Thu, 02 Jun 2011 19:12:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks, applied

On 02-06-11 20:51, Martin Jansa wrote:
> gobject-introspection from oe-core is not compatible with glib-2.0_git
> we have here, added newer version also with D_P -1 (as glib-2.0) has.
> 
> The following changes since commit e69c7519399c06e82e25dcbfdd300e975393b00a:
> 
>   connman: enable service when using systemd (2011-06-02 16:26:04 +0200)
> 
> are available in the git repository at:
>   git://git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-oe
> 
> Martin Jansa (2):
>   gobject-introspection: add newer git version compatible with
>     glib-2.0_git
>   gobject-introspection: move to recipes-gnome to match oe-core
>     structure
> 
>  .../use-usr-bin-env-for-python.patch               |    0
>  .../gnome}/gobject-introspection_0.9.10.bb         |    0
>  .../gnome/gobject-introspection_git.bb             |   33 ++++++++++++++++++++
>  3 files changed, 33 insertions(+), 0 deletions(-)
>  rename meta-oe/{recipes-devtools/gobject-introspection => recipes-gnome/gnome}/gobject-introspection/use-usr-bin-env-for-python.patch (100%)
>  rename meta-oe/{recipes-devtools/gobject-introspection => recipes-gnome/gnome}/gobject-introspection_0.9.10.bb (100%)
>  create mode 100644 meta-oe/recipes-gnome/gnome/gobject-introspection_git.bb
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN59+xMkyGM64RGpERAhcjAKCZuSl5whdoDQfoo3+Pp/pBczvgpACdFzs3
zxi3McxB8eFGylvGY7l8UOA=
=3I0H
-----END PGP SIGNATURE-----



