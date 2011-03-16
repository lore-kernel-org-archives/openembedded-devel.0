Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pzupe-00052j-Sk
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 18:48:27 +0100
Received: by pzk35 with SMTP id 35so292069pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 10:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ncrlPgQmWvQZbqwofTM8r1RU6oo2Y9VwRk41y67T6c8=;
	b=BL/B4tqzNK3SP9oaOD4dfKrGsIxWwiRlbqtqdXk5uQRWgFZeYZaOhqRt1a3UJ2WIkR
	sYZfLO1CRkkbXUI7cdjERhqhs0/IZEkyDkb1c0rofJsUpjEgZdFvIHc9DTbVhgpxJf80
	yS+aUDoNhDsLcXnDkMUd3GHR/eS4/kHJiDZ+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=GyokqBs4mfOl1hkw/FxtyJAIqBkKnR1V4y5Jmw6DSvnKDB7CzU7MBuvhSJOEGJdQrq
	MyYYL/CnK7Olye5Gjqk62ivp9qXAC/wQoxggBcp+itXTnCkV3TpFlCzGjF2IVOwF1j7+
	YtpVQbmiOUmV6G5intA9z+MDtbJwLua1/NTFY=
Received: by 10.143.20.3 with SMTP id x3mr170667wfi.159.1300297598230;
	Wed, 16 Mar 2011 10:46:38 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n4sm1414336wfl.14.2011.03.16.10.46.36
	(version=SSLv3 cipher=OTHER); Wed, 16 Mar 2011 10:46:36 -0700 (PDT)
Message-ID: <4D80F76E.9030606@gmail.com>
Date: Wed, 16 Mar 2011 10:46:22 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300272884-24220-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300272884-24220-3-git-send-email-heinold@inf.fu-berlin.de>
In-Reply-To: <1300272884-24220-3-git-send-email-heinold@inf.fu-berlin.de>
Subject: Re: [PATCH 2/4] cacao-hg: update to latest revision
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
X-List-Received-Date: Wed, 16 Mar 2011 17:48:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/2011 3:54 AM, Henning Heinold wrote:
> From: Henning Heinold<h.heinold@tarent.de>
>

Your signoff is missing. You might want o bump PR too

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   recipes/cacao/cacao-native_hg.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/cacao/cacao-native_hg.bb b/recipes/cacao/cacao-native_hg.bb
> index 0f0df64..6ece8dd 100644
> --- a/recipes/cacao/cacao-native_hg.bb
> +++ b/recipes/cacao/cacao-native_hg.bb
> @@ -3,7 +3,7 @@ require cacao-native.inc
>   PV = "1.1.0+hgr${SRCPV}"
>   PR = "r2"
>
> -SRCREV = "1ac977fe271c"
> +SRCREV = "c7bf150bfa46"
>   SRC_URI = "hg://mips.complang.tuwien.ac.at/hg/;module=cacao;rev=${SRCREV}"
>
>   S = "${WORKDIR}/cacao"



