Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NV9R3-0001QI-IQ for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 21:03:24 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NV9Ns-000874-Qp
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 21:00:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 21:00:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 21:00:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Jan 2010 20:52:32 +0100
Message-ID: <hil89v$835$3@ger.gmane.org>
References: <1263313682-14996-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <1263313682-14996-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] jamvm-initial: add libffi-native dependency
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
X-List-Received-Date: Wed, 13 Jan 2010 20:03:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>


On 12-01-10 17:28, Marcin Juszkiewicz wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  recipes/jamvm/jamvm-initial_1.5.0.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/jamvm/jamvm-initial_1.5.0.bb b/recipes/jamvm/jamvm-initial_1.5.0.bb
> index 1566deb..4ef56c1 100644
> --- a/recipes/jamvm/jamvm-initial_1.5.0.bb
> +++ b/recipes/jamvm/jamvm-initial_1.5.0.bb
> @@ -2,7 +2,7 @@ SUMMARY = "A compact Java Virtual Machine which conforms to the JVM specificatio
>  HOMEPAGE = "http://jamvm.sourceforge.net/"
>  LICENSE = "GPL"
>  
> -DEPENDS = "zlib-native classpath-initial jikes-initial"
> +DEPENDS = "zlib-native classpath-initial jikes-initial libffi-native"
>  
>  PR = "r1"
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTiSAMkyGM64RGpERAmlqAKCLtk3jss2Ffa/z/pDX0Vhtj5Vn2ACfZXPD
jirCm6rzhrfOxPcbUJXCgSU=
=Mtz5
-----END PGP SIGNATURE-----



