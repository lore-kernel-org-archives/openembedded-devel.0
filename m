Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1M5fMU-0000yx-W3
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 May 2009 14:21:03 +0200
Received: by ewy20 with SMTP id 20so3399292ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2009 05:13:51 -0700 (PDT)
Received: by 10.210.36.8 with SMTP id j8mr2111012ebj.44.1242562431321;
	Sun, 17 May 2009 05:13:51 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 5sm4458240eyf.38.2009.05.17.05.13.50
	(version=SSLv3 cipher=RC4-MD5); Sun, 17 May 2009 05:13:50 -0700 (PDT)
Message-ID: <4A0FFF7D.9090001@xora.org.uk>
Date: Sun, 17 May 2009 13:13:49 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A0FF622.40609@nospam.arcornews.de>
In-Reply-To: <4A0FF622.40609@nospam.arcornews.de>
X-Enigmail-Version: 0.95.0
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
X-List-Received-Date: Sun, 17 May 2009 12:21:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
>
> ---
>
> The old GENTOO_MIRROR URL is 404.  Patch should go to .dev and then to
> .stable
>
>   conf/bitbake.conf |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 95ee9c6..5d4ec2b 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -508,7 +508,7 @@ E_URI = "http://enlightenment.freedesktop.org/files"
>   FREEBSD_MIRROR = "ftp://ftp.freebsd.org/pub/FreeBSD/"
>   FREEDESKTOP_CVS = "cvs://anoncvs:anoncvs@anoncvs.freedesktop.org/cvs"
>   FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
> -GENTOO_MIRROR =
> "http://distro.ibiblio.org/pub/linux/distributions/gentoo/distfiles"
> +GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
>   GNOME_GIT = "git://git.gnome.org"
>   GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
>   GNU_MIRROR = "ftp://ftp.gnu.org/gnu"
>
Acked for .dev

I'm not a stable developer so Ill leave that for someone else.

Graeme



