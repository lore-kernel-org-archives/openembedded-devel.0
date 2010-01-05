Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NSDzl-0004P7-8A
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 19:19:08 +0100
Received: by bwz9 with SMTP id 9so9794564bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2010 10:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=UT82AFznccUAL8RUCEUv8bUSIM2HGIZP8eFl8fpOlIM=;
	b=lAPeZaJ18fxwTsAQ3hY9ElHC4oRqMw6no8sL79QuPTXbdgeDoWHWsMEHaU1MCq4t+t
	P1gurkSFGJb4dCx6eVfVW0dzgXvXMBLfQafC2LxCyeok0Tfpocx0T4YoWM0qMd9ip9nE
	Ksxq1SBN1KqRPSDyOA73C20nLkQSo2j0UEiRI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VHDBGS/k7dhMaPsxQuBOmSu9Wb9VyAMYSA7zn0NltO5bGa+0ox1yRiGfLjlF49tsLw
	+d2KYic21ZFVW398CPgFt3gh/zbuJW8BaICISCgAQCpzYQzn1AtGvsmpo2krA85aTszp
	YRnrZQXrBJO71zmuMvsYLbM2g2SKNDy9KBmtQ=
Received: by 10.204.29.22 with SMTP id o22mr1032144bkc.78.1262715421572;
	Tue, 05 Jan 2010 10:17:01 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 13sm5578456bwz.10.2010.01.05.10.16.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 05 Jan 2010 10:17:00 -0800 (PST)
Date: Tue, 5 Jan 2010 10:17:24 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100105181724.GA21048@gmail.com>
References: <BAY127-W1795412CA5C5CD1A8D270CD8730@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BAY127-W1795412CA5C5CD1A8D270CD8730@phx.gbl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: using bitbake
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
X-List-Received-Date: Tue, 05 Jan 2010 18:19:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/01/10 20:46), saleh usman wrote:
> 
> Hello
> 
> I've built console-image usnig bitbake. If I want to build another recipie  like helloworld  than what should I do?.wheather to delete tmp directory and rebuild all of the things or any other way?

no. You can just do bitbake helloworld

-Khem

> 
> Saleh
>  		 	   		  
> _________________________________________________________________
> Windows Live: Friends get your Flickr, Yelp, and Digg updates when they e-mail you.
> http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/social-network-basics.aspx?ocid=PID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_3:092010
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


