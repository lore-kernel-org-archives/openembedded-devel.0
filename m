Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PrVaE-0002CU-Ra
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 14:13:46 +0100
Received: by fxm8 with SMTP id 8so1436816fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 05:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=hyvIOCjOTY9lXclWcH55pk0KIgtUNf1brEFL9mespUM=;
	b=l6u5hBTlIahVNWaKET+xpsdWUOoze9k7KCGsvjJlHrUcmNse6q+aPkbQgnGSAuR4mL
	rq7dIlWhGMwzr+MdJrf/1Tc1Y+7caSt/GKYUqRbslNY/5dwQyxO3Sl+OxEtlHTBkygBH
	sr4t4DGBxCGbeCc3y9bOodFRjcUbxNgGZHAMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=KaNPnSnlR2dTMd4lYbpVg/LA/47CYVWOLKy9ZCTR8QifjYAnczRUo4Mz+nDdimMVFS
	FVPmjRpvjpo325G+tistPOrh7zd/avoN66AfdMbtCLDisbE8CX3sP4C1m3JEuSg2WLVi
	iheqgy8FQecVaZl4HQmM1nagQKPPnpYYEC7LI=
MIME-Version: 1.0
Received: by 10.223.115.75 with SMTP id h11mr1772725faq.119.1298293865396;
	Mon, 21 Feb 2011 05:11:05 -0800 (PST)
Received: by 10.223.108.83 with HTTP; Mon, 21 Feb 2011 05:11:05 -0800 (PST)
Date: Mon, 21 Feb 2011 14:11:05 +0100
Message-ID: <AANLkTi=7va_AHVV0zYoPqPf2dFUS4QrLMVCW7iYMr_dg@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Please mention "why" in the commit messages
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
X-List-Received-Date: Mon, 21 Feb 2011 13:13:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

I am continuously running into build errors that relate to recent
commits and I try to find fixes for them.

However, the trend is that recent commit messages do not always tell
_why_ the change was needed., i.e. what does the commit solve?

Therefore, a kind request to summarize this in your commits:

1) tell _what_ has changed.
2) tell _why_ is has changed, i.e. what does the commit solve?


Regards,
-- 
Leon


