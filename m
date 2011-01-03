Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PZpPL-0002e3-6P for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 19:45:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PZpOy-0003bJ-Pt for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 19:45:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 19:45:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 19:45:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 03 Jan 2011 19:42:19 +0100
Message-ID: <ift5ab$9rf$2@dough.gmane.org>
References: <1294062372-16433-1-git-send-email-m-watkins@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294062372-16433-1-git-send-email-m-watkins@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] ti-pru-sw: Update SRC_REV
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
X-List-Received-Date: Mon, 03 Jan 2011 18:45:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-01-11 14:46, Melissa Watkins wrote:
> For the ti-pru-sw-examples, ti-pru-sw-app-loader, ti-pru-sw-edma-driver,
> ti-pru-sw-edma-library:
> 
> * Bump PR
> * Update SRC_REV
> 
> Signed-off-by: Melissa Watkins <m-watkins@ti.com>
> ---
>  recipes/ti/ti-pru-sw-app-loader_1.00.00.bb   |    4 ++--
>  recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb  |    2 +-
>  recipes/ti/ti-pru-sw-edma-library_1.00.00.bb |    4 ++--
>  recipes/ti/ti-pru-sw-examples_1.00.00.bb     |    4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
> index 6b7514d..394862e 100644
> --- a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
> +++ b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
> @@ -1,13 +1,13 @@
>  DESCRIPTION = "PRU sw application loader"
>  HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
>  LICENSE = "BSD"
> -PR = "r1+svnr${SRCPV}"
> +PR = "r2+svnr${SRCPV}"

Any special reason for bumping both SRCREV and PR?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNIhiLMkyGM64RGpERApMtAJ9sebeEMk1afbE5ikXDmq07EdxVYQCePMJA
zWmzZ9I6Agj/zeJOsHeh7Mg=
=1Xcu
-----END PGP SIGNATURE-----



