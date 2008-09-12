Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jroman.espinar@gmail.com>) id 1Ke6D8-0007P4-G9
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Sep 2008 12:49:10 +0200
Received: by rv-out-0708.google.com with SMTP id f25so999728rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2008 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:sender
	:to:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references
	:x-google-sender-auth;
	bh=x/E7Evs/2CcEpzlLl6AMeYUctkPO0XK6p/LeoPnA7NY=;
	b=U9M345lUvcPLNVDMqw1V/cRL6e/ogncP2aYQQv/GF5anMHYQeMlMKQdP+zzVAK9QRa
	7z9tksR6NS44aivMKwZmrVFKl/6HI6Fc8ASSYiQDGUaSthyFty1c4pdJd/qqwnMjnuuJ
	MwiFIp1DsAKpzoJOGg4SSfGMM9JJkvOQ7WQCY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:sender:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references:x-google-sender-auth;
	b=W2jxom9Y4NlUDVTm9+Rlil3vNLMxq1y7zLTP9yE1iIZfukfHvgtHQqK8t14RVURwde
	ufEpl+aR6tRuitvMhNXZR+6fLJbU9XWGvrM5csO6dRhBc9N77+pQNu+lUuPFtvHOtQwg
	ScSYOJhRXXlF/nYylesNcZ60+MZ63mA/y1lhU=
Received: by 10.141.34.12 with SMTP id m12mr2523751rvj.26.1221216384706;
	Fri, 12 Sep 2008 03:46:24 -0700 (PDT)
Received: by 10.140.187.13 with HTTP; Fri, 12 Sep 2008 03:46:24 -0700 (PDT)
Message-ID: <12c2e32e0809120346g2745eff5ja0c85111f30bde25@mail.gmail.com>
Date: Fri, 12 Sep 2008 12:46:24 +0200
From: "Javi Roman" <javiroman@kernel-labs.org>
Sender: jroman.espinar@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E2B3B01@hiob.intern.dresearch.de>
MIME-Version: 1.0
References: <69E6C70090A0A14498CC98FAE5E06B6E2B3B01@hiob.intern.dresearch.de>
X-Google-Sender-Auth: c34d3de8ccd5c913
Subject: Re: Some beginners problems
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
X-List-Received-Date: Fri, 12 Sep 2008 10:49:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Sep 12, 2008 at 12:26 PM, Sledz, Steffen <sledz@dresearch.de> wrote:
>
> It would be nice to separate the changes not mentioned to become upstreamed from the org.openembedded.dev git tree.
>


Bitbake collections:

http://www.kernel-labs.org/files/openembedded-guide/openembedded-guide-6.html

-- 
Javi Roman


