Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Lmmlx-0002WK-Hy
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 11:25:17 +0100
Received: by bwz19 with SMTP id 19so441290bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2009 03:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lmW7GLojfULJe8SMD462vcl2uZ1Rb0dGSNzVjH+CT0o=;
	b=SqVsBlJqYR3BgfNsBmw//cq1AEiY8dd57qppzpE50Uzbi73TQ7atEDH+DakW6WacWa
	9DJPrl30Ev8Lp1a9MnLlYjtPk6zAVdAlxBug4drc8a67vomBv2jt9N5F7PGUHxKUiwRx
	zVMkCnRFc8/+P3H9siS6x+HBjIOcr10rY4N9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RWMtkYKEYQusWlQfD3geJnRA3OCKb2XaXrbF6GKIhbcG7O9Zs6aTk5SJP0PEJu88Jz
	GxdcTKSYtgbuTf7fsT/pW4s4QmywAUMZlH65ukC+lTdrQbHqTAAL5OZynrDVfJEBXMIo
	hXGkAxAQxXAHdzgfBy2uvZ2fAdckNHLUFkcaQ=
MIME-Version: 1.0
Received: by 10.223.113.136 with SMTP id a8mr470446faq.101.1238063015267; Thu, 
	26 Mar 2009 03:23:35 -0700 (PDT)
In-Reply-To: <gqfi0r$l4o$1@ger.gmane.org>
References: <1237737623-10538-1-git-send-email-matthieu.poullet@gmail.com>
	<d1b08f940903220927v2f820afia681d67bdbd50b54@mail.gmail.com>
	<20090322172416.GA16899@denix.org>
	<d1b08f940903221104u5f0f1328i8918a50ec49541f7@mail.gmail.com>
	<d1b08f940903221630p3e0bc9a5i443e8ada0a40fa03@mail.gmail.com>
	<20090323000542.GL14278@smtp.west.cox.net>
	<d1b08f940903260147n5fa49a1bxda7506b14bab20b7@mail.gmail.com>
	<gqfi0r$l4o$1@ger.gmane.org>
Date: Thu, 26 Mar 2009 11:23:35 +0100
Message-ID: <d1b08f940903260323y4660a2abj53c9738e3562d3aa@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Angstrom: weak-assign DEPLOY_DIR
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
X-List-Received-Date: Thu, 26 Mar 2009 10:25:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>that breaks packaged-staging, so no, it isn't a fix.

FWIW packaged-staging *is* already broken wrt these few recipes.

Andrea

Refs:
http://bugs.openembedded.net/show_bug.cgi?id=4580


