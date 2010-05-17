Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OE4Xh-0002G6-NM
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 20:00:37 +0200
Received: by iwn2 with SMTP id 2so515961iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 10:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oHUdDxKPe8vR4D3GymLboW+6Yh4PcpeHQJFrKDdTajs=;
	b=DZhfBLjxYqxKHEcm5Jb/2+3DFQeZOrLq3OZoGnyp+YoNsKAMSvcWIUmjB8KZD51kw2
	ZC02mHRbu0U/wfJTrR+h7BggGQLRn7nhii6wSfFeQBElsA8LxM6o9lskWGdWuHpkMXOR
	rixidhBP14O+s4U9KX03GveT3xemF/saitNLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gbsV3JtFjGTzCPbB/ff3PINxjKNKBN0V6NpbXLUz2C3+pwccItCzaG95eyR/uhpjTK
	DyDCpuIOtQkCaEhXNNbSW7UBgZc4Hq6qYlMYvyYsmD86KKxm0eeUGSpsxkGCseU5uccD
	bW/R0A7aBzl0JqKKWSEeLp04nNc/2T5CmNmC8=
MIME-Version: 1.0
Received: by 10.231.176.72 with SMTP id bd8mr624151ibb.0.1274118355696; Mon, 
	17 May 2010 10:45:55 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Mon, 17 May 2010 10:45:55 -0700 (PDT)
In-Reply-To: <hsrsq8$d0r$1@dough.gmane.org>
References: <hsql3t$o5c$1@dough.gmane.org> <20100517055550.GA6686@gmail.com>
	<hsr2pr$4vp$1@dough.gmane.org>
	<AANLkTin6PIr6ZgeYS6rB9IGK83vQH9Tn9xreVOwOAt0M@mail.gmail.com>
	<hsrsq8$d0r$1@dough.gmane.org>
Date: Mon, 17 May 2010 10:45:55 -0700
Message-ID: <AANLkTimXPVpXkm-vJbKvsYim3zM_ckn6XEH_XtS_pDot@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Scanned: No (on linuxtogo.org); SA Timed out after 240 secs
Subject: Re: Question: is 'gcc' supposed to replace the libstdc++.la installed by 'gcc-cross'?
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
X-List-Received-Date: Mon, 17 May 2010 18:05:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 17, 2010 at 10:02 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 17-05-10 18:49, Khem Raj wrote:
>> On Mon, May 17, 2010 at 2:38 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>
>> I could not build a console-image as I ran out of disk space. Have you
>> considered removing
>> -g3 from default angstrom builds.

what is -g3 offering over -g at -O2 and how good the additional debug info is ?

>
> No, that would make -dbg packages useless.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL8XaIMkyGM64RGpERAkfFAKCsBlf/O9fnSkUxV+pOSiV2uXiBNwCfSjuu
> iZwbcen+H0YuBVf7fTPXZ9Q=
> =Cuo2
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


