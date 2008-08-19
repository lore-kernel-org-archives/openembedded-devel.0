Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dfarning@gmail.com>) id 1KVJP4-0001Qt-Kw
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Aug 2008 07:05:10 +0200
Received: by py-out-1112.google.com with SMTP id y77so1664162pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2008 22:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to
	:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding:sender;
	bh=o6zdA2enwgwdiyIjoX6l3wafTaHK+q9DEDzgYa6anuw=;
	b=xMCF8VNNu16JTp/oWBf5X9+5qRf2X2hati70QCicSw0+iOR02+bc6mJRWm854khg+b
	KHu9BlNcnuqX4TtpC2nCv0javd6w/lqkBRsxNlUbS2zYiAAVBzWTnOCNEFNluVl/JmHL
	2YNmgX2ScA7XPXPAgpWz48l2bkM4GUj8A62Gs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding:sender;
	b=NZ4OCjvaGbZOA9R86db0Eg+A/a2EJJaZVdTvwx3i6ehUxRP+O0O7MHa5EWGiOsDAP9
	D6G9lxVKZHBo/3phv+aSKnFmfbmt04/jVSmCC6jwMtV0ZeyMMKs4GJ3OljziQ7+kIKWr
	JeNBTciXOYpYRhSENwTleBfwCJ9b7Ip7CfyXQ=
Received: by 10.65.126.16 with SMTP id d16mr12995544qbn.63.1219122250465;
	Mon, 18 Aug 2008 22:04:10 -0700 (PDT)
Received: from ?192.168.2.3? ( [75.121.143.78])
	by mx.google.com with ESMTPS id k8sm14455943qba.5.2008.08.18.22.04.09
	(version=SSLv3 cipher=RC4-MD5); Mon, 18 Aug 2008 22:04:09 -0700 (PDT)
From: David Farning <dfarning@sugarlabs.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Aug 2008 00:04:07 -0500
Message-Id: <1219122247.7224.337.camel@dfarning.desktop.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Sender: David Farning <dfarning@gmail.com>
Subject: Sugar Desktop
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
X-List-Received-Date: Tue, 19 Aug 2008 05:05:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I am wondering if there is interest in creating OE packages for the
Sugar desktop [1].  Development of Sugar, which was originally designed
for the One Laptop Per Child, has been spun off to Sugar Labs.

We are interest in expanding the number of devices which run Sugar.  Our
goals of running on inexpensive, low power machines aligns nicely with
those of embedded devices.

Please let me know if anyone is interested in this type of project.  If
so, I will try to get something started.

thanks
dfarning



1. http://sugarlabs.org/go/Main_Page



