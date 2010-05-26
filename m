Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OHHqG-0005mJ-4e
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 16:44:21 +0200
Received: from p5b035a88.dip.t-dialin.net ([91.3.90.136] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OHHmF-0007AQ-PS by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 16:40:14 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OHAQM-0007Qm-IY
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:49:06 +0200
Date: Wed, 26 May 2010 08:49:06 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526064906.GG22917@excalibur.local>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
	<1274854676-5931-3-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1274854676-5931-3-git-send-email-koen@openembedded.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_06_12,SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/7] Usermanual/features: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 14:44:21 -0000
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
>  docs/usermanual/chapters/features.xml |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/usermanual/chapters/features.xml b/docs/usermanual/chapters/features.xml
> index 3cbf1d8..0b82378 100644
> --- a/docs/usermanual/chapters/features.xml
> +++ b/docs/usermanual/chapters/features.xml
> @@ -22,9 +22,9 @@
>      <para>Run-time Dependencies (<command>RDEPENDS</command>) will be added
>      when packaging the software. They should only contain the minimal
>      dependencies to run the program. OpenEmbedded will analyze each packaged
> -    binary and search for <command>SO_NEEDED</command> libraries. The
> -    libraries are absolutely required by the program then OpenEmbedded is
> -    searching for packages that installs these libraries. these packages are
> +    binary and search for <command>SO_NEEDED</command> libraries. These
> +    libraries are absolutely required by the program so OpenEmbedded will
> +    search for packages that installs these libraries. These packages are
>      automatically added to the <command>RDEPENDS</command>. As a packager you
>      don't need to worry about shared libraries anymore they will be added
>      automatically.</para>
> @@ -52,9 +52,9 @@ BBFILE_PRIORITY_local = "10"
>      <title>Task-base <anchor id="task-base" /></title>
>  
>      <para>Task-base is new way of creating basic root filesystems. Instead of
> -    having each machine setting a ton of duplicate variables, this allow a
> +    having each machine setting a ton of duplicate variables, this allows a
>      machine to specify its features and <command>task-base</command> builds it
> -    a customised package based on what the machine needs along with what the
> +    a customized package based on what the machine needs along with what the
>      distro supports.</para>
>  
>      <para>To illustrate, the distro config file can say: <screen>
> -- 
> 1.7.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


