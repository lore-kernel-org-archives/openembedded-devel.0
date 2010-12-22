Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVXQL-0001CZ-HQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 23:44:45 +0100
Received: by gyh20 with SMTP id 20so2414459gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 14:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=OkQz575xP0FZK9W9Pvr8LL0CZqrf/jmCEThIAPsr2CQ=;
	b=J0Oht6bbIt1GXfR7yFXKlQygGX7BjNFyCd9DguG0bMB8mT9579vxhwcCiBBPKa/9Ay
	DDcefBIDSpKe4/wVpjYd/b9TzYC2/9AxPezDuCNpP7GS4cLylo1rxRiNr892vEbpbiJg
	tSTvB5aWlKPLLO6re6OZ0iN98b5R1k9fAIQt4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Nh9VxjeNjYBsjfUEm/fsI+poaFwPpOVA+Twit7ROjjPo26zqiCEY5k6TbecmZVM4gV
	msJRsXYtxYKfwRjMBkVGciHAN9KR2h+hkjz4GVaCbL6avFxSGeY5JLbDJBnSnvIQMXfz
	jQqsCGK+0Llj9LEO4iY4aZWs9kIu/GMtYWkkU=
Received: by 10.90.80.18 with SMTP id d18mr9297686agb.31.1293057876336; Wed,
	22 Dec 2010 14:44:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 22 Dec 2010 14:44:14 -0800 (PST)
In-Reply-To: <4D12671D.1050008@eukrea.com>
References: <ABD557DA-5595-4CD8-AE87-C5FCC45F41BF@mac.com>
	<4D12671D.1050008@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Dec 2010 14:44:14 -0800
Message-ID: <AANLkTim9YeR7NqM7XnjT_LfDS8aQqkOYk2Kaf1dO+NGg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: compat-wireless recipe
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
X-List-Received-Date: Wed, 22 Dec 2010 22:44:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2010 at 1:01 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi,
>
> On 22/12/2010 20:51, Elvis Dowson wrote:
>>
>> =C2=A0 =C2=A0 =C2=A0 Is there a recipe for compat-wireless?
>>
>> http://linuxwireless.org/en/users/Download/stable/
>>
>> Support for the TI wl1271 wlan module is only available in mainline kern=
el
>> 2.6.37-rc6 onwards, and the compat-wireless package provides backports o=
f
>> the wl1271 driver for android-kernel-2.6.32.
>>
>> http://linuxwireless.org/en/users/Drivers/wl12xx
>>
>> I just need a recipe to incorporate it into my root file system build.
>>
>> Here is the full logical flow to replicating the process, if someone cou=
ld
>> help me write a recipe for this, it would be great. I can write simple
>> recipes based off git and local file repos, but I don't know how to hand=
le
>> and process the compat-wireless ways of dealing with things.
>>
> I did one which worked on x86 but didn't have time to update/test it for
> integration. You can find it here :
> http://patchwork.openembedded.org/patch/2013/
>

hmmm refresh it with current master and re-propose please

> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


