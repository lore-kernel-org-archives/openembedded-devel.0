Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OKsZm-0002IC-4p for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 14:34:11 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OKsVe-0002an-69 for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 14:29:54 +0200
Received: from ip5451781a.direct-adsl.nl ([84.81.120.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 14:29:54 +0200
Received: from k.kooi by ip5451781a.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 14:29:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 05 Jun 2010 14:29:44 +0200
Message-ID: <hudfvo$o1s$1@dough.gmane.org>
References: <1275717767-28870-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip5451781a.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <1275717767-28870-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008-preferred-versions.inc: Set 1.11 PREFERRED_VERSION for automake-native
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
X-List-Received-Date: Sat, 05 Jun 2010 12:34:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-06-10 08:02, Khem Raj wrote:
> This patch would be needed for angstrom after the gettext 0.18 patches
> are pushed.
> I have booted a angstrom-2008.1 minimal-image successfully on qemuarm.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  .../include/angstrom-2008-preferred-versions.inc   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
> index 94beffb..2779504 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -5,7 +5,7 @@ require conf/distro/include/angstrom-codec-engine-${CE_VERSION}-preferred-versio
>  
>  PREFERRED_VERSION_autoconf = "2.65"
>  PREFERRED_VERSION_autoconf-native = "2.65"
> -PREFERRED_VERSION_automake-native = "1.10.3"
> +PREFERRED_VERSION_automake-native = "1.11"
>  PREFERRED_VERSION_busybox 	= "1.13.2"
>  PREFERRED_VERSION_cairo		= "1.8.10"
>  PREFERRED_VERSION_dbus 		= "1.2.24"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMCkM4MkyGM64RGpERAjfBAJ9sGVj43V0qHXTPCEb3EctgKrC1JACgoi6G
eMqlc35iSOS2XbRMcOdFAiM=
=3L9B
-----END PGP SIGNATURE-----



