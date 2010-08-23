Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OnabW-0002lR-Sa
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 19:14:55 +0200
Received: by gwb15 with SMTP id 15so2293589gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 10:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=3akOIwxjJY9gaV3ueqoJQY1GROoawKWsBcGnv17Hy3U=;
	b=RT1JLxX0AuvTu3i1IcJ7L06XY+Q7LiHZ1eD1BskxcN0x7xIke2ZSVjLhQW7wCuy6G9
	i1JYm3hUC5BLhxkjls3N/4m42kpC54bs6c5ZixiGf5+i+uoiMVFtcHO3I8HMPjtj6bQE
	sXWaoaw5yKv50JZ56NW6diGDTXAX+MbDrdLoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dcSuDci5fxxP/xtKPL66qSxaqE4sqAH+owtjiingGXM/8eEvvbLe4ZQELFNOP6qmuC
	nAfqsDhVWuQZtZdIX4pT+IGNB/tu0xNQBKc9G8W39L/PyWxokqMSwLdT7FfpG854RP2m
	2NHb20IQO0vUK+oLDbo7BFhUYlaEC2e0kZUVc=
MIME-Version: 1.0
Received: by 10.239.182.7 with SMTP id o7mr245085hbg.144.1282583628114; Mon,
	23 Aug 2010 10:13:48 -0700 (PDT)
Received: by 10.239.152.71 with HTTP; Mon, 23 Aug 2010 10:13:48 -0700 (PDT)
In-Reply-To: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
References: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 23 Aug 2010 19:13:48 +0200
Message-ID: <AANLkTi=JGes_Lsf65g0ax0trPNgmMj710ndRPh82Cmq0@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Add efika MX support to OE
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
X-List-Received-Date: Mon, 23 Aug 2010 17:15:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Khem,

On Mon, Aug 23, 2010 at 5:13 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> Following three patches will make OE support Efika MX smart computer.
> The kernel and u-boot is used from powerdeveloper.org as all the changes
> are not upstream yet.
>
Thanks, it was on my to-do.  Do you have the Efika MX hardware?

I can send you one MX if it helps, it's not the newest board revision though.

Regards,
-- 
Leon


