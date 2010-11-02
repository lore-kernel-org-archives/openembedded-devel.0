Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDAgb-0002Pe-Vq
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 07:49:38 +0100
Received: by iwn42 with SMTP id 42so7657458iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 23:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=rUDqcF+z4Q5ej9Moy5oPtA5I7yZYP4fvpcxuQwjVd4s=;
	b=b1Ve5lnfWihPjzA0c/5DPw4d8AnNVuq2ut3lrVN8XI10u/ym7JAuDR2EipE2a8AMu+
	OVE+dSFikFV5lmWd/VCZuxCkgtEUxqP1g39ConH6GA8g+mDBAM/83Lwxs0NHCHIEYCJV
	0xohz90ZhbdsQJD743Si/lBNEua3V0xTgSSOI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ITvag3QUY6VGHEqpPp/yR8HcYVnqFy5IwJ6f21q+zerWbKFCIoDPPHxury5hsstmh2
	davGCcD4idhwNRV8oXf6wVqGsZiR2kcuYDlyL1hoHx7TArNgqvV6uzwJp1GbBENTjqgM
	XR4++J4HbVYhbvxBZIPb8TKdmUDzuUBkNk9os=
MIME-Version: 1.0
Received: by 10.42.230.65 with SMTP id jl1mr1838679icb.134.1288680528428; Mon,
	01 Nov 2010 23:48:48 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 23:48:48 -0700 (PDT)
In-Reply-To: <AANLkTi=SdPckFzvXpi4_uG7ZY8ecDajFZou6U5+0WRgT@mail.gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
	<AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
	<20101101183327.GD15069@ibawizard.net>
	<AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
	<20101101192422.GA11482@gmail.com>
	<AANLkTin2uOUbo6mU4EJD-xyhJ8GU0e4Kch5=FGp5CEc1@mail.gmail.com>
	<AANLkTi=SdPckFzvXpi4_uG7ZY8ecDajFZou6U5+0WRgT@mail.gmail.com>
Date: Tue, 2 Nov 2010 07:48:48 +0100
Message-ID: <AANLkTindf92Uo-T+pL2kqrh1M62K-6=qz9g3hdqyEVfm@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Tue, 02 Nov 2010 06:49:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/2 Yury Bushmelev <jay4mail@gmail.com>:
> 2010/11/1 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>
>>>> Put the table in a spreadsheet?
>>>> I think google docs can be used to share access to a common sheet (but
>>>> not fully sure).
>>>
>>> Wiki has good support for tables.
>>
>> Better than what we have now? The layout somewhat sucks. I'd rather
>> see it as a table while editing, due to the different width of the
>> fields used, it is at the moment fairly difficult to match your cells
>> with the column caption (especially if you are near the end of the
>> table).
>
> I've appended bottom copy or header to that table. This will make life
> a bit easier :)
> Also we can setup own online spreadsheet (e.g.
> http://www.simple-groupware.de/cms/Spreadsheet/Home).

Thanks.
We also might want to layout the table (in edit mode) in such a way
that also there it looks like a table.
Currently I see (taking a random snippet from the table):

|qemux86    ||minimal   ||native-sdk-image  ||Ubuntu 10.04 64-bit   ||
||[[User:khem]]      ||testing_2010-10-25||clean ||
|-
|qemumipsel    ||minimal   ||x11-image  ||Slackware 13.1 64-bit   ||
||grg      ||testing_2010-10-14||clean ||
|-
|qemuarm    ||angstrom-2010.x   ||x11-gpe-image  ||Fedora 12 32-bit
|| ||[[User:gthomas]]      ||testing_2010-09-07||clean
||testing_2010-09-13 fails to build xf86-input-mouse

Guess it would be better to have all || chars in the same column.

Frans


