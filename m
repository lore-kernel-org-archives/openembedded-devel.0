Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OamuP-0001pf-NX for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 11:45:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OamuG-00070A-7n for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 11:45:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 11:45:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 11:45:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 19 Jul 2010 11:39:59 +0200
Message-ID: <i216hf$pju$2@dough.gmane.org>
References: <1279450479-11207-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1279450479-11207-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-jalimo: fix openjdk-6-jre preferred version
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
X-List-Received-Date: Mon, 19 Jul 2010 09:45:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <k-kooi@ti.com>

On 18-07-10 12:54, Martin Jansa wrote:
> ---
>  conf/distro/include/angstrom-jalimo.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
> index effde60..2aed63b 100644
> --- a/conf/distro/include/angstrom-jalimo.conf
> +++ b/conf/distro/include/angstrom-jalimo.conf
> @@ -22,7 +22,7 @@ PREFERRED_VERSION_jamvm = "1.5.2"
>  PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk"
>  PREFERRED_PROVIDER_classpath = "classpath"
>  
> -PREFERRED_VERSION_openjdk-6-jre = "6b18"
> +PREFERRED_VERSION_openjdk-6-jre = "6b18-1.8"
>  PREFERRED_VERSION_icedtea6-native = "1.7.3"
>  
>  # Stage JAR files not into ARCH related dirs

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMRB1vMkyGM64RGpERAtP2AKCJr9A1Vtq2RDZcK730k1taZWfHdgCfYa9v
xBLzSxAQze2M3Zf32zwlwE8=
=AvQZ
-----END PGP SIGNATURE-----



