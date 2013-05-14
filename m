Received: from mail-ob0-f181.google.com ([209.85.214.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UcDS5-0002zV-JN
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 13:31:31 +0200
Received: by mail-ob0-f181.google.com with SMTP id dn14so382465obc.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=jCVeUbYm4crgxuO5Gr/WXnQrBXGHc19NXuG3EONvRcg=;
	b=UeJkle0jUVoztSqswUgdqvBC02sBsTK4u9SZZv7Me2W+voIE58PsgR/1JXm2PVwmRd
	vbwqtawP4e3kgInnm/utenoP/D/bLe9SortKQUEoK8dzRp0ezxri1wvdZzJcXrmXJK3/
	SW4T1WOa2Lo12OyxkWCxdyKMqeU9pFm25WYCpnwotJYIoDULZowRxJLTxywVVKA61+Tp
	5wa6nKTupnGlwWzodoSvE1S32GPlQhIyy2759YAWrnQFAELn7VttbdB6z/kt1heSbZSU
	8eBqc0wxVmdtXEni5kgL60rd4kdO++FspL81Gs2nyWg9UQAo3J0ZROmxsVGVQjNjXByG
	npNQ==
MIME-Version: 1.0
X-Received: by 10.182.199.106 with SMTP id jj10mr7823381obc.45.1368529997543; 
	Tue, 14 May 2013 04:13:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Tue, 14 May 2013 04:13:17 -0700 (PDT)
In-Reply-To: <CAJTo0LZ-ng_=n_RcWcdhJY3E4ZgnFUiDCKpgBsLwLbOg6ExjSg@mail.gmail.com>
References: <1368481622-5465-1-git-send-email-otavio@ossystems.com.br>
	<20130513215201.GF3187@jama>
	<CAP9ODKpXcX5H6ndoz9ikz+0cUE9RPC7AvvAt8iKD+vHnoqXyqQ@mail.gmail.com>
	<CAJTo0LZ-ng_=n_RcWcdhJY3E4ZgnFUiDCKpgBsLwLbOg6ExjSg@mail.gmail.com>
Date: Tue, 14 May 2013 08:13:17 -0300
X-Google-Sender-Auth: 5U2KwRmM5W33J4eEywyCnvAoU7c
Message-ID: <CAP9ODKrKMLrCNhWbO9GMvR9UsN4871gJFQTjsVjZ8thcTr9boQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe PATCH] bigbuckbunny: Add 480p, 720p and 1080p movies
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
X-List-Received-Date: Tue, 14 May 2013 11:31:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 14, 2013 at 6:59 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 13 May 2013 22:56, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> I pondered about it but I think it is of generic use. I don't think we
>> need to have meta-multimedia to be able to use it.
>
> +1 for meta-multimedia.

Ok, will move it to there.

> Also I'm getting bored of Big Buck Bunny, how about Sintel instead. :)

We can add it as well. What about we have these all in:

meta-multimedia/recipes-support/media-samples/*?

So we can have Big Buck Bunny, Sintel and others here.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


