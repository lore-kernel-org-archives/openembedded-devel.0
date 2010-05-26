Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OHHq2-0005db-08
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 16:44:40 +0200
Received: from p5b035a88.dip.t-dialin.net ([91.3.90.136] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OHHm1-00075v-Pu by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 16:40:00 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OHAQ9-0007QT-Uq
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:48:53 +0200
Date: Wed, 26 May 2010 08:48:53 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526064853.GF22917@excalibur.local>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
	<1274854676-5931-2-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1274854676-5931-2-git-send-email-koen@openembedded.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_06_12 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/7] Usermanual/comparing: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 14:44:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 2010-05-26 at 08:17, Koen Kooi wrote:
> From: Chase Maupin <chase.maupin@ti.com>
> 
> * Fixed up typos and other errors in the documentation.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Koen Kooi <k-kooi@ti.com>

Non-native speaker ack:
Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

> ---
>  docs/usermanual/chapters/comparing.xml |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/usermanual/chapters/comparing.xml b/docs/usermanual/chapters/comparing.xml
> index 1347010..cfdaa95 100644
> --- a/docs/usermanual/chapters/comparing.xml
> +++ b/docs/usermanual/chapters/comparing.xml
> @@ -5,13 +5,13 @@
>    <section id="comparing_buildroot">
>      <title>buildroot</title>
>  
> -    <para>Writing of <application>BitBake</application> recipes is more easy
> +    <para>Writing of <application>BitBake</application> recipes is easier
>      and more intuitive than writing Makefiles while providing higher
>      flexibility. This allows you to tweak specific recipes for your very
> -    special needs and to add new recipes very fast. You can build toolchains,
> +    special needs and to add new recipes quickly. You can build toolchains,
>      Software Distribution Kits (SDKs), complete Distributions or just single
> -    packages. The flexibility of OpenEmbedded allows you to reuse the once
> -    written recipes for many different purposes. OpenEmbedded provides
> +    packages. The flexibility of OpenEmbedded allows you to reuse recipes
> +    for many different purposes. OpenEmbedded provides 
>      everything buildroot will be able to provide. But in contrast to buildroot
>      OpenEmbedded will allow you to achieve what you really want to achieve.
>      You can add new package formats, new filesystems, new output formats
> @@ -21,11 +21,11 @@
>    <section id="comparing_crosstool">
>      <title>crosstool</title>
>  
> -    <para>Crosstool allows to create toolchains for you. It can only create
> +    <para>Crosstool allows the creation of toolchains. It can only create
>      the initial toolchain for you. It will not compile other needed libraries
> -    or applications for you, it will not be able to track dependencies or to
> +    or applications for you, it will not be able to track dependencies or
>      package them properly. OpenEmbedded supports all configurations crosstool
> -    supports. You can start to create toolchains with OpenEmbedded, then as
> +    supports. You can start by creating toolchains with OpenEmbedded, then as
>      your needs grow create a more complete SDK from already present base
>      libraries and applications and if you recognize you need to have packages
>      for the target you have them almost built already.</para>
> @@ -38,7 +38,7 @@
>      cross-compiling is hard itself but many people misuse the buildsystem they
>      use to build their software. This will lead to a variety of issues you can
>      run into. This can be failing tests on configuration because of executing
> -    cross compiled binaries or crashes at run-time due wrong sizes of basic
> +    cross compiled binaries or crashes at run-time due to wrong sizes of basic
>      types. When utilizing OpenEmbedded you avoid searching for patches at many
>      different places and will be able to get things done more quickly.
>      <application>OpenEmbedded</application> allows you to choose from a pool
> @@ -48,4 +48,4 @@
>      output formats and filesystems. This allows you to create complete and
>      specialized distributions easily.</para>
>    </section>
> -</chapter>
> \ No newline at end of file
> +</chapter>
> -- 
> 1.7.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


