Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1Tbc3m-0001oa-Fa
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 20:03:38 +0100
Received: by mail-vc0-f175.google.com with SMTP id m8so4486502vcd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 10:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=yTbrKqL/O6+MLLNUgkIMA2MI1jDkQtKspFWzIOPmPi0=;
	b=A8l8nDZnVKPKDoZ7EGC88jGCDh86fzGpQpThcIeDQPQ/rnLniB5q9RWvl5Hlm0jQHg
	oDXTT8toFyefNrp7l7reP+kDhDZ5QT3iH4KQ6i/QOBiu7hO7oaLZIIIRxcXnn/LvQgLk
	5BlDbqKy7sRezx84Vp14YHcCq7p6PzV6EnXm2uiVm+M2Lkcug+KfeiXlv7AkfV5oDaDk
	OSS7Jcbh1jX2zmFGpT2pCzFZacDTIVYN0GBN2i5X+gx072uS4pvY1HAIbRo72t2Hdbef
	TYRmwRxL0RJnGzkgMjBAtmQmVYG7NOUeW3tAL2dU8QLIj6Eas+avr34yxQ4WoqIhsbQQ
	Y5Og==
MIME-Version: 1.0
Received: by 10.52.20.238 with SMTP id q14mr1866350vde.120.1353610171487; Thu,
	22 Nov 2012 10:49:31 -0800 (PST)
Received: by 10.58.127.225 with HTTP; Thu, 22 Nov 2012 10:49:31 -0800 (PST)
In-Reply-To: <CAP9ODKpNueNMd0o9gwcn6v8L8dd1XLDOMbyL7_UvWmZREzrcug@mail.gmail.com>
References: <CAHod+Gc5uO1HsJdaziyEki7vXbPJkEwXe2Zu-OKBhzgXQD47sQ@mail.gmail.com>
	<20121122105331.GX12637@jama.jama.net>
	<CALbNGRRus_-OSess+CaMHD++yPr8xrpRryBjnvr9=jw-6gWYgw@mail.gmail.com>
	<20121122135603.GE12637@jama.jama.net>
	<CAP9ODKpNueNMd0o9gwcn6v8L8dd1XLDOMbyL7_UvWmZREzrcug@mail.gmail.com>
Date: Thu, 22 Nov 2012 19:49:31 +0100
Message-ID: <CAHod+GfC9ZZqJTPA-VwY_WQHkckvc95OHmSMfgbuos86Lp_ekQ@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@gmx.de>
Subject: Re: [meta-efl] should epdfview really be under meta-efl?
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
X-List-Received-Date: Thu, 22 Nov 2012 19:03:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 2:57 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Nov 22, 2012 at 11:56 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> On Thu, Nov 22, 2012 at 02:41:34PM +0100, Andreas M=C3=BCller wrote:
>>> On Thu, Nov 22, 2012 at 11:53 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>>> > On Thu, Nov 22, 2012 at 01:33:42AM +0100, Marko Kati=C4=87 wrote:
>>> >> epdfview is a pure gtk app, yet it's under meta-efl/efl. Is this on
>>> >> purpose or did epdfview end up there
>>> >> due to it's name similarity to epdf ?
>>> >
>>> > I think so, CCing Andreas for confirmation.
>>> >
>>> > Cheers,
>>> >
>>> > --
>>> 1. Where should be the new location?
>>> 2. I have no strong opinion on that - I asked here for the location
>>> before creating the recipe :)
>>
>> What about meta-gnome?
>
> For meta-gnome evince might fit better.
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

well, as it's name suggests, meta-efl should only contain efl libraries and
apps built with efl. meta-gnome might be good place for epdfview. But
then again, there's
a bunch of gtk apps in meta-oe/recipes-support, like gvim, fbreader,
pidgin xchat, etc.
To cut the story short, i myself am not sure where it should go.


