Received: from ey-out-1920.google.com ([74.125.78.145])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NXx6W-0003GD-MF
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 14:29:48 +0100
Received: by ey-out-1920.google.com with SMTP id 13so15409eye.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 05:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=fFFiJlg9hKR20lPGV6KZWKcYHHCCmq23Rt8XRQKeKc4=;
	b=CGOUDY4CYlrADgu/fE9kBJsIiN53jhurdQfHn4BEaqKw0R4HN6cB93MrnqavkS4kE/
	EG3uGXKcUKwYCscYc3nI5eKJjzPPAe1gTD/CYOCNmnvn7snvJVE7bS0pBK+BVSH7lMR/
	mLNOtHoABAD1A7TOSedmOgn+b9zinQunjOb5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=h2VkJdFYmYBH2etYMJMtsfZNcOAgqLxLiNWTCIufRaTahPyDbiKBuqWPQ7/tWy6XQf
	K/hCgIkfgY9KITEV1As+u1duEUHdQQRHz4Kz4zktzCDBkQ8wTVK8rZxGdzf+1zq3p1Uj
	8FTCYiOfXGRqMBYkXjZXnAInSie7nlNoiiA8Q=
MIME-Version: 1.0
Received: by 10.213.96.203 with SMTP id i11mr1364045ebn.9.1264080449985; Thu, 
	21 Jan 2010 05:27:29 -0800 (PST)
In-Reply-To: <1263976396.5407.3.camel@laptop>
References: <1263976396.5407.3.camel@laptop>
Date: Thu, 21 Jan 2010 14:27:29 +0100
Message-ID: <d1b08f941001210527pc2962c1lce6eba7df612412@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.145
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9.bb QA error
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
X-List-Received-Date: Thu, 21 Jan 2010 13:29:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

> '/home/usr/OE/Temp/work/armv5te-none-linux-gnueabi/glibc-2.9-r35.2/install/nscd/usr/sbin/nscd'

What is in your local.conf? DISTRO and MACHINE?

Regards

Andrea


