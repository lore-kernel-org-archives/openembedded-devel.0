Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDBT4-0002bh-P7
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 08:39:54 +0100
Received: by iwn42 with SMTP id 42so7714974iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 00:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0yfn0dJ3OunklCj+6vrttQD1EwsKQQUc9r9+FH1rTZo=;
	b=NIhgE9PibMt5U1A7Fi2YHF6gjjAIF1xiVn1xqbqWGRI2QTnqn91y90qB0ApNbhKsqy
	uIClFYYhWHmL/yjFlk1kKQuFOK52dxXTDkG1lTwsTt1o0NQz8sGuXSTxMsqqk4pgzIAo
	HfXX/nF8k5awzXR+uzCrCnT5NQEOkTK/XFHrk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=E2/2GowzeMWeUBkvmGNEwOmKCNhFQD6keQoP9EZBV0muDgpd/CpbXsEhCCbZe4G5tO
	S76tBmVmzztJUqKxcIUTMrVT1wPWPuZD+D25FULgUeSnbSPAG+vc0b1OwD89IfKbEppa
	WONjjfZpLvtsXbmwuq5wSruThGLGP1omLGmYE=
MIME-Version: 1.0
Received: by 10.231.152.143 with SMTP id g15mr1324335ibw.76.1288683528010;
	Tue, 02 Nov 2010 00:38:48 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Tue, 2 Nov 2010 00:38:47 -0700 (PDT)
In-Reply-To: <AANLkTindf92Uo-T+pL2kqrh1M62K-6=qz9g3hdqyEVfm@mail.gmail.com>
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
	<AANLkTindf92Uo-T+pL2kqrh1M62K-6=qz9g3hdqyEVfm@mail.gmail.com>
Date: Tue, 2 Nov 2010 08:38:47 +0100
Message-ID: <AANLkTinzynPe6zpr5V_9Ay0WP1XqWxdTwFAK6vXmdYX-@mail.gmail.com>
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
X-List-Received-Date: Tue, 02 Nov 2010 07:39:56 -0000
X-List-Received-Date: Tue, 02 Nov 2010 07:39:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

We've switched to 10.04 as host.
With that most things build fine.

With 8.04 I had some issues.
See the thread 'e2fsprogs build problems (with ubuntu 8.04 host)"

However, as the autobuilder moved to 10.04 I will cease to stop 8.04 testing.
Time permitting I will also put some info in the wiki on my setup (as
asked on irc).

Best regards, Frans


