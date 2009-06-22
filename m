Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MIgZD-0000n4-S0
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:15:59 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MIgOc-0007wO-Fd
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 10:05:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 10:05:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 10:05:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Jun 2009 12:04:20 +0200
Message-ID: <h1nkv4$vdi$4@ger.gmane.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-2-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245664435-30183-2-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 025/125] alsa-lib: This is LGPL not GPL
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
X-List-Received-Date: Mon, 22 Jun 2009 10:16:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-06-09 11:53, Marcin Juszkiewicz wrote:
> From: Tom Rini<trini@embeddedalley.com>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/alsa/alsa-lib_1.0.11.bb |    2 +-
>   recipes/alsa/alsa-lib_1.0.13.bb |    2 +-
>   recipes/alsa/alsa-lib_1.0.14.bb |    2 +-
>   recipes/alsa/alsa-lib_1.0.15.bb |    2 +-
>   recipes/alsa/alsa-lib_1.0.17.bb |    2 +-
>   recipes/alsa/alsa-lib_1.0.18.bb |    2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/recipes/alsa/alsa-lib_1.0.11.bb b/recipes/alsa/alsa-lib_1.0.11.bb
> index b9169e6..4d7c2e8 100644
> --- a/recipes/alsa/alsa-lib_1.0.11.bb
> +++ b/recipes/alsa/alsa-lib_1.0.11.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Alsa sound library"
>   HOMEPAGE = "http://www.alsa-project.org"
>   SECTION = "libs/multimedia"
> -LICENSE = "GPL"
> +LICENSE = "LGPL"
>   PR = "r4"
>
>   # configure.in sets -D__arm__ on the command line for any arm system
> diff --git a/recipes/alsa/alsa-lib_1.0.13.bb b/recipes/alsa/alsa-lib_1.0.13.bb
> index 860ef11..03ab74f 100644
> --- a/recipes/alsa/alsa-lib_1.0.13.bb
> +++ b/recipes/alsa/alsa-lib_1.0.13.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Alsa sound library"
>   HOMEPAGE = "http://www.alsa-project.org"
>   SECTION = "libs/multimedia"
> -LICENSE = "GPL"
> +LICENSE = "LGPL"
>   PR = "r4"
>
>   # configure.in sets -D__arm__ on the command line for any arm system
> diff --git a/recipes/alsa/alsa-lib_1.0.14.bb b/recipes/alsa/alsa-lib_1.0.14.bb
> index ba46342..284ddd9 100644
> --- a/recipes/alsa/alsa-lib_1.0.14.bb
> +++ b/recipes/alsa/alsa-lib_1.0.14.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Alsa sound library"
>   HOMEPAGE = "http://www.alsa-project.org"
>   SECTION = "libs/multimedia"
> -LICENSE = "GPL"
> +LICENSE = "LGPL"
>
>   PR = "r2"
>
> diff --git a/recipes/alsa/alsa-lib_1.0.15.bb b/recipes/alsa/alsa-lib_1.0.15.bb
> index 4cf3938..b502adb 100644
> --- a/recipes/alsa/alsa-lib_1.0.15.bb
> +++ b/recipes/alsa/alsa-lib_1.0.15.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Alsa sound library"
>   HOMEPAGE = "http://www.alsa-project.org"
>   SECTION = "libs/multimedia"
> -LICENSE = "GPL"
> +LICENSE = "LGPL"
>   PR = "r1"
>
>   # configure.in sets -D__arm__ on the command line for any arm system
> diff --git a/recipes/alsa/alsa-lib_1.0.17.bb b/recipes/alsa/alsa-lib_1.0.17.bb
> index f4ae21b..eff114d 100644
> --- a/recipes/alsa/alsa-lib_1.0.17.bb
> +++ b/recipes/alsa/alsa-lib_1.0.17.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Alsa sound library"
>   HOMEPAGE = "http://www.alsa-project.org"
>   SECTION = "libs/multimedia"
> -LICENSE = "GPL"
> +LICENSE = "LGPL"
>
>   # configure.in sets -D__arm__ on the command line for any arm system
>   # (not just those with the ARM instruction set), this should be removed,
> diff --git a/recipes/alsa/alsa-lib_1.0.18.bb b/recipes/alsa/alsa-lib_1.0.18.bb
> index f4ae21b..eff114d 100644
> --- a/recipes/alsa/alsa-lib_1.0.18.bb
> +++ b/recipes/alsa/alsa-lib_1.0.18.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Alsa sound library"
>   HOMEPAGE = "http://www.alsa-project.org"
>   SECTION = "libs/multimedia"
> -LICENSE = "GPL"
> +LICENSE = "LGPL"
>
>   # configure.in sets -D__arm__ on the command line for any arm system
>   # (not just those with the ARM instruction set), this should be removed,




