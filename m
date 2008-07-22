Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KLDWH-0002sy-BR
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jul 2008 10:46:53 +0200
Received: by an-out-0708.google.com with SMTP id b38so394867ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2008 01:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=d1Stija3b2JYibB2eveZXdpS3njOnwIDNvFPcv4QHXk=;
	b=FQUVUE14uDgWzlfVa5xlfLbRU5lxiIAQjS/qg6sIZPKUV8bAt2L18e6wJ1+vh4Bu/f
	NDNqm8PIjxGrHQ72AJFzLFs0mtY7l9RBKnRfchnYrCR9cwOjEs961H15q5aXh1bXPQXH
	jU/iv8pTw8SdYzqMcJ8RdzNeUDigzF1gnh6As=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=dx9Ckh2fjqRJmQ8cm/diDTHDu9CV6mUjm8cTXU0sTt2NS5t5EnJMM/wop4BysZp6fe
	ro0zMKnR09z6jHhw2SaWXU/PHzhkSuFIo+qUXgpYhFNLsftkZyV3opNyelQU+FMX64uX
	5S9YjSPGbvnkcz9uyCWE5Kz+FqD9QOwWALNiI=
Received: by 10.100.120.15 with SMTP id s15mr2274305anc.45.1216716347273;
	Tue, 22 Jul 2008 01:45:47 -0700 (PDT)
Received: by 10.100.166.17 with HTTP; Tue, 22 Jul 2008 01:45:47 -0700 (PDT)
Message-ID: <c384c5ea0807220145n5a91d46eye0f00f15b95d01ee@mail.gmail.com>
Date: Tue, 22 Jul 2008 10:45:47 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
MIME-Version: 1.0
References: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
Subject: Re: Stable source repository
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 22 Jul 2008 08:46:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Esben,

On Tue, Jul 22, 2008 at 10:11 AM, Esben Haabendal
<esbenhaabendal@gmail.com> wrote:
>
> Of-course, unless continous manual labor is to be required, we need to
> write a script or something like that to maintain the mirror repository.
>
I have written a "where is that package at" ("witpa") tool to help me
find old archives.

I will submit it to OE.

Regards,
-- 
Leon


