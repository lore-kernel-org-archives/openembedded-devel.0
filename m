Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UUOj4-0006jr-86
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 23:56:44 +0200
Received: by mail-ob0-f169.google.com with SMTP id tb18so1761700obb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2013 14:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=5o9MNz1aizwfWjMjmqgakNKCWXsqTp0dAywXpcs2rlo=;
	b=wWTKicaZgD1u9SdkbfJ2pPDzTg7IqPRJx+dv+sSYJxdxjzHO+taGHY9iPfe+XfLOoo
	K7XwgD+2gK3aX8ho8X4emNzXuuA7+o9T2BmgOIY4m6q2zDJSwHk4RPItlaWeOr0kJBVc
	bnXGZz4wIGjnguSMYCmZIsBvVuX2pNF5PakY3vBqlwkqcP7fqa57/97yBoZdZP9/MwHt
	N+awRd2TZ0KVEY5m6IAzvqy9fBniZDany2VDLPUGdtiBMyW8jt9xGwhVHOAjrcThwI+a
	4163QZe8VxpjEPa891y8x2FsPVrzR1vGhZp3KnkX3Oa3geJFVXsg2biwNDzuaJmgvWDl
	LUMw==
MIME-Version: 1.0
X-Received: by 10.182.220.161 with SMTP id px1mr10774978obc.42.1366666742188; 
	Mon, 22 Apr 2013 14:39:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Mon, 22 Apr 2013 14:39:02 -0700 (PDT)
In-Reply-To: <20130422212342.GB3217@jama>
References: <CAP9ODKrT9eS6pYhUnW1JgqJL3b9cevdYAiH-WLTLBhSuQuEy3Q@mail.gmail.com>
	<20130422221415.1e88893e@e6520eb> <20130422212342.GB3217@jama>
Date: Mon, 22 Apr 2013 18:39:02 -0300
X-Google-Sender-Auth: 6G4uN2KTXtGz0Wz_-E2s9JRCWis
Message-ID: <CAP9ODKoQWWz6WwJhUnh9cKs++Y02tUCVC6YpTcrV6w5ectaFSA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 22 Apr 2013 21:56:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2013 at 6:23 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, Apr 22, 2013 at 10:14:15PM +0200, Eric B=E9nard wrote:
>> Hi Otavio,
>>
>> Le Mon, 22 Apr 2013 16:08:55 -0300,
>> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>> > The upcoming release of dylan is very close and we should start think
>> > about its maintenance; is someone intending to be the maintainer of
>> > the 'dylan' branch of meta-oe?
>> >
>> I can continue maintenance with dylan as experience of the switch from
>> denzil to danny showed that n-1 gets very few updates once n is
>> released (and as my BSP are switching to dylan next month ;-).
>
> Great, you did well with danny, it would be great to see you taking care
> of dylan too.
>
> Feel free to create dylan branch when you see fit.
>
> I don't plan to merge any master-only change soon if I don't have to or
> overlook it (jenkins is still testing against master).
>
> When someone is sending patch which shouldn't go to dylan, please
> indicate it in subject (something like [master-only] should do).

I'd love to have dylan created soon so setup scripts from customers
could be ready.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


