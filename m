Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L9Tu0-0004nj-9s
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 01:23:08 +0100
Received: by rv-out-0708.google.com with SMTP id f25so980147rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2008 16:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=xKOVD+sIYESdBlfZ3IoVsgj0ZPpBgGbzC9fQ5o+16GM=;
	b=CD6bH1/USIil+B4LKdDjZvZQRMKHUJ1TZbHCXPsm23Hgu+HO8UfM3QuwCbb2QHROAe
	gvaF4EpinxRGdBKcqOzDhQ+t44FdrZCeqzLfqhSZyaE32g0w8g1HEQe3hooH5PkTPl7B
	Dsk0O2ea/nTlop4a0987AvsTPq0aPgMDaPx7I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=K5WyRj2tFVpBo8gol4tupsJWCei7eWR9wyNStK6SUM2C3ytEokU+kOT/xfJtZH9bxh
	SYON5iLN4sw01CM7IyhPhS0HbeVIMVXW/FXqMLoRRAwgQIUEuKvS22sf5vYXKNqS/4kP
	pKNaKsgUrrrtNp5qQLDSnxXCjxdDAU+UghUfk=
Received: by 10.141.99.2 with SMTP id b2mr1708075rvm.3.1228695558342;
	Sun, 07 Dec 2008 16:19:18 -0800 (PST)
Received: by 10.141.171.13 with HTTP; Sun, 7 Dec 2008 16:19:18 -0800 (PST)
Message-ID: <19c1b8a90812071619w67f80dd6wee1be54f3fa2dca2@mail.gmail.com>
Date: Sun, 7 Dec 2008 16:19:18 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ghhi04$mmo$2@ger.gmane.org>
MIME-Version: 1.0
References: <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<1228250322.5456.70.camel@dax.rpnet.com>
	<20081202212155.GG16628@smtp.west.cox.net>
	<20081206214525.GJ16628@smtp.west.cox.net>
	<20081207193340.GC15204@smtp.west.cox.net>
	<ghha1f$ugd$1@ger.gmane.org>
	<20081207201118.GD15204@smtp.west.cox.net>
	<ghhe2j$b5p$1@ger.gmane.org>
	<19c1b8a90812071340o57e4542cv8452e324445c64e@mail.gmail.com>
	<ghhi04$mmo$2@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: Canadian SDK support
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
X-List-Received-Date: Mon, 08 Dec 2008 00:23:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> It is wrong in a way that it check for a 128bit cpu, but I can confirm that
> running compiled fortran programs works very well with it. Using the
> 'correct' version with '64' would cause a regression, which is not what we
> want.

I see. If you have a test program or a pointer to a testcase which
demos this problem it would be nice.
I dont see this fix in trunk. Have you checked it on trunk does your
case fail on trunk too ?

>
> regards,
>
> Koen
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


