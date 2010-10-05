Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P37VO-0004rG-OJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 15:24:32 +0200
Received: by gxk10 with SMTP id 10so2071521gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wrIE6ofBASWtzlRM2YGemnaSYCBiovtfsOtkRg30kpQ=;
	b=lNY4G8EpBO3Yp8UTydkJr/Qta04XFQqg7KWJGqfdqqJrOF9/z+MuUlURckP4+vemkd
	1b2+Hhb3CcdjVkuEBEiafBbysCCK0LVVVeJWVovQLXo8mQfpg1WUDtqJhDjuW/9Yxf9q
	tpmB2S9wW235+sxU0eH8j52zqQqFWzJoCGoMs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=P11uFtdAZJQByvxEDilui7B7BKrtSDvRbibx0/TG+P/+GoWlSAlgd/402SzU+l/h8q
	qA68etRMKBV98OtglSQope8iQbCKw0vNDZoyq84NaJusM1Kh9ofPaOcYfFYgj6EyEFKZ
	wEUwlk+QRNtteUbTmmiPim8Lfl66LehI7a2pY=
MIME-Version: 1.0
Received: by 10.42.176.198 with SMTP id bf6mr679318icb.44.1286285026287; Tue,
	05 Oct 2010 06:23:46 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 5 Oct 2010 06:23:46 -0700 (PDT)
In-Reply-To: <20101005123257.GD3517@excalibur.local>
References: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
	<20101005123257.GD3517@excalibur.local>
Date: Tue, 5 Oct 2010 15:23:46 +0200
Message-ID: <AANLkTikaunRh8wSWihAN3C9xh++YBH2qZT8Tr_xdxVF-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-10-04
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
X-List-Received-Date: Tue, 05 Oct 2010 13:24:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Oh, one other thing.

Personally I would prefer it if the testing branch could be made on friday.
That way I (and I guess others) can use unused CPU cycles @ work
during the weekend to do the test builds.
How do others feel about that?

Frans


