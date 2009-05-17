Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M5eqL-00083w-Ex
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 13:47:49 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M5ejQ-0004Gr-Fr
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 11:40:40 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 11:40:40 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 11:40:40 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 17 May 2009 13:40:29 +0200
Message-ID: <guot3d$gr3$1@ger.gmane.org>
References: <4A0FF622.40609@nospam.arcornews.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <4A0FF622.40609@nospam.arcornews.de>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH][STABLE] bitbake.conf: update GENTOO_MIRROR setting. (Closes: #5054)
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
X-List-Received-Date: Sun, 17 May 2009 11:47:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-05-09 13:33, Rolf Leggewie wrote:
> From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>

NAK, this isn't in .dev yet. Only propose fixes that are already in .dev

>
> ---
>
> The old GENTOO_MIRROR URL is 404. Patch should go to .dev and then to
> .stable
>
> conf/bitbake.conf | 2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 95ee9c6..5d4ec2b 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -508,7 +508,7 @@ E_URI = "http://enlightenment.freedesktop.org/files"
> FREEBSD_MIRROR = "ftp://ftp.freebsd.org/pub/FreeBSD/"
> FREEDESKTOP_CVS = "cvs://anoncvs:anoncvs@anoncvs.freedesktop.org/cvs"
> FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
> -GENTOO_MIRROR =
> "http://distro.ibiblio.org/pub/linux/distributions/gentoo/distfiles"
> +GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
> GNOME_GIT = "git://git.gnome.org"
> GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
> GNU_MIRROR = "ftp://ftp.gnu.org/gnu"




