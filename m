Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pebnb-0006dA-KY
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 00:14:15 +0100
Received: by mail-px0-f175.google.com with SMTP id 17so722220pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jan 2011 15:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=zJDCYgMovddz3T7nWhyEt9+1GVx6Q2VzdSjhzix9q98=;
	b=oyop85CWcmnwFMDKqySe9nbBYoDsrWv9fw0j6CPvipMe7iOUAtr4jUTWzqTmjLZkOF
	i7NosI/jw3k9Rn41NhNi0xfRNzj9XM+PTQGmIn61/8UJPCxmrEBuK4GQDhBFnnnjxHDk
	EQsoaUszmYAwLn1VrH2UDSEN5CtyKSHa9q+m0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=fZ/s/heM25xFd7YLTBuALPeFWnuUxrN1D5696Ho0VtrnNl+3Zxbz1nc1Kky9alZIbW
	gq5JkFNRzbDPTUF4ybXXmgPFR+3PtzcjoLjn+oxkQKyfuvRWibCxKoR66Zu/iz4gn96L
	3GadGhrj6yjl2C/9nUb0tZLfAlbkvE2GvEWPc=
Received: by 10.142.237.2 with SMTP id k2mr2913352wfh.438.1295219620850;
	Sun, 16 Jan 2011 15:13:40 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w42sm5668197wfh.3.2011.01.16.15.13.39
	(version=SSLv3 cipher=RC4-MD5); Sun, 16 Jan 2011 15:13:40 -0800 (PST)
Message-ID: <4D337BA4.5080404@gmail.com>
Date: Sun, 16 Jan 2011 15:13:40 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295215324-10460-1-git-send-email-eric@eukrea.com>
	<1295215324-10460-2-git-send-email-eric@eukrea.com>
In-Reply-To: <1295215324-10460-2-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 2/4] slugos: prefer busybox 1.18.2
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
X-List-Received-Date: Sun, 16 Jan 2011 23:14:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/16/2011 2:02 PM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> Cc: Mike Westerhof<mike@mwester.net>


Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>   conf/distro/include/preferred-slugos-versions.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
> index 83c09e3..4649c90 100644
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -26,7 +26,7 @@ PREFERRED_VERSION_autoconf			?= "2.65"
>   PREFERRED_VERSION_autoconf-native		?= "2.65"
>   PREFERRED_VERSION_automake			?= "1.11.1"
>   PREFERRED_VERSION_automake-native		?= "1.11.1"
> -PREFERRED_VERSION_busybox			?= "1.18.1"
> +PREFERRED_VERSION_busybox			?= "1.18.2"
>   PREFERRED_VERSION_dbus				?= "1.4.1"
>   PREFERRED_VERSION_glib-2.0			?= "2.26.1"
>   PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"



