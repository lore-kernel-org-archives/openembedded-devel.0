Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UUOtk-00080d-C0
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 00:07:55 +0200
Received: by mail-vb0-f41.google.com with SMTP id f13so6454276vbg.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2013 14:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=7xZC89oYFTfjuvWRu04vz8O0qcQ7qP8W4q7Bo9jK3xU=;
	b=aH47iePX3lPw6jamYjjAzZQSqGvvRHFuX8XKDaC4pbyHFEKuiThhbygIj2f2uO4H4E
	ip/pMop8KogJPuH9+ipJ2SAfxxqYB14aYij7mOMmgEZOf+xZbsPX+qayI1cSkcoJ0tak
	H/LZf3fen6kuHJeJr2mA3KHCVWX8I03l945uowlJ//+uO+SFeVIcbfhPPobwkiEbLqsZ
	sC/13f8RPnnezgc8pi9jqTn+Mo4TTllrJDX/aJvsPZMDbizV2KN+JE9akfVBwDcF+Fhq
	5eGaS/Tcda+I9BbF9wEtc1/CTSLQAC2wX0GGcml4UGlgrnjYwMhdfBus32kNHMklJA5s
	xG2A==
MIME-Version: 1.0
X-Received: by 10.52.170.204 with SMTP id ao12mr16880234vdc.83.1366667404488; 
	Mon, 22 Apr 2013 14:50:04 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Mon, 22 Apr 2013 14:50:04 -0700 (PDT)
In-Reply-To: <CAP9ODKoQWWz6WwJhUnh9cKs++Y02tUCVC6YpTcrV6w5ectaFSA@mail.gmail.com>
References: <CAP9ODKrT9eS6pYhUnW1JgqJL3b9cevdYAiH-WLTLBhSuQuEy3Q@mail.gmail.com>
	<20130422221415.1e88893e@e6520eb> <20130422212342.GB3217@jama>
	<CAP9ODKoQWWz6WwJhUnh9cKs++Y02tUCVC6YpTcrV6w5ectaFSA@mail.gmail.com>
Date: Mon, 22 Apr 2013 23:50:04 +0200
Message-ID: <CALbNGRQATxyDT1_bPrHDiJGs3TOX9pYQigDvQfyJ+Eu89iT9-Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Meta-OpenEmbedded - Dylan maintenance
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
X-List-Received-Date: Mon, 22 Apr 2013 22:07:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2013 at 11:39 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Apr 22, 2013 at 6:23 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Mon, Apr 22, 2013 at 10:14:15PM +0200, Eric B=C3=A9nard wrote:
>>> Hi Otavio,
>>>
>>> Le Mon, 22 Apr 2013 16:08:55 -0300,
>>> Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :
>>> > The upcoming release of dylan is very close and we should start think
>>> > about its maintenance; is someone intending to be the maintainer of
>>> > the 'dylan' branch of meta-oe?
>>> >
>>> I can continue maintenance with dylan as experience of the switch from
>>> denzil to danny showed that n-1 gets very few updates once n is
>>> released (and as my BSP are switching to dylan next month ;-).
>>
>> Great, you did well with danny, it would be great to see you taking care
>> of dylan too.
>>
>> Feel free to create dylan branch when you see fit.
>>
>> I don't plan to merge any master-only change soon if I don't have to or
>> overlook it (jenkins is still testing against master).
>>
>> When someone is sending patch which shouldn't go to dylan, please
>> indicate it in subject (something like [master-only] should do).
>
> I'd love to have dylan created soon so setup scripts from customers
> could be ready.
>
Could we wait until images created by dylan do boot properly for all of us?

Andreas


