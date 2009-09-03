Received: from [209.85.221.176] (helo=mail-qy0-f176.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MjE5i-0002Cn-Se
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 17:19:18 +0200
Received: by qyk6 with SMTP id 6so1037414qyk.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 08:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=o+HeYaVQumurPFhhWiW+96Lbe+UH65CupK1YOCh5IBg=;
	b=Xx2XJCwwuv0IkkrSzgVb1Su4djWvehtF45gf+xFPctZuf98qvzlnZk9oNRiWZh1mTi
	0vAliHu6h6ixtae8+LGRIBI+EuWC/rM9nKFbVv2Wq4bifD5OAggR7evHNFsWYmyN+fdi
	u1jDRWJWxY75b8Gklv0uQwApNlMrbMxogx0w0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VplmRfCiRCCz6dGGDFzxq8zG+FbkAlBONp/SKZNE65rpOrL9DTcylgJGIgxk29gIAQ
	eml/OJWJEIHbO7Fa/tkTcpADyh3WKWvsjFOU79Gl01cy73KitIw1eeLoedT/9rWg3zHs
	UUz+jmOuvTdINGaT/eEFqBuJG1dJzXgkdZVk0=
MIME-Version: 1.0
Received: by 10.229.10.13 with SMTP id n13mr2798538qcn.103.1251990021932; Thu, 
	03 Sep 2009 08:00:21 -0700 (PDT)
In-Reply-To: <200909031316.32986.holger+oe@freyther.de>
References: <4A826FF3.9030501@gmail.com>
	<200908121450.59048.holger+oe@freyther.de>
	<200908121725.57128.holger+oe@freyther.de>
	<200909031316.32986.holger+oe@freyther.de>
Date: Thu, 3 Sep 2009 08:00:21 -0700
Message-ID: <19c1b8a90909030800l3ab45b48scd4db26f417e9c27@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: why does glibc_2.9.bb use glibc-ports-2.7?
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
X-List-Received-Date: Thu, 03 Sep 2009 15:19:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 3, 2009 at 4:16 AM, Holger Hans Peter
Freyther<holger+oe@freyther.de> wrote:
> On Wednesday 12 August 2009 17:25:56 Holger Hans Peter Freyther wrote:
>> On Wednesday 12 August 2009 14:50:58 Holger Hans Peter Freyther wrote:
>> > On Wednesday 12 August 2009 12:16:33 Graham Gower wrote:
>> > > I currently don't have resources to test arm builds (or other
>> > > architectures...). mipsel builds take 16hrs on my workstation as it
>> > > is.
>> >
>> > I'm doing an arm build now.
>>
>> Here we go. Compile tested on ARM (mostly) and MIPS.
>>
>> z.
>
> ping???

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


