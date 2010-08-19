Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OmCro-0004m9-HK
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 23:41:46 +0200
Received: by qwd7 with SMTP id 7so573193qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 14:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=HNrQmkUdqEb1Snar5jit3qckPG7z8p/dFCtrbZkmCNY=;
	b=lhIxpiKNqmCjWggH3k38Dt1Rn98HLYmr6DwucKh2+2QSXXLLX9SCRQfMHnftK91ZaM
	yZ6kJe325Z60D5l2clMbBioSHEFigklSqmat2xx8QBhPQGd5hmi1ObpnWfUdM9rQQOWG
	n3TJQaT45xb6XwKNing4SQrGFAdmXiyGCP0Mc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bv+1t0kv1ZCsT6UATSeun0OFk37WT6mY7McfGlQW8jQk3khnjEuwI+ipCJtdforsRV
	kAbmFW1TYVbG8K3MxJCxKHN4HQGeim/R1GYpfTEiCPIKB8wGb+Yd1IaSzYFQaX+q/BfU
	+Jz8p0MLT42gwnPIppXLB9b4oFPMX3uwv7cd8=
MIME-Version: 1.0
Received: by 10.229.251.210 with SMTP id mt18mr383530qcb.151.1282254083444;
	Thu, 19 Aug 2010 14:41:23 -0700 (PDT)
Received: by 10.229.27.204 with HTTP; Thu, 19 Aug 2010 14:41:23 -0700 (PDT)
In-Reply-To: <AANLkTilIn7VbqhAFxA5AX2TsWeBHOBNIY0Xf2LL6Z7EE@mail.gmail.com>
References: <20100528052720.GA15949@gmail.com> <htnnq0$75p$1@dough.gmane.org>
	<AANLkTilIn7VbqhAFxA5AX2TsWeBHOBNIY0Xf2LL6Z7EE@mail.gmail.com>
Date: Thu, 19 Aug 2010 23:41:23 +0200
Message-ID: <AANLkTikn7+Kin_QGf0wiSzFYiZh6j35OoNUo662e1vHF@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: <package>-static name conflict with some recipes
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
X-List-Received-Date: Thu, 19 Aug 2010 21:41:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Bump

> ./kexec-tools/kexec-tools-klibc-static_1.101.bb
> ./kexec-tools/kexec-tools-klibc-static_2.0.1.bb
> ./zaurus-utils/nandlogical-klibc-static_1.0.0.bb
> ./klibc/klibc-utils-static_1.5.15+1.5.16.bb
> ./klibc/klibc-utils-static_1.5.18.bb
> ./klibc/klibc-utils-static_1.5.15.bb
> ./klibc/klibc-utils-static_1.5.bb
> ./klibc/klibc-utils-static_1.5.17.bb

I renamed the a.m. recipes: please check what's remaining after the
massive purge of last week...

Regards

Andrea


