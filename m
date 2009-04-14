Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1Ltj5n-0003VG-04
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 15:54:29 +0200
Received: by gxk18 with SMTP id 18so5336234gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KxbKtVYrrNElLDt4pDshHrzeoJcX86UzRYtwtdCyavQ=;
	b=sNJFuu7rPhA2+6eOBCU2OlIv7G/bUw8Fiyv0k7pxklG0tlwDeIvVxARbKjrxkfNKfA
	+OcxZORtJ/F8yrbX+5724zLZuA5mqN6NcKjxvRdxhpDAJQUJaP7Rh9Civ67T+f9ulAn4
	9U15YTdcaSYw6k9/6VPqk1CoYTDVTVV7qGyr8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=joM53/Kd4aPGPCH7QSJBW0eMtIsGy6jnSvjZIM5Meht32Mc2gCPy3XbWy3ZePGKSmu
	s/NK7Ox1RRK6BD10o1e4fmPWn5e7Np/FcmjOz3RtPt/9/h5/CZgYWVCghWVFJ6X8kYO7
	dONDNfVsW5ca42DltJ+A3CVFx8tMxZxi+ACWU=
MIME-Version: 1.0
Received: by 10.231.37.71 with SMTP id w7mr1054182ibd.10.1239717043796; Tue, 
	14 Apr 2009 06:50:43 -0700 (PDT)
In-Reply-To: <ade1bdc0904140648s7970ecccr2d5e7ade0685b681@mail.gmail.com>
References: <ade1bdc0904140555w37f51e9m1a81f951bd68cc8a@mail.gmail.com>
	<gs21kr$sbu$1@ger.gmane.org>
	<ade1bdc0904140648s7970ecccr2d5e7ade0685b681@mail.gmail.com>
Date: Tue, 14 Apr 2009 15:50:43 +0200
Message-ID: <ade1bdc0904140650t56adedb4q8fe886770134886c@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.170
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 2.6.28 pm kernel for beagleboard: "Turning off lcd and digit"
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
X-List-Received-Date: Tue, 14 Apr 2009 13:54:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/4/14 Raffaele Recalcati <lamiaposta71@gmail.com>:
> It is without splash.

Anyway,
I don't see the splash.
The LCD is black.

I don't know really what is u-boot doing ...


