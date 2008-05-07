Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1Jtn2m-0007Cq-AG
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2008 19:03:05 +0200
Received: by ug-out-1314.google.com with SMTP id c2so290451ugf.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2008 10:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=uPtEMCJmQpIYUe7FofScaNoP1Yl//bal2y/0QtvRDvw=;
	b=Fm8zhYUqyoXuYXzFzq0ISlooZn2492lzMXrFcykk8Ih+5y+5cvSgkcHENL1MR0CQ7dUANUgGQ448i08GeHeeobSERk+E2xSx6dbi+RDNoSrJ0QFYN+KhO02E+AXelIKhX00QRgBD7qo/V3xw40Qh/kBod+N46O6K4UPvZSIdKdA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=u0CB1FEX4+Khih3oYJY+hQiRwiyeUGHgN0HbcLjURCiolfD1U4qRh560fCEFtgMJ5UawC5iTl0aFGMF61hvk/uzNED1GSXA1cGKDZ+vLkZIju4eGiNBEn9+PwsQEP6VJkuvSgT2E0hHpy58vHpj/eFNYfrV4zMYVUKIE9s/jUVo=
Received: by 10.78.172.5 with SMTP id u5mr660114hue.10.1210179750030;
	Wed, 07 May 2008 10:02:30 -0700 (PDT)
Received: by 10.78.161.14 with HTTP; Wed, 7 May 2008 10:02:30 -0700 (PDT)
Message-ID: <35a670560805071002s729efe6j4fe66f792f160132@mail.gmail.com>
Date: Wed, 7 May 2008 19:02:30 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90805070921j7e4355a6vd2ff2bb4649e3a25@mail.gmail.com>
MIME-Version: 1.0
References: <35a670560805070733s30f077dcu92729e5f2356f0c1@mail.gmail.com>
	<19c1b8a90805070921j7e4355a6vd2ff2bb4649e3a25@mail.gmail.com>
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 07 May 2008 17:03:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, May 7, 2008 at 6:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> any compiler ICE is a compiler problem. You can reduce the testcase and may
>  file a bug in gcc bugzilla.
Yeah, but since nobody else (says Google) seems to have this problem,
I'm wondering what exotic settings I'm using that causes this.
Koen Kooi also does not mention this problem in his gcc-4.3 progress
report of a while back, so I assumed that I was doing something wrong.


