Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LnaEJ-0000LA-8T
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Mar 2009 16:13:51 +0100
Received: by yx-out-1718.google.com with SMTP id 3so967249yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Mar 2009 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9YF1YgrYBINzg4I05T6q+qI9HK+jQ/FQPSt4MfUzosw=;
	b=DAas6mCX4F2225yPz1oW1IbHzo+5wxuC3hGxp5soUTF3P13EVa6RuzOh3fKTPb8BPi
	ixY0m7d09wOtBjb9XM3a2TUu/4riyI3XlKbJpHWyWJLNuuDxAjGBhB16blpXY7hKphqc
	qwcnbtAEl2SriR+U65O+o8uKBC1d008A8nfHI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FLdCHGEb0SUdSMCJjSdj5yvKZO5lf2Kt8m0i/vbLknbWzIk3wj9ubvs0FqWHQuc7z0
	quod/ZbNFU0i6Cdc79ykp/yA3Tbr5DjZhJICtg8jQt0nmG1Yr+nkEq+ws4wP2IC6EoeI
	qR4QVpsurSzXDl+9HBKThBBneZYhAPX9NB23s=
MIME-Version: 1.0
Received: by 10.90.99.3 with SMTP id w3mr1755008agb.77.1238253117031; Sat, 28 
	Mar 2009 08:11:57 -0700 (PDT)
In-Reply-To: <200903271748.24641.marcin@juszkiewicz.com.pl>
References: <200903242144.29168.marcin@juszkiewicz.com.pl>
	<200903271748.24641.marcin@juszkiewicz.com.pl>
Date: Sat, 28 Mar 2009 16:11:56 +0100
Message-ID: <c384c5ea0903280811y11eb8515lde20fa5a17993434@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: IRC discussion about stable branch - 25.03.2009 12:00 GMT
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
X-List-Received-Date: Sat, 28 Mar 2009 15:13:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

2009/3/27 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
>
> Thats all - please share your thoughts and ideas. We are open for
> developers who wants to maintain own machines, distros, recipes.
>

Signing up; I think this time we want to base some product firmwares
off the stable branch so we MUST maintain it:

Machines: amcc460ex, mpc8313e-rdb, mpc8315e-rdb, sheevaplug
Distro: Angstrom
Recipes: related kernels, real-time kernels, any recipe I have touched before.

Regards,
-- 
Leon


