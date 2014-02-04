Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id E51776E44F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2014 15:30:10 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hq11so6040416vcb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2014 07:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=fRNCL4qMvLzB3jJVY30GfGjiqbQdvkfb0zC5E6TNqMk=;
	b=wZFVLOLCZSR7egFG6N9tfrzzsJ1Xks2ZOeJavAz42DHi/BeFd5YdUCB0g2Hl/jzPYm
	TYXxoxRX8yP9FfiFrH0lv5CK1tL/II+5xOFGzWBdWJnZWtGOi19MHD2FwCGvtyQNiUUB
	ZY99jc5i3Qo6QVuCY8Z0+jt08DMq24oTL1t8zocERV1d8SqO3iJHgPUSCPrDskiKU9An
	4PJXR2Fa4I0JoE4ZCy5Kmi8J/pmBlgRaam1u+ej57Mqk8rGTW/W5LrircNcrSXpv/ITS
	ba7jXAVJyrVrGajN300JEh9tQP5DXs8BYO4VRibhClhuzS74IHpIFn+D/iM6IKX7jfiM
	yUoQ==
X-Received: by 10.221.20.199 with SMTP id qp7mr6464699vcb.24.1391527811507;
	Tue, 04 Feb 2014 07:30:11 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Tue, 4 Feb 2014 07:29:31 -0800 (PST)
In-Reply-To: <lcqbu0$vme$1@ger.gmane.org>
References: <1391240222-2020-1-git-send-email-Martin.Jansa@gmail.com>
	<lcqbu0$vme$1@ger.gmane.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 4 Feb 2014 15:29:31 +0000
X-Google-Sender-Auth: KhQmQPEBXng7wUNlWwf5M_zMij0
Message-ID: <CANyK_8ds4sAPTuT-W3ZJ4XeEm+AF6Y9mv0Wx150D8GOfqmFUGw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-multimedia 1/2] vlc: fix build with kernel headers 3.9 and newer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Feb 2014 15:30:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 4 February 2014 09:33, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Martin Jansa schreef op 01-02-14 08:37:
>> * V4L2_CID_HCENTER and V4L2_CID_VCENTER removed from linux v3.9
>
> Any volunteers to update vlc to 1.1.13 (2 years old) or 2.1.2 (2 months old)?
>

I tried this about 6 months ago (for the then-current 2.x.x version of
vlc) but ran into a bunch of problems. I can't remember what they were
though - that'll teach me to keep a few notes in future!

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

