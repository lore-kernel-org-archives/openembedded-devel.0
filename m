Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KLLtu-0006Io-Ma
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jul 2008 19:43:50 +0200
Received: by an-out-0708.google.com with SMTP id b38so424937ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2008 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=IMCiyPYtnpLaoFBXG1ww3XMGdTRWBJiLBl+gX5cVBMY=;
	b=CjuPst0yyE9bzyo54vBwlSxMSBrXuJZ888fTDYZELfEj2SRyZ3U23mn2yiQsgAUw3t
	2NH2kwtW1SE6h+gI8NVZpMB9hhzWBtArB4pDWWxcl+kjO8YULb5c9h3eVhHSbGUN1sSQ
	qj2Raqq/5iIiKeg0BR+kGsYqmFC0cmQ2K7mPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=YtLOsktG4Rhx0sPmKNDOdE0RA0yUDdtfZoJLSYqVuRhpc1/cMXfA+t9zaF6v/ESpb+
	3Hz93WXg8BxpWOz0qWFIGQK8KpclSyldsZ/qry0c8IYhddbN0njRb8HjjkamNKfM/weh
	jshwXlL+TJAdRxnBhqfuJvhOjhD23P56/iTUQ=
Received: by 10.100.32.8 with SMTP id f8mr2626739anf.124.1216748562630;
	Tue, 22 Jul 2008 10:42:42 -0700 (PDT)
Received: by 10.100.166.17 with HTTP; Tue, 22 Jul 2008 10:42:42 -0700 (PDT)
Message-ID: <c384c5ea0807221042y5018e7f2ka7b2915e82e9a554@mail.gmail.com>
Date: Tue, 22 Jul 2008 19:42:42 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4883BCB1.7020102@atmel.com>
MIME-Version: 1.0
References: <4883BCB1.7020102@atmel.com>
Subject: Re: binutils fails for AVR32
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 22 Jul 2008 17:43:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Ulf,

On Mon, Jul 21, 2008 at 12:31 AM, Ulf Samuelsson
<ulf.samuelsson@atmel.com> wrote:
> I managed to complete the AT91SAM9263 build, but
> now I am caught in the configure hell when trying the AVR32.
>
> ...
>
> Anyone got the AVR32 toolchain to build properly using a recent version?
>
Yes, I am building a AVR32 project using
478afd231213fcf731ddefac0314beee5d95b5fb which works fine for me.

I upgrade every now and then. Will see about more recent revisions of OE.


Regards,
-- 
Leon


