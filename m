Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MSuKY-0003di-2R
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jul 2009 16:59:06 +0200
Received: by rv-out-0708.google.com with SMTP id l33so590668rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2009 07:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=CvDNFMykrm8RS0zSCDSBNo2Zayo5mfEYBhOeavsvf20=;
	b=phMebxM63Cjyr2lMg4y/8bfSUgi8SnaZhUX/S9tcGbMSd15QJTz7miFurlgHrrIqat
	uQfYhxHv/ovdz9HegWppm0L7ExVTmaFt6DDXrlI1Q8UuEjn+3/IQjiSc9W5aFKvhJrrY
	AZ+UpbdvncUCitjR3bXZtt0cvYpK0PEcy9ncE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fa2OFpMMPe6IMZNbzXywSXf1nb/vuy4oQ2fDiJwBHFpwwslmEb+1isKF8ZExSbLb4A
	Rw3Jb7hL5Khm85zsn1/DKi0v+NJK+QBaHp19/xWk4TCdXpcowzSMPkRXLM/ooewwX9OS
	j6nsvm7m+6fjLoWjZQUYyxlkRf8eoph3GAAtw=
Received: by 10.140.136.19 with SMTP id j19mr2576407rvd.165.1248101109145;
	Mon, 20 Jul 2009 07:45:09 -0700 (PDT)
Received: from gmail.com (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id k2sm23444649rvb.12.2009.07.20.07.45.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Jul 2009 07:45:08 -0700 (PDT)
Date: Mon, 20 Jul 2009 07:45:01 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090720144501.GA32673@gmail.com>
References: <c384c5ea0907200144y3c53863bk6e75b24daf03fae@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0907200144y3c53863bk6e75b24daf03fae@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [PATCH] Support for powerpc-gnuspe for angstrom-eglibc
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
X-List-Received-Date: Mon, 20 Jul 2009 14:59:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (20/07/09 10:44), Leon Woestenberg wrote:
> The calamari machine uses a PowerPC E500 core, which has the (GNU)SPE
> ABI for it's signal processing extensions.
> This is the default ABI for Linux, so let's enable it.
> 
> This should not affect any other machines and/or architectures.
> 
> Tested-by: Leon Woestenberg <leon@sidebranch.com>
> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>

Looks good to me.

-Khem


