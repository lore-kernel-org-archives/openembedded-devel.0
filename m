Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MQK5q-0007Ee-Nn
	for openembedded-devel@openembedded.org; Mon, 13 Jul 2009 13:53:14 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MQJt4-0007jL-Jw
	for openembedded-devel@openembedded.org; Mon, 13 Jul 2009 11:40:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 13 Jul 2009 11:40:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 13 Jul 2009 11:40:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 13 Jul 2009 13:35:11 +0200
Message-ID: <h3f65f$f0j$2@ger.gmane.org>
References: <1247207049-7291-1-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090708 Shredder/3.0b3pre
In-Reply-To: <1247207049-7291-1-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] opkg*: bump to r215 to fix segfaults on upgrade
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
X-List-Received-Date: Mon, 13 Jul 2009 11:53:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10-07-09 08:24, Koen Kooi wrote:
> From: Koen Kooi<koen@openembedded.org>

ping

>
>
> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   conf/distro/include/sane-srcrevs.inc |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
> index 6369462..7116c22 100644
> --- a/conf/distro/include/sane-srcrevs.inc
> +++ b/conf/distro/include/sane-srcrevs.inc
> @@ -185,9 +185,9 @@ SRCREV_pn-openmoko-toolchain-scripts ?= "4913"
>   SRCREV_pn-openmoko-worldclock2 ?= "3365"
>   SRCREV_pn-openocd ?= "517"
>   SRCREV_pn-openocd-native ?= "517"
> -SRCREV_pn-opkg ?= "209"
> -SRCREV_pn-opkg-native ?= "209"
> -SRCREV_pn-opkg-sdk ?= "209"
> +SRCREV_pn-opkg ?= "215"
> +SRCREV_pn-opkg-native ?= "215"
> +SRCREV_pn-opkg-sdk ?= "215"
>   SRCREV_pn-opkg-utils ?= "4578"
>   SRCREV_pn-opkg-utils-native ?= "4595"
>   SRCREV_pn-oprofileui ?= "173"




