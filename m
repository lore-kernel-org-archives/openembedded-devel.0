Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PuTWh-0003xy-Qd for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 18:38:23 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PuTVK-0000kv-7j for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 18:36:58 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 18:36:58 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 18:36:58 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 01 Mar 2011 18:36:46 +0100
Message-ID: <ikjare$nk1$1@dough.gmane.org>
References: <1298991314-11065-1-git-send-email-stefan@buglabs.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1298991314-11065-1-git-send-email-stefan@buglabs.net>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] angstrom-jalimo.conf: Bump openjdk version to include security and build fixes
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
X-List-Received-Date: Tue, 01 Mar 2011 17:38:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-03-11 15:55, Stefan Schmidt wrote:
> 
> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
>  conf/distro/include/angstrom-jalimo.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
> index 76cd5f1..9ba4c70 100644
> --- a/conf/distro/include/angstrom-jalimo.conf
> +++ b/conf/distro/include/angstrom-jalimo.conf
> @@ -22,7 +22,7 @@ PREFERRED_VERSION_jamvm = "1.5.2"
>  PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk"
>  PREFERRED_PROVIDER_classpath = "classpath"
>  
> -PREFERRED_VERSION_openjdk-6-jre = "6b18-1.8"
> +PREFERRED_VERSION_openjdk-6-jre = "6b18-1.8.5"
>  PREFERRED_VERSION_icedtea6-native = "1.7.6"
>  
>  # Stage JAR files not into ARCH related dirs

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNbS6tMkyGM64RGpERApIpAJ9Wm910RBhAKlsbPWFasi55GykyTQCgnHQA
Hxo73vFcdPPs8eZIrLnGqpI=
=VtmY
-----END PGP SIGNATURE-----



