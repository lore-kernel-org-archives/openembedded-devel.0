Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PD4Cg-0000PN-4S
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 00:54:21 +0100
Received: by vws17 with SMTP id 17so4410817vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 16:53:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.211.136 with SMTP id go8mr8602408qab.50.1288655608413;
	Mon, 01 Nov 2010 16:53:28 -0700 (PDT)
Sender: jay@jay-tech.ru
Received: by 10.220.96.67 with HTTP; Mon, 1 Nov 2010 16:53:28 -0700 (PDT)
X-Originating-IP: [93.81.143.149]
In-Reply-To: <AANLkTin2uOUbo6mU4EJD-xyhJ8GU0e4Kch5=FGp5CEc1@mail.gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
	<AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
	<20101101183327.GD15069@ibawizard.net>
	<AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
	<20101101192422.GA11482@gmail.com>
	<AANLkTin2uOUbo6mU4EJD-xyhJ8GU0e4Kch5=FGp5CEc1@mail.gmail.com>
Date: Tue, 2 Nov 2010 02:53:28 +0300
X-Google-Sender-Auth: eZSImyyxAvjdKvCT7htaMitGKOg
Message-ID: <AANLkTi=SdPckFzvXpi4_uG7ZY8ecDajFZou6U5+0WRgT@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
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
X-List-Received-Date: Mon, 01 Nov 2010 23:54:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/1 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:

>>> Put the table in a spreadsheet?
>>> I think google docs can be used to share access to a common sheet (but
>>> not fully sure).
>>
>> Wiki has good support for tables.
>
> Better than what we have now? The layout somewhat sucks. I'd rather
> see it as a table while editing, due to the different width of the
> fields used, it is at the moment fairly difficult to match your cells
> with the column caption (especially if you are near the end of the
> table).

I've appended bottom copy or header to that table. This will make life
a bit easier :)
Also we can setup own online spreadsheet (e.g.
http://www.simple-groupware.de/cms/Spreadsheet/Home).

>>> Disadvantage of an incremental build is that you need to keep all the
>>> tmp dirs around, which, at least for me, is probably prohibitive (I'll
>>> verify this later)
>>
>> Disadvantage for you agreed but may not be for others who have space to keep the tmpdir
>> and care about saving time on complete rebuilds or upgrade paths etc.
>
> Oh yes, I fully agree, and I definitely do not want to stop anyone
> from doing incremental builds.
> The more diverse tests we do the more chance we have to find bugs.

Clean build is enough for most people.
People who have free CPU and HDD resources can do incremental builds too.
I'll append 'Build type' field to wiki table.

-- 
Yury Bushmelev


