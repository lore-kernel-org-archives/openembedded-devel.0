Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Oc4Ea-0002Ij-K6
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 00:27:20 +0200
Received: by fxm12 with SMTP id 12so4736162fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 15:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=5pRu6qLXZmWCLL2DAwBtazHpSGHGE6nRZIDwA3ECnBQ=;
	b=Fmde4nVmBjAzoUnEbRmSaQ1K1RK7tSB1yOGtWUoM7vTZPRLnVycK1J+opd/scWGYRZ
	BxDewKm4d3zCu7xFdNRYCDFa+BF1BfRo4SjzVkhOBz0GU7grDvEGI9gTHTY8XG9U1t4m
	rEpls339zXuyY4TGm5i/N4lW7zmp5NXULGTYQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=g5++a3v3f1aLBpeacmGlC2lWThvUEHxEcCF65xgGN8D0tVcBr/cFo2X+au+FvFYVtb
	CIlCAgBbUxfKZfyqkDh7uGRkxbT0abgMhByRa4+mleOqC3VHMkxqsNPskmxgwJHADSrR
	MJ+ybLtHsm/DrLHxpyDIuQvuus5pFXJ4reI7o=
MIME-Version: 1.0
Received: by 10.103.124.11 with SMTP id b11mr252336mun.69.1279837626064; Thu, 
	22 Jul 2010 15:27:06 -0700 (PDT)
Received: by 10.102.59.17 with HTTP; Thu, 22 Jul 2010 15:27:06 -0700 (PDT)
In-Reply-To: <1279235280.6792.7.camel@utx.lan>
References: <1279235280.6792.7.camel@utx.lan>
Date: Fri, 23 Jul 2010 00:27:06 +0200
Message-ID: <AANLkTimT2BnWdl8NAMP3w0txTd20eZFAE6C4FVbk8wlQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] udev: add compatibility package for old kernels
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
X-List-Received-Date: Thu, 22 Jul 2010 22:27:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

>    udev-compat141: Added compatibility udev package for old kernels.

Tested on c7x0 with kernel 2.6.26.
Acked-by: Andrea Adami <andrea.adami@gmail.com>


