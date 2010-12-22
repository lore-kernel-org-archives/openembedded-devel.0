Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVUW0-0005jB-Ud for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 20:38:25 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVUVr-0001kr-AS for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 20:38:15 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 20:38:15 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 20:38:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Dec 2010 20:38:02 +0100
Message-ID: <ietk2q$jdr$1@dough.gmane.org>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1293016481-703-1-git-send-email-koen@openembedded.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 19:38:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-12-10 12:14, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  conf/sanity.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/sanity.conf b/conf/sanity.conf
> index 0f53cb2..1c83c14 100644
> --- a/conf/sanity.conf
> +++ b/conf/sanity.conf
> @@ -3,7 +3,7 @@
>  # See sanity.bbclass
>  #
>  # Expert users can confirm their sanity with "touch conf/sanity.conf"
> -BB_MIN_VERSION = "1.8.18"
> +BB_MIN_VERSION = "1.10.0"
>  
>  SANITY_ABIFILE = "${TMPDIR}/abi_version"
>  SANITY_PRFILE = "${TMPDIR}/distro_pr"

If people are agreeing, can I get some Acked-by lines please?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNElOaMkyGM64RGpERAgvLAJ9CFKK5yUiCxG7H4tcRq2OKpDDb1QCfSHz3
7fCKAbIj8QYD8XO8IoJg2Nc=
=ZtSj
-----END PGP SIGNATURE-----



