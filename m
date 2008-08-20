Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <shanevolpe@gmail.com>) id 1KVdgi-0003ar-K2
	for openembedded-devel@openembedded.org; Wed, 20 Aug 2008 04:44:44 +0200
Received: by yx-out-1718.google.com with SMTP id 4so101372yxp.30
	for <openembedded-devel@openembedded.org>;
	Tue, 19 Aug 2008 19:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type:references;
	bh=OlBfs4A/pEyPep1M+jeZ9mS3wYd5QOdlHbha7JuVsPc=;
	b=Ie0n2e6UdwPNxhLFaWdDsE7XiXcrebXAf+8hoTPoCoSTK3JwoY5kyMGhpgyC6txYp6
	Mmiz5DdAlRU5dF0dpc4dftjD4gWpH62c1+p0SUq0KIkt4B979m1KPpjCMQDjQJA/1R5s
	jGHCRBh/L0n+k/4F8YEivM/CCjXXvqVIHJQ00=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:references;
	b=OS71UTgVnzEpqS8ftefhuWgtvxcwTneMKh5SlCDj1tIaHe+07KYsFW+325FSCF6L0s
	a7oyhKNBJqWd39fG+QAeelctcz1escr4VGBncp4pkiM/89nW4rPBKk6NaKX2Q7Il6JQ0
	ijSoNteK/IvhyIKL/cq44h13fQDmEaMyOuqmk=
Received: by 10.114.211.1 with SMTP id j1mr7458479wag.103.1219200220023;
	Tue, 19 Aug 2008 19:43:40 -0700 (PDT)
Received: by 10.114.24.10 with HTTP; Tue, 19 Aug 2008 19:43:39 -0700 (PDT)
Message-ID: <8c7950360808191943g1347fac0w95fb85b0b2a261c8@mail.gmail.com>
Date: Tue, 19 Aug 2008 22:43:39 -0400
From: "Shane Volpe" <shanevolpe@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g8frq1$5ei$3@ger.gmane.org>
MIME-Version: 1.0
References: <20080817162932.8ECBF18808B@amethyst.openembedded.net>
	<g8frq1$5ei$3@ger.gmane.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@openembedded.org
Subject: Re: : php-native: Updated to version 5.2.6
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
X-List-Received-Date: Wed, 20 Aug 2008 02:44:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Rolf,
Yes, I compiled it with no issues, I will double check what I checked in.
If the do_patch did not work then I messed something up or did not check in
the right thing.
Shane

On Tue, Aug 19, 2008 at 9:25 PM, Rolf Leggewie
<no2spam@nospam.arcornews.de>wrote:

> OE GIT Trial wrote:
>
>> Author:  <svolpe@openembedded.org>
>>
>
>  php-native: Updated to version 5.2.6
>> *Replaced the old version 5.2.5 with 5.2.6
>>
>
> Hi,
>
> did this actually work for you?  For me, compilation of mysql-native fails
> as well as do_patch for php_5.2.6.
>
> Regards
>
> Rolf
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Registered Linux User: #293401

