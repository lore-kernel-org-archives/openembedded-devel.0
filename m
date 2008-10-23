Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Kt1ZY-000194-9E
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 16:54:07 +0200
Received: by qw-out-1920.google.com with SMTP id 5so112456qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2008 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=Tc2VaXNDdquW0CBvwdSZ9Q/XjFDzWCtMMfp3A8TsyHY=;
	b=XpeLT4sxCJIZt4T3pTwjR8iCXbo4lvHk/nejYTQScF7Ct1/Sjp5UPj+YX1+Qccxowe
	IodfelL6ON1Tz3yQBpkPMC/pSfczfbyY8KLcfDhlz+HJnpGGAXXdR5o78RIvdJkZ5gGp
	VHoaooX1tSC4/trjVR1FA0th1LfaLrdmwf99I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=t32o8PU9gvSxyZ1+1H4XQSbJdQYkucheoCkpUIHLKBiUsTiZR9R5KGj7+p5sKp+qHP
	IeUtabR7j17Pkzpw0QXuQGgKZ9k7VngZWY0/04Bgc1hZfBg2w17WtDiZiWvTfKJxgj/n
	dCP666Xhw/nCnqGSXeGlJKeBrZ3bAeAtUlPac=
Received: by 10.214.10.4 with SMTP id 4mr1353525qaj.48.1224773608860;
	Thu, 23 Oct 2008 07:53:28 -0700 (PDT)
Received: by 10.214.12.10 with HTTP; Thu, 23 Oct 2008 07:53:28 -0700 (PDT)
Message-ID: <c384c5ea0810230753h58fbf106rdae7a2d613e8056b@mail.gmail.com>
Date: Thu, 23 Oct 2008 16:53:28 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <8c7950360810230631k530398dajbcbbf444a67333e5@mail.gmail.com>
MIME-Version: 1.0
References: <8c7950360810230631k530398dajbcbbf444a67333e5@mail.gmail.com>
Subject: Re: LTP (Linux Test Project) better embedded support
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
X-List-Received-Date: Thu, 23 Oct 2008 14:54:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Shane,

On Thu, Oct 23, 2008 at 3:31 PM, Shane Volpe <shanevolpe@gmail.com> wrote:

> I have been working with LTP (Linux Test Project) for several months
> now and had quite a bit of issues with its default settings on many
> tests mainly do to the limited resources on my hardware (RAM).  I have
> got most of it working but came to the conclusion that  previsions
> really needed made in the LTP mainline to better support embedded
> systems in the future.
>
Although I had updated LTP support at one time in OE I have not been
running LTP against many boards yet.

Do you use LTP as-is from OE?

> please post your ideas/suggestions to LTP list
> (ltp-list@lists.sf.net).  The initial thread I started, on the LTP
> list, regarding this issue was:" embedded systems with limited memory
> issues"
>
Yet another list to join. Maybe I will pass my remarks through you :-)

Regards,
-- 
Leon


