Received: from mail-iw0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nwg4N-0000Cd-O8
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 20:21:44 +0200
Received: by iwn8 with SMTP id 8so327445iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=ZUrpAd4HBfwQrY9cmeHrosxkXMf3WQ6K8RUMVpfHbJw=;
	b=c6DHyed9uMJ7SO558jT/s6kCSZMInxgzAsh8D3N82rNbhVaq9bVf5PIh9edDIuWsl0
	eP/+yl8f/UJX7dDK3UvNp698M5K5mFuZEItuBX/to00555lUts+wBtS2JRSnPGDrOXKJ
	FXm6Ph5JYxK6OQEGPFazntSCLp0myalPFcIXU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VrDHm67hEh018p1s4jU9bKu5jg87Alv8loC+ujEVJtipTTOTkSN4PADpH67nQ2VgGA
	s1q7CmDxFPu6UNWxCKh0wQIVLr1ESu0KFU5n1kN3rlm9XtPPmO2zztfO7XbBv3JwqF7p
	v1P/aq6ikQbYgUKGzqoj8ufNKxcd2Ojidn0v4=
MIME-Version: 1.0
Received: by 10.231.32.66 with HTTP; Tue, 30 Mar 2010 11:18:28 -0700 (PDT)
In-Reply-To: <201003301501.00340.holger+oe@freyther.de>
References: <1269951751-22396-1-git-send-email-khimov@altell.ru>
	<201003301501.00340.holger+oe@freyther.de>
Date: Tue, 30 Mar 2010 11:18:28 -0700
Received: by 10.231.169.144 with SMTP id z16mr1897939iby.25.1269973108213; 
	Tue, 30 Mar 2010 11:18:28 -0700 (PDT)
Message-ID: <19c1b8a91003301118q1052609n5806a7feb6cb28e@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: deal with unpackaged /usr/lib/ssl files
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
X-List-Received-Date: Tue, 30 Mar 2010 18:21:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 30, 2010 at 6:01 AM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Tuesday 30 March 2010 14:22:30 Roman I Khimov wrote:
>> Config file is accessed directly from libcrypto, so belongs to
>> libcrypto package.
>>
>> openssl-misc is a new package that contains CA management scripts.
>>
>> Signed-off-by: Roman I Khimov <khimov@altell.ru>
>
> Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>
>
Acked-by:  Khem Raj <raj.khem@gmail.com>

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


