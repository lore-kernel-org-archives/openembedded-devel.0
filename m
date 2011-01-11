Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PcaDN-0001ek-7j for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 10:08:29 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PcaCq-0003Ji-Ua for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 10:07:56 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 10:07:56 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 10:07:56 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 11 Jan 2011 10:07:45 +0100
Message-ID: <igh6l1$r9$1@dough.gmane.org>
References: <1294695225-16321-1-git-send-email-eric@eukrea.com>	<1294695225-16321-2-git-send-email-eric@eukrea.com>
	<1294695225-16321-3-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294695225-16321-3-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] angstrom-2010: prefer busybox-1.18.1
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
X-List-Received-Date: Tue, 11 Jan 2011 09:08:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-01-11 22:33, Eric Bénard wrote:
> this is the latest stable version
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  .../include/angstrom-2010-preferred-versions.inc   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index a36cb21..4549bfa 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -13,7 +13,7 @@ PREFERRED_VERSION_autoconf = "2.65"
>  PREFERRED_VERSION_autoconf-native = "2.65"
>  PREFERRED_VERSION_automake = "1.11.1"
>  PREFERRED_VERSION_automake-native = "1.11.1"
> -PREFERRED_VERSION_busybox 	= "1.17.4"
> +PREFERRED_VERSION_busybox 	= "1.18.1"
>  PREFERRED_VERSION_cairo		= "1.10.0"
>  PREFERRED_VERSION_dbus 		= "1.2.24"
>  PREFERRED_VERSION_dropbear      = "0.52"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNLB3hMkyGM64RGpERAmB6AJ0UhjnCZzZh06A8Xj0F1J7VXuSUYgCgkk46
3g6kpG4t9mKPnjc0nqTUziM=
=NB7D
-----END PGP SIGNATURE-----



