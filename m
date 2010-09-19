Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Ox8Ru-0004cj-R1
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Sep 2010 03:12:13 +0200
Received: by iwn2 with SMTP id 2so3179070iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Sep 2010 18:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0UENxvGVcmfOe+yHg/P3M1JlTsFRNmFp0bTFKanYaOY=;
	b=PhHU3WWreXiP3Q7EIlyVSdbplGRsFkci9NT1UimzKs2E20ZegwDmluQtvd2Dga+2lS
	3TKlkNdWTyOkAIzN7DIYdjDjIlsPc13x92IYrArGJVmnVJJ8P6pwZtzUvVcZjucPtBuJ
	hsrwSzELpGStBEyP/wWg+g/xczifW3jwJ8RI0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YJbwdCch4kSlC57mIfQj00n6zA8l0Q1pEFftvdfE5VPE7XmCCOo1imc/yfEnmqSIDK
	hdKfNJaihR2z9D5p0UBHTn1U1hi7UXQXbRDms0E8FKJIJxAmrFJNHk4y2AnHATsKRayq
	hC5JpVuidJVjYeoNja+vBG1iNoMwjHyHsmudg=
MIME-Version: 1.0
Received: by 10.231.171.3 with SMTP id f3mr7741144ibz.145.1284858679192; Sat,
	18 Sep 2010 18:11:19 -0700 (PDT)
Received: by 10.231.161.1 with HTTP; Sat, 18 Sep 2010 18:11:19 -0700 (PDT)
In-Reply-To: <4C94DCA8.10405@freyther.de>
References: <4C9301E6.8010901@gmail.com>
	<4C94DCA8.10405@freyther.de>
Date: Sun, 19 Sep 2010 10:41:19 +0930
Message-ID: <AANLkTinZo7zFZOXhivEmt7j=-Gm2J29FaOCfS5SzOo2G@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xkbd_0.8.15.bb: Fix geometry flag to accept negative offsets.
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
X-List-Received-Date: Sun, 19 Sep 2010 01:12:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 19 September 2010 01:07, Holger Freyther <holger+oe@freyther.de> wrote:
> On 09/17/2010 01:51 PM, Graham Gower wrote:
>
> Where is this patch coming from? is it upstream?
>

It comes from http://bugs.gentoo.org/214353 - as found in the patch header.

-Graham

PS: What upstream?


