Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MclHF-0002rc-HX
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 21:20:25 +0200
Received: by qw-out-1920.google.com with SMTP id 4so776075qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 12:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=E1seid+0IKFUi8zZD82/aaTcYjwSoyIJZp2IapLI2lg=;
	b=HEYtINT6bggg3GbYuHmiISXchhCbp2xJKD4QA6VbWwgpDkOt/njqxdJCp/+BK2/Gyx
	s54FmoO08Ahe6gXwms4fZspotb+sFTr/+6GYX7UyU5NBd19cWOcBNox9inkKkrItuEbO
	u9vD895/vCSau+FjWqWKK//9gxAFJovH2AU0g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uJ24vQ11dl5ydlXohTGaVtJIx4EVDql52l8b/6OG7ghn4jNe//NdA+i4EjWqN/wh2/
	I/TVdj4Nv5ubBhJ8fWN7lqdavDPfuORkz7VGsNvY8opm8Dk8JJo0WgoWDqUGdh6EfMy6
	C9hk+Ycx6PbLxKr+kds1HxAWnIV5qG+ZbECF8=
MIME-Version: 1.0
Received: by 10.229.20.206 with SMTP id g14mr1749424qcb.32.1250449413008; Sun, 
	16 Aug 2009 12:03:33 -0700 (PDT)
In-Reply-To: <h692tl$qh8$1@ger.gmane.org>
References: <20090814055813.GA13133@gmail.com>
	<20090814062521.GE22344@denix.org> <h692tl$qh8$1@ger.gmane.org>
Date: Sun, 16 Aug 2009 12:03:32 -0700
Message-ID: <19c1b8a90908161203j3d5b7fbbm2777c670f511347d@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: New patches not appearing in patchwork since 8/12
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
X-List-Received-Date: Sun, 16 Aug 2009 19:20:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, Aug 16, 2009 at 6:51 AM, Koen Kooi<k.kooi@student.utwente.nl> wrote:
> On 14-08-09 08:25, Denys Dmytriyenko wrote:
>>
>> On Thu, Aug 13, 2009 at 10:58:13PM -0700, Khem Raj wrote:
>>>
>>> Hi
>>>
>>> I am not seeing new patches on patchwork. Is there something wrong with
>>> it or is there some setting messed up on my end.
>>>
>>> Can you see patches posted after 8/12
>>
>> Same here, the latest one from 8/12 - hx2750 compile errors.
>
> Fixed, google changed ssl certs again, so we had to change the fingerprint
> in .fetchmailrc to 92:73:17:4C:34:4B:68:F7:B2:17:71:42:0D:7F:9F:33
>

thx Koen

> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


