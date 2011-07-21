Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qjmpo-000892-7j for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 08:34:12 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qjmlr-0004hO-4U for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 08:30:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 08:30:07 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 08:30:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 21 Jul 2011 08:27:58 +0200
Message-ID: <j08gte$tdv$2@dough.gmane.org>
References: <cover.1311195655.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <cover.1311195655.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-gnome][PATCH 0/2] Pull request #1
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
X-List-Received-Date: Thu, 21 Jul 2011 06:34:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-07-11 23:01, Martin Jansa schreef:
> The following changes since commit 037a063303d35c2fab8097d977aa5625c916c565:
> 
> connman: update to 0.76 (2011-07-20 09:13:00 +0200)
> 
> are available in the git repository at: git://git.openembedded.org/meta-openembedded-contrib jansa/meta-gnome http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-gnome
> 
> Martin Jansa (2): libgnome-keyring: inherit perlnative gconf: inherit perlnative
> 
> meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb     |    2 +- .../libgnome/libgnome-keyring_2.32.0.bb            |    2 +- 2 files changed, 2 insertions(+), 2 deletions(-)
> 

Thanks, I pulled these in and will push to the OE servers once ssh gets fixed. In the meantime, it's at github: https://github.com/koenkooi/meta-oe/commits/master
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOJ8buMkyGM64RGpERArnjAKCuNBbkNg1PJo9wO9JHpoq9cPqp+QCdGpte
BQtJQESmf282JTqLTYF6RiE=
=lYLn
-----END PGP SIGNATURE-----



