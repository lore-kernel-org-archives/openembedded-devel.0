Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbXV4-0006Xa-OW
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 15:11:30 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so775675pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 05:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/bj9V/arbt8TwxvXSX6YmyFKS1OyU/QZ44A3CzkZq0g=;
	b=AdSZ/Q30uZBtYGovUmM3jqeH1eyiLvW+qZ7f8RVkl1rJWDK6QFRUA30RdB5ojxJ4E2
	iw4d+U0hjGmj7A1Q21iWRiL0pI9CkRYwzoWnEPoGoIrknCic0NfPM7cXVZg4XppNvpfy
	Gi/0yTo74Lt8fYLry6KSo57Gkfdo9zDEE0BjZjpvCKTEQ3o5sdhEWkmyV2Waso3RpAym
	ecmnMn56L5oy5mHdVJ5PRxmQQjoXvgKUXHsLZrdXUCJ0gmcwzt9Wr/leUxgOsj9171U4
	+Jh2lGtsc9dN/allYZ0liI9bdZh+n1Xpgwoh5+pjNcyF6SWWTGo3TapxdYUX/ezP990J
	i+bA==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr5289912pbc.24.1353592643806; Thu,
	22 Nov 2012 05:57:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 22 Nov 2012 05:57:23 -0800 (PST)
In-Reply-To: <20121122135603.GE12637@jama.jama.net>
References: <CAHod+Gc5uO1HsJdaziyEki7vXbPJkEwXe2Zu-OKBhzgXQD47sQ@mail.gmail.com>
	<20121122105331.GX12637@jama.jama.net>
	<CALbNGRRus_-OSess+CaMHD++yPr8xrpRryBjnvr9=jw-6gWYgw@mail.gmail.com>
	<20121122135603.GE12637@jama.jama.net>
Date: Thu, 22 Nov 2012 11:57:23 -0200
X-Google-Sender-Auth: rh-SKU3qKv1YJX91rWc-9tMvWes
Message-ID: <CAP9ODKpNueNMd0o9gwcn6v8L8dd1XLDOMbyL7_UvWmZREzrcug@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 22 Nov 2012 14:11:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 11:56 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Nov 22, 2012 at 02:41:34PM +0100, Andreas M=C3=BCller wrote:
>> On Thu, Nov 22, 2012 at 11:53 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> > On Thu, Nov 22, 2012 at 01:33:42AM +0100, Marko Kati=C4=87 wrote:
>> >> epdfview is a pure gtk app, yet it's under meta-efl/efl. Is this on
>> >> purpose or did epdfview end up there
>> >> due to it's name similarity to epdf ?
>> >
>> > I think so, CCing Andreas for confirmation.
>> >
>> > Cheers,
>> >
>> > --
>> 1. Where should be the new location?
>> 2. I have no strong opinion on that - I asked here for the location
>> before creating the recipe :)
>
> What about meta-gnome?

For meta-gnome evince might fit better.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


