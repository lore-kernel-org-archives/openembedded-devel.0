Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJmxs-0002gR-1r for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 15:27:04 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJmvE-0003SU-Pm for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 15:24:20 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 15:24:20 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 15:24:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 May 2011 15:24:08 +0200
Message-ID: <iqbe9o$v9h$1@dough.gmane.org>
References: <1305031350-28805-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305031350-28805-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] dnsmasq(-dbus): import from oe.dev, needed for connman now
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
X-List-Received-Date: Tue, 10 May 2011 13:27:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-05-11 14:42, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../dnsmasq/dnsmasq-dbus_2.55.bb                   |   13 +
>  meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc   |   29 ++
>  .../recipes-connectivity/dnsmasq/dnsmasq_2.55.bb   |    4 +
>  .../dnsmasq/files/dnsmasq.conf                     |  293 ++++++++++++++++++++
>  meta-oe/recipes-connectivity/dnsmasq/files/init    |   52 ++++
>  5 files changed, 391 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb
>  create mode 100644 meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
>  create mode 100644 meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb
>  create mode 100755 meta-oe/recipes-connectivity/dnsmasq/files/dnsmasq.conf
>  create mode 100644 meta-oe/recipes-connectivity/dnsmasq/files/init

Applied, thanks!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNyTx3MkyGM64RGpERAgn8AKCANAcq7HKjcFVj8tBBzWerk0PLvQCfcWJM
CNAApVbeE2jK5uXv7Zl13W8=
=lWG9
-----END PGP SIGNATURE-----



