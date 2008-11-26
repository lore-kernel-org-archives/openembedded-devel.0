Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L5MEo-0003uN-4W
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 16:23:34 +0100
Received: by qw-out-1920.google.com with SMTP id 5so123795qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2008 07:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=hArdl2MEA6ownuBzDqXkQoeZ3xh3EVBhX0MJk96vuag=;
	b=QimuX51HNlx6meoyvhB58b7ueRy6vDcTsmkE0ICG8B23UEXEiS8NacNpMkmx+iYEEx
	WUV4O8gaBnV1HMAlxyocc2o46QMMhCdiBOxKKOTmgFrn7Kk8Mub1fb1kpjKj4et8BJzd
	oCSLZAqtEOW8C0hoCn5eQHeX4hmylW9qtoCew=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=nww0WWcGHBdEcdjOKJ9id5EmMl6Tx2wFaa522JDFKiPB0gq9R3Uxax3I+Fpp/FVkZS
	EgcIdt3/aJhMnzh0hleV784B5MUTTNEdEKDYRL8W9kvTNYYdr3kp264AICuiXiqsQjYN
	W9xgrRu4roxzJopku/MvhRMi23G+k1NhtZvBc=
Received: by 10.214.45.14 with SMTP id s14mr5370268qas.343.1227712834210;
	Wed, 26 Nov 2008 07:20:34 -0800 (PST)
Received: by 10.214.12.10 with HTTP; Wed, 26 Nov 2008 07:20:34 -0800 (PST)
Message-ID: <c384c5ea0811260720u47e1a9edk67208845cd2005d@mail.gmail.com>
Date: Wed, 26 Nov 2008 16:20:34 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1227628013.10122.37.camel@akaza1>
MIME-Version: 1.0
References: <1227628013.10122.37.camel@akaza1>
Subject: Re: uclibc support for x86
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
X-List-Received-Date: Wed, 26 Nov 2008 15:23:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Mikael,

On Tue, Nov 25, 2008 at 4:46 PM, Mikael Rosbacke <mikael@rosbacke.org> wrote:
> Seems I'm the only one crazy enough to try to run a uClibc based
> distribution on x86. (I can see the response, What's the point?)
>
No, very good:

- Adding more x86 support allows OE to be remain more clean and
architecture-independent.
- Not everything is ARM.
- We have seen adding powerpc support fix some generic OE issues,
adding more x86 support will fix additional issues I'm sure.
- Although x86 might not always be resource limited platforms, it
doesn't mean you shouldn't use OE, or uclibc.

Kudos,
-- 
Leon


