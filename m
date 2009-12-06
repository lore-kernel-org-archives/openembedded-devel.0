Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NHPCY-0001uH-Og
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:03:37 +0100
Received: by fxm8 with SMTP id 8so2908866fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=GXcw+PGnnCF0//JkrWRPU93tooyVdzH2NtoRxnSrK/0=;
	b=q3GConkbzaVJWlTm39Ha6BFsv4T4GGxnwoOFjgxNfkA+V5coiWgnYUQQ3Sw80dOJHi
	RkEu5sMMkDyWMl8gsWdkSbytxbNWHeSzntMy18t77ERGXJa3yNFxhzjcXGdO+h3X9quR
	FTDZHgiWnXue+y2fHrR2LpZCEjmgWHP/JDgr0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=n3QskoiZJ/d0TjHuQ2eDR5eFh40c2b73MTa9YSoxfu08zC+vA0ruPMUgmmZGTiBzlw
	1zcuYL8jS84tdsRKkWeyPgVWt4yH03mIjff/zAM/5o5u5RJ1N9d8s70CaX9VXFU7VCto
	rfT8dIr0IzArh5KsHzdevrvhid6j16dHM6tsg=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.160.75 with SMTP id b11mr582373hbd.178.1260136915628; Sun, 
	06 Dec 2009 14:01:55 -0800 (PST)
In-Reply-To: <1260134030-3658-2-git-send-email-Martin.Jansa@gmail.com>
References: <20091204090048.GA3233@jama>
	<1260134030-3658-1-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-2-git-send-email-Martin.Jansa@gmail.com>
Date: Sun, 6 Dec 2009 20:01:55 -0200
X-Google-Sender-Auth: aa812e727b3dace9
Message-ID: <be7a9f3d0912061401i445276cawe90436e27ca56fe3@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/6] bitbake.conf: create compatibility-providers.conf from micro, minimal, angstrom, shr preferred providers
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
X-List-Received-Date: Sun, 06 Dec 2009 22:03:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sun, Dec 6, 2009 at 7:13 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> +PREFERRED_PROVIDER_atd ?= "atd-over-fso"
> +PREFERRED_PROVIDER_atd ?= "atd"

I guess the first one ought to be commented out.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


