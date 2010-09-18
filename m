Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ox3Mt-0007Lq-WA
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Sep 2010 21:46:41 +0200
Received: by iwn2 with SMTP id 2so3022540iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Sep 2010 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=z6K29JpWDqQsLGLBP/xz3XFughWiuJtvzAIVyR1U2Es=;
	b=sjfKvdDbQqMh7NNKWhBlKdqFs9ZJVlacGEWUaHi2t2nqccmRTTEeQ7vU0Lillwhgfn
	XckPJV4OT/GV7BsRoswe6YzoHojj+LfN3xoLbeNCD+9POB97wQ9SUaJvn1xLHiGvnz9y
	otNV8zlG8yws6oLBoMbKMW81IO4XQ47UMKHDg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TiT8LMtORj+28SyLttByPx4n44Efzdvu4T+JIqsbfAZuqRRmLDCxZLVYXmF0xJyoFw
	iFiFJnSLAJ8DLtUn/Cnylgcu2ll1gr30CZYqKtpwcfuRmbh06PsRIUFeEc0XTu5gTTmv
	Yz7mvXsIMT5IXO9CPfMvL5n4vU9vYuc/rERSw=
MIME-Version: 1.0
Received: by 10.231.170.79 with SMTP id c15mr7441182ibz.82.1284839142647; Sat,
	18 Sep 2010 12:45:42 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Sat, 18 Sep 2010 12:45:42 -0700 (PDT)
In-Reply-To: <4C9515E0.40404@freyther.de>
References: <AANLkTinhwNWjTY4wv_dZ0Ju5vHwxNU918Ba9Sg3FOyZu@mail.gmail.com>
	<4C9515E0.40404@freyther.de>
Date: Sat, 18 Sep 2010 21:45:42 +0200
Message-ID: <AANLkTinmHONaH-VH+jQk07UCKNCU-JHqkVmk8_3BKdv5@mail.gmail.com>
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
Subject: Re: python-tlslite
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
X-List-Received-Date: Sat, 18 Sep 2010 19:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/18 Holger Freyther <holger+oe@freyther.de>:
> On 09/19/2010 02:49 AM, Frans Meulenbroeks wrote:
>
>> python/python-tlslite_0.3.8.bb:HOMEPAGE = "http://trevp.net/tlslite/"
>> python/python-tlslite_0.3.8.bb:SRCNAME = "tlslite"
>
>
> Did you consider using a Gentoo/Debian mirror for the version 0.3.8. At least
> Gentoo is still having this recipe.
>
Good plan, will do.

Frans


