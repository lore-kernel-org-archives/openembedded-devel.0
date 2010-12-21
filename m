Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUykQ-0005lp-Lh
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 10:43:10 +0100
Received: by gwj22 with SMTP id 22so2093862gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 01:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=f/sUaaX9T4Me+1/hrE9x0/TUiIn10E9EHP5nqYOs9/Q=;
	b=dbeZPxVWEr3VaJjqxuPCUKpYksii2Ukpd3fkeeqJ9NbOxRlXVsNDV1EfywVBxHh6vG
	RzjDAlXBGCvoi0FcZHu0K7PYmOBbnUtGuxLHmimzQZLADRBoiEg9t8oxGh37JKArCSNv
	vG8bz4A5+C7qrx/DKy507W95UqJpnh64xJXwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=jEyfF91qUZSk/kwHQUAGC9h4fthasQtfjyu2uxwm8iQuirIHGla08kdp3YTIDJT2/N
	+dFCOgcakcoJjgBsluRY8Bn22215v6iIR6x+t6cBtxC39Dx+ytCp+9CRLU/3r9BtUenC
	YTFxvYEh3sObtiXgnhAG1KfPZdK+d4llLN0aA=
Received: by 10.90.10.31 with SMTP id 31mr6747199agj.85.1292924574058; Tue, 21
	Dec 2010 01:42:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 21 Dec 2010 01:42:32 -0800 (PST)
In-Reply-To: <AANLkTinTsbFrf+AWZDYTL0UuVkM9648Nt_STiZXf0NPa@mail.gmail.com>
References: <4D0FB245.90008@gmail.com> <20101220213243.GD17904@gmail.com>
	<4D0FE2CC.5050003@gmail.com>
	<AANLkTim+M3jX41Ryk-wJ4OOyJ6o--Vq89dCS3=aUYC9r@mail.gmail.com>
	<AANLkTinTsbFrf+AWZDYTL0UuVkM9648Nt_STiZXf0NPa@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Dec 2010 01:42:32 -0800
Message-ID: <AANLkTikZFR0UEBA-owPyWhSZPWuWhLqEMbus=yBPo5cs@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: qemu-native_0.13.0 do_compile fails
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
X-List-Received-Date: Tue, 21 Dec 2010 09:43:10 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 21, 2010 at 12:27 AM, Jan Paesmans <jan.paesmans@gmail.com> wrote:
>> which ubuntu version are you using
>
> Ubuntu 10.10
> As for the linker: GNU ld (GNU Binutils for Ubuntu) 2.20.51-system.20100908
>

I have exactly same system (x86_64) and never saw this problem.

> Regards,
>
> Jan
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


