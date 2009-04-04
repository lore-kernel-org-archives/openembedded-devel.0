Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Lq4bi-00068L-LE
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 14:04:20 +0200
Received: by ewy20 with SMTP id 20so1317635ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2009 05:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RrNrHrGLc3RblHJylb2tD+3Zy8bNYtYxJJKqnMxsdzg=;
	b=BMJdHMCqkptBlxz7TFpNOJraTM5xEmC2KZESmkyVGaL23sETyRTJ9luSvgivtYfCS0
	azIyMql6fBSIHN4nBeNycy31whqEMuv+92xL06e2zP23i7iM5QYFUmkQ1Rk2K+YJuawe
	MwPCMXacx/txKThQ3djxEMcqeOIhOsshdXS2c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=up3EkGZ2xi3Qt2h5O2vjEL7NlTMFxUcSSOEUjOi+9D7HxaXk1cvNPcTOrYXcxCCoMV
	iNdt7JdEDeSXjCF/OT8LVs+qKPxwgxRNkbDoqEma/onBZ187PIbpy+bJMdloeOBcRNEm
	sUeSKpF3gIJsxfOOfvMxr4U5unXXEZIY4Rmnk=
MIME-Version: 1.0
Received: by 10.210.69.6 with SMTP id r6mr84075eba.61.1238846499450; Sat, 04 
	Apr 2009 05:01:39 -0700 (PDT)
In-Reply-To: <gr794f$si$3@ger.gmane.org>
References: <gr794f$si$3@ger.gmane.org>
Date: Sat, 4 Apr 2009 14:01:39 +0200
Message-ID: <ac9c93b10904040501h74232b6ei82628e3ec167b6ba@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchwork now has an 'applied' flag
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
X-List-Received-Date: Sat, 04 Apr 2009 12:04:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Probably a stupid question, but is there some info on what patchwork
is and how to use it?

2009/4/4 Koen Kooi <k.kooi@student.utwente.nl>:
> Hi,
>
> Patchwork allows us to define custom states, so we now have an 'applied'
> state if you can to explicitly state is has been applied, instead of
> 'accepted' + 'archived'.
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


