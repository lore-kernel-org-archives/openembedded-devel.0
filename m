Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1PvR6O-0001om-W5
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 10:15:13 +0100
Received: by vws4 with SMTP id 4so1860793vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 01:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=0k1aaIGKOARqt4ASQ8zf6C9SovKlLCqdrjRny40b/FM=;
	b=FpPFPdDm3psAox9Sy3z7XfxH5OSoVP8RIY9NY5RycrOmjLWqNxY9A84HOCQZD9lbZg
	YKX9cW8meS7R4Lr1VOW4BX8EKMO2RgWp+X4636wXhB1eFWLWoqyFzfgY9rTNQuU64nzk
	LkZY+i679J5dDRywZR7gOaU7TNgMW9dR7B2y4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PlVkFpd7uVsK7hjR0cX5uiTINyqFbhNbSBd94XFc5DE/C3cw/LGG4KX1L1O88awAYC
	/FacwEWYgbCAw6pUzI5mJ/6ehXu/s3Eb93jI9GpbuTdQhRTo3lobODLnjqoqKRN4XtBR
	2ywxXAVKsbLZGpyad6bmArh/qFS6k/OefmjfQ=
MIME-Version: 1.0
Received: by 10.52.18.103 with SMTP id v7mr459531vdd.305.1299230023077; Fri,
	04 Mar 2011 01:13:43 -0800 (PST)
Received: by 10.52.162.168 with HTTP; Fri, 4 Mar 2011 01:13:43 -0800 (PST)
In-Reply-To: <AANLkTikgA=b5DcrfzHpians8edKrdC9AjvRqqQam5_RV@mail.gmail.com>
References: <1299225769-12329-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTikgA=b5DcrfzHpians8edKrdC9AjvRqqQam5_RV@mail.gmail.com>
Date: Fri, 4 Mar 2011 10:13:43 +0100
Message-ID: <AANLkTimf2qBUA2rnewktwNquCZUuQN44rCX0UKbKc2DK@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux-kexecboot: remove extra quotes arround INITRAMFS_COMPRESSION RD_COMPRESSION, which made 'make oldconfig' to ignore them
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
X-List-Received-Date: Fri, 04 Mar 2011 09:15:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 4, 2011 at 9:45 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Mar 4, 2011 at 12:02 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Andrea Adami <andrea.adami@gmail.com>

Thanks for keeping an eye on!

Andrea

P.S. this file is still WIP, probably some mangling could be made arch-specific.


