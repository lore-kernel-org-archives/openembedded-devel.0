Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TbXFk-0005Xw-Up
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 14:55:41 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so6267488ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 05:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=V7B48SQfH0StzZT4wgWsBjSVNZ6KeylyZy3SYlFiMKk=;
	b=hnJiJiaMp0Bv0aeGSYMjcO3/FxKZgon7Vwm2MXVRU3gTzifMISMKOZdRRj0gGqeK6J
	meYYTNa9hQQUa0Q4aLFBOXkZ0q4Dk1jfVw7/IfvWrJsxwQ3Sn3LBgGzwAFaHw7Y7I/U5
	3PklqgROw8JKri4DqSKANbPxtxWO/4ORvsUTbu02sS3NVI64R79TzFnFfzzSXIMqFZXH
	KQSqXKTxd4Dke9mBr7JY5tVCv38XcvvCYOwUrdkuGsenl0Fo8p7Brq8d+039Dqg2tfCk
	+xnxbpr8RIWQz3m63j+g13s6Yzn0KCYeJylzpTKsUS9sl/gCZs453ukToLQRU8SAWIsN
	a7Zw==
MIME-Version: 1.0
Received: by 10.50.152.240 with SMTP id vb16mr578553igb.45.1353591694198; Thu,
	22 Nov 2012 05:41:34 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Thu, 22 Nov 2012 05:41:34 -0800 (PST)
In-Reply-To: <20121122105331.GX12637@jama.jama.net>
References: <CAHod+Gc5uO1HsJdaziyEki7vXbPJkEwXe2Zu-OKBhzgXQD47sQ@mail.gmail.com>
	<20121122105331.GX12637@jama.jama.net>
Date: Thu, 22 Nov 2012 14:41:34 +0100
Message-ID: <CALbNGRRus_-OSess+CaMHD++yPr8xrpRryBjnvr9=jw-6gWYgw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andreas M <C3@jama.jama.net>, BC@jama.jama.net, ller <schnitzeltony@gmx.de>
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
X-List-Received-Date: Thu, 22 Nov 2012 13:55:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 11:53 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Nov 22, 2012 at 01:33:42AM +0100, Marko Kati=C4=87 wrote:
>> epdfview is a pure gtk app, yet it's under meta-efl/efl. Is this on
>> purpose or did epdfview end up there
>> due to it's name similarity to epdf ?
>
> I think so, CCing Andreas for confirmation.
>
> Cheers,
>
> --
1. Where should be the new location?
2. I have no strong opinion on that - I asked here for the location
before creating the recipe :)


Andreas


