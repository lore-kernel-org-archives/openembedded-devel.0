Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lytao-0002xE-7Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 22:07:50 +0200
Received: by wa-out-1112.google.com with SMTP id j4so279053wah.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 13:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=pWmt51P+R5VtAxRL+/P8yToRhgydtd8WVDRBe7r4Yqc=;
	b=MlL6ungawU+GcvIOYqWIQbfhBY1Pb/KA51vzJWE/cQ1/jraD748fN8Q6XA2bG63v1L
	BLEzY1BFuG1sCheIjwN3eGZOil0eFBQ3pOYdD749TuL9q0KQuo87UglKwUAM/kkWMEb+
	NkC5275cJSvq/Z2XYx9qYvqGmCFPAVe3ftv3c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=M8wamsNdMMf+da5T2zvvPiBW37/n706XNxV+3cdLaMP8vUD2Q9B99XH3FWl5qX8O5n
	funfuNK61N+1QKWd68FPUNihtlPw3wPu2saK9lYCQlL7khqEtGnMJ3ap94yO6sxjoGOV
	wVaa1iSo8/tR93tBr0a88JDnNY5Gasq9/2L0g=
Received: by 10.115.16.14 with SMTP id t14mr3522677wai.14.1240948958656;
	Tue, 28 Apr 2009 13:02:38 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-44.dsl.pltn13.sbcglobal.net
	[71.146.25.44])
	by mx.google.com with ESMTPS id v9sm224437wah.1.2009.04.28.13.02.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Apr 2009 13:02:37 -0700 (PDT)
Date: Tue, 28 Apr 2009 13:02:32 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090428200232.GA26082@gmail.com>
References: <200904151633.49146.khimov@altell.ru>
	<20090423044201.GA22270@gmail.com>
	<200904231337.07189.khimov@altell.ru>
	<200904271428.32644.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200904271428.32644.khimov@altell.ru>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH	02/11]?binutils:?add?binutils-x86_64_i386_biarch.patch
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
X-List-Received-Date: Tue, 28 Apr 2009 20:07:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/04/09 14:28), Roman I Khimov wrote:
> On Thursday 23 April 2009 13:37:06 Roman I Khimov wrote:
> > New binutils were introduced recently, so I've upgraded patch to handle
> > those as well, please ACK new version and I'll commit it then.
> 
> ping

Acked-By: Khem Raj <raj.khem@gmail.com>
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


