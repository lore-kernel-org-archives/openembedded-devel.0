Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jhautbois@gmail.com>) id 1MMiXA-00082r-0p
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 15:10:32 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1134221qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2009 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dCx0QXHR5tZd6f1wwxrQw5EVzH5Gd8seAIL8KHbARjY=;
	b=OfpLuw5vNVQnF4+Ck35Ia+AD+pKu6E/N/81ssXoyOrFattG4wV9ZSoHkzfx/Y7Hxe8
	v63D9e515Sn6q2VeWzueOkabL/gYtNzYVfQdoI8zG8HNZv9GTqOVSoob7XtqesSylSHH
	VFJOOPR6OgmjqaP+PIPEY5C8ND5e8GdfCVtWQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tAHJhbbDnaXidjuqAG2MdD0GStdeNEfwBwPMbBwtqLV5H6jBxJtS2v92jwsN0AihH3
	9wA46GXrNHBDUjesnA6iYTMr9RYLImRS/qLV+BvMURbddFHkoj9q4uxbEZdL/itdnAhR
	8uCKU5RYampKDbtzWsK666N1O1Jq030zMru2g=
MIME-Version: 1.0
Received: by 10.224.20.73 with SMTP id e9mr1881735qab.166.1246625904034; Fri, 
	03 Jul 2009 05:58:24 -0700 (PDT)
In-Reply-To: <1246624818.2136.16.camel@mill.internal.reciva.com>
References: <8cad0aa0907030319m60d8da2awa7a5f1685db0ee9a@mail.gmail.com>
	<1246617033.26610.65.camel@mill.internal.reciva.com>
	<8cad0aa0907030502o2d6c494cq76adf8ea124161b9@mail.gmail.com>
	<1246623479.2136.15.camel@mill.internal.reciva.com>
	<8cad0aa0907030530j5223d171la360f1c5a28b213e@mail.gmail.com>
	<1246624818.2136.16.camel@mill.internal.reciva.com>
Date: Fri, 3 Jul 2009 14:58:23 +0200
Message-ID: <8cad0aa0907030558o656e8aabu403320a9b947fe37@mail.gmail.com>
From: Jean-Michel Hautbois <jhautbois@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [GLibc]Version 2.8 and timerfd_* syscalls
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
X-List-Received-Date: Fri, 03 Jul 2009 13:10:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/7/3 Phil Blundell <philb@gnu.org>:
> On Fri, 2009-07-03 at 14:30 +0200, Jean-Michel Hautbois wrote:
>> So, can you explain me why I don't have this one: recipes/glibc/glibc_2.9.bb ?
>> When I am launching a git pull, It says I am up-to-date...
>
> What repository are you pulling from, and which branch are you using?
>

I am pulling from git://git.openembedded.net/openembedded
And my branche is stable/2009.

JM


