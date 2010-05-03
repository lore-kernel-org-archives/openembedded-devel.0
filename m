Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1O8u3f-0003tl-S3
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 13:43:32 +0200
Received: by fxm11 with SMTP id 11so1921844fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 04:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wyjmOAIFdJLZo8mhS5mZMRHuSdKBDPYCmqdESmfOfM0=;
	b=VI/4bY/ocuv1B9/Yl7wF5MSupj6inig4yF8RpFi2mR/U510QybXdMfnEE/TWkgme6x
	OlURXSKSjMNzi9MkTtOgRFZXRvSrKRJcjnJZwBN3DKNrfvoem9pUNtzUwg4jFY5yp2SU
	qqDMojzEg2LVuxUWwJmag9yEf9G9iMXyQD8lc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=B3FuhqhTxMnao0P1IoT27epr6PT9sThVFf2bqjto8aRjUjD/6gB119gVsgF2Oo/JJ7
	bTCVqmqaywfq46Ebw5y1vRKZhPxjLvaKiNiRVt/tALRkirxcJLK1swe2QS7zq7cLENsv
	DpxzdEDs+G/eE3DD9ptdDcKfhJYchp0wOvu78=
MIME-Version: 1.0
Received: by 10.239.186.67 with SMTP id f3mr248385hbh.161.1272886786104; Mon, 
	03 May 2010 04:39:46 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Mon, 3 May 2010 04:39:46 -0700 (PDT)
In-Reply-To: <20100503113525.GO7123@jama>
References: <1272879651-27000-1-git-send-email-Martin.Jansa@gmail.com>
	<4BDE9E9D.9020003@eukrea.com> <20100503113525.GO7123@jama>
Date: Mon, 3 May 2010 13:39:46 +0200
Message-ID: <j2id1b08f941005030439m701d0eejb89a75e2499924f4@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] klibc: cleanup all version
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
X-List-Received-Date: Mon, 03 May 2010 11:43:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

thx for the cleanings!

>> * I've prepared 1.5.18, but needs more love as few patches doesn't apply
Please go ahead and delete all intermediate versions after 1.5.15 (the
last one working with pre 2.6.28 kernels).

I'd keep 1.5 for historical purposes, 1.5.15 temporarly for older
kernels and bleeding edge for the others ;)
BTW the last 'official' release is 1.5, followers are 'testing'  :/

Regards

Andrea


