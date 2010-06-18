Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OPZWU-00026u-1X
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 13:14:10 +0200
Received: by gxk19 with SMTP id 19so456105gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=EAU86UrVT62OKA8etPT38bafXKt22raJ6CGJgg/RURk=;
	b=M92xmSk+sEV3kNwH0S1eTMQVmIbBPPGkkHMYFoFLrNhyLpkJ800/64tj+XJk79yEUz
	x4WchL3nsuOB2PeWz/vUaUv5c/786nP5EglV9TRHKuTaYPNFVoT/BQZcnsAJguNWoNM+
	axJp49FIx/zwmjcjIk5hKKgRie6jWmeLd/Oh4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gQ1D4Qgm1hmSvri934EMIKbF4CLyk6TV0ACnGT59h17gOYJDmDtlqrIkCFpniAeUBr
	ez9IDC/bp3fPgpApi80hMNo0XS71Qlyv9kdJHLdSDbVKocPBwE9veq3IG7czQIqmQNDd
	PnzpnIH+CPTVokZdb9c75kBe9tQGdNIfhW/tc=
MIME-Version: 1.0
Received: by 10.101.129.7 with SMTP id g7mr718334ann.84.1276859377977; Fri, 18 
	Jun 2010 04:09:37 -0700 (PDT)
Received: by 10.100.194.6 with HTTP; Fri, 18 Jun 2010 04:09:37 -0700 (PDT)
In-Reply-To: <hvfgis$jkb$1@dough.gmane.org>
References: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
	<hvfgis$jkb$1@dough.gmane.org>
Date: Fri, 18 Jun 2010 13:09:37 +0200
Message-ID: <AANLkTil1NKwYatyVFUb_97H-1N986GflcQb6mft_OvOd@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] purge recipes/linux-kexecboot and move to recipes/linux
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
X-List-Received-Date: Fri, 18 Jun 2010 11:14:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

> I'm confused if you're RFC'ing one or more things, could you please show
> patches to illustrate what you want?
>
> regards,
>
> Koen

Yea, actually the true RFC is about removing unused versions.
I don't think just moving *all* would even need an RFC...

My concerns are about the cruft if I would blindly copy all stuff.
This would stay there for long long time.

As example, I'd like to know if omap band could now move to 2.6.34 so
we could just throw the 2.6.29 and 2.6.32.

Regards

Andrea


