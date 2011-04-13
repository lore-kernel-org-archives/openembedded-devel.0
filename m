Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gilby985@gmail.com>) id 1QA9r3-0004jf-DW
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 01:52:13 +0200
Received: by iwn10 with SMTP id 10so1131493iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 16:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=/amN36NBMHxMI5icb8SG8NPprK2VZj3M6w2sd7Fx9LM=;
	b=Mhb1C/DHTEC3dbC7mT1b6tno2T9iIFoxxVon0X3K3oCRM/E+5Wv7nZPu3B6zsOn06i
	W1xhgSFd4zu/B+HGMsa1bFNPCvJzeATzjAnpI/pExdS7jRO7Lww8m2xY/hy2jaUS3tAd
	0n1s8aeGSqPeBczP+yAk3QqrGIwR8cKtzy1Ys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mvWX14gvTCzJqOEuqf0j2XgBSIKuXmtJywQc00wnkwWAXU1CCZjm5ocEMiF3SAQsyX
	ZhMmqn+kuRnCWnmqXMHxi+KhUEbMkRM436CIki1Is4jf0yDRlWYx8m39ogQFY+kAMEgl
	4sfND3GSSoobodc1Q3p1UzClYdtW0eW+l4F70=
MIME-Version: 1.0
Received: by 10.42.137.130 with SMTP id y2mr72876ict.486.1302738587029; Wed,
	13 Apr 2011 16:49:47 -0700 (PDT)
Received: by 10.42.224.73 with HTTP; Wed, 13 Apr 2011 16:49:46 -0700 (PDT)
In-Reply-To: <BANLkTinm3CfQDhxyBuUJH6Eg4QgUo_8JUQ@mail.gmail.com>
References: <BANLkTinm3CfQDhxyBuUJH6Eg4QgUo_8JUQ@mail.gmail.com>
Date: Thu, 14 Apr 2011 01:49:46 +0200
Message-ID: <BANLkTimufsQ4foAp3Tog17dfRZyizAZRsw@mail.gmail.com>
From: Alberto Carrozzo <gilby985@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: arm-angstrom-linux-gnueabi-gcc: No such file or director
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
X-List-Received-Date: Wed, 13 Apr 2011 23:52:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

hello you all... I'm from Italy so sorry for my english... :) OK... I have a
problem: I'm developing a program on Angstrom and I'm using Ubuntu to cross
compile it with bitbake... last week I had to format ubuntu so I had a
backup of my oe folder and have replaced it after... now, all look that
work, if i do bitbake x11-image it work but... if i try to cross compile my
helloworld sample it give me the following error:
______________________________
arm-angstrom-linux-gnueabi-gcc: No such file or directory
ERROR: Function do_compile failed
______________________________

what's happened?
someone can help me?

-- 
He walks among us, but he is not one of us - JS



-- 
He walks among us, but he is not one of us - JS

