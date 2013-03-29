Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1ULUZo-00082K-Tu
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 09:22:21 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so144597dak.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=gZV1Mxzh9xrg46FIzf5TI/lgMg9fLDmwL7PcGQe+Dyo=;
	b=D6QeTrizlwLMT7PEcN4kDHscLHm7ZLx64dlI8ZuCtWQmPjJ/2dj2wi45fNg93XydSD
	yCPDmA4602F3PD/oUkU8pMC/3X1PrIIQ0aGRbVdVvlLnTn7Ux/m1XxrOutnejVmfI49o
	AXWM0Ba/o1rsEvbg5OzwRjf667sbG9+rsjwkfuY/UhnB3cqjIPhOWupgT1At14LZMJXt
	hYyhGpzPE7ECkpJ8oFmBSEXUmqad2kOJy4vpWXkiRfIFTFdQeJ8QsjCPTcPQdvQVFOt/
	1Ei/C6Qjc8K+WvjGGcvmUbze1Sy8ydotbGeBpOEqm+c8JnS5Is/MtJOW68ynlSty+xvP
	s+0Q==
X-Received: by 10.68.102.165 with SMTP id fp5mr2380777pbb.82.1364544316538;
	Fri, 29 Mar 2013 01:05:16 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.105.6])
	by mx.google.com with ESMTPS id da4sm1971387pbb.34.2013.03.29.01.05.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 01:05:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <EEAF4EC9-48F2-494E-8738-288B1786D9B2@gmail.com>
Date: Fri, 29 Mar 2013 12:05:10 +0400
Message-Id: <E61D67A4-3E32-412A-A532-8295B7E64727@gmail.com>
References: <y> <1364543252-18751-1-git-send-email-elvis.dowson@gmail.com>
	<EEAF4EC9-48F2-494E-8738-288B1786D9B2@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [openembedded-core-contrib] gcc-4.8: Refactor gcc-4.8.0 patch files.
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
X-List-Received-Date: Fri, 29 Mar 2013 08:22:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Mar 29, 2013, at 11:55 AM, Khem Raj <raj.khem@gmail.com> wrote:

> You did not mention whats refactored. One thing I notice they are git =
am'able now
> however you are signed up as author of all the patches if you send =
that email via git send-email
> and if you send patches upstream like that you will be frowned upon. =
So if you were adamant to gitify them
> you should have done --autho=3Dblah while committing them
>=20
> besides this is there anything else=20

I just refactored and re-ordered the patches, with the correct sequence =
number as it appears
in the git-4.8.inc recipe.

All the sign off attributions are still listed with your name and email =
address, I haven't signed up as
the author of all the patches.

I wasn't aware of the -autho option in git, if you want I can re-create =
and re-send it again.

I did  a similar clean up for the gcc-4.7 recipe patches.

Best regards,

Elvis Dowson=


