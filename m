Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Pl06h-0002cL-Sy
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 15:24:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 6A82BA51E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Feb 2011 14:23:28 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id mmPS2X4KVCdo
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Feb 2011 14:23:27 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id CA86FA51DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Feb 2011 14:23:27 +0000 (GMT)
Message-ID: <4D4ABA94.7080403@xora.org.uk>
Date: Thu, 03 Feb 2011 14:24:20 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296741831-8096-1-git-send-email-stefan@buglabs.net>
	<1296741831-8096-2-git-send-email-stefan@buglabs.net>
In-Reply-To: <1296741831-8096-2-git-send-email-stefan@buglabs.net>
X-Enigmail-Version: 1.1.1
Subject: Re: [PATCH 02/11] xserver-nodm-init: switch to ndm-init 2.0 to get	a working matchbox session under Xorg
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
X-List-Received-Date: Thu, 03 Feb 2011 14:24:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/02/2011 14:03, Stefan Schmidt wrote:
> ---
>  .../include/angstrom-2008-preferred-versions.inc   |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
> index 67d4207..77e5e00 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -65,6 +65,7 @@ PREFERRED_VERSION_wpa-supplicant = "0.7.3"
>  PREFERRED_VERSION_wget = "1.11.4"
>  PREFERRED_VERSION_xserver-common = "1.33"
>  PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
> +PREFERRED_VERSION_xserver-nodm-init = "2.0"
>  PREFERRED_VERSION_xserver-xorg = "1.7.4"
>  
>  #
Acked-by: Graeme Gregory <dp@xora.org.uk>

G



