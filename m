Received: from [217.146.130.193] (helo=chlothar.bnv-bamberg.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LedNV-0004nQ-PQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 23:46:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bnv-bamberg.de; s=mail2008; h=Subject:From:To:Content-Type:
	Date:Message-Id:Mime-Version:Content-Transfer-Encoding; bh=W8uGk
	g7YDbHI7vgRDY3DZYw9ph8BMhbfU9RsEbn09N8=; b=SibcLUqL+xv93Bkh8t4DZ
	1PmYTWF0MpldCi0DPV6eqJocVnKopLgSYU3s0Jlrk3FbVbkqf4nK30RtqWJnTsSR
	fl9U0H5OWSAD8Xnf6DHXCpJQkJZoWK/DZPA0K00n20JpwgYa6ZZkMVJWvwt2Ybvq
	opPAmF0AnuGVrZa1zpLtq4=
Received: from localhost ([127.0.0.1] helo=chlothar.bnv-bamberg.de)
	by chlothar.bnv-bamberg.de with esmtp id 1LedJX-0004FU-Py 
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 23:42:15 +0100
Received: from w185b.w.pppool.de ([89.58.24.91] helo=[192.168.2.3])
	by chlothar.bnv-bamberg.de with esmtpa (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LedJX-0004EE-6b
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 23:42:15 +0100
From: harald <ba0547@bnv-bamberg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 03 Mar 2009 23:42:12 +0100
Message-Id: <1236120132.4480.10.camel@debian.dorg.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Linux/Opie/Angstroem on Fujitsu Siemens Loox 420
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
X-List-Received-Date: Tue, 03 Mar 2009 22:46:47 -0000
X-List-Received-Date: Tue, 03 Mar 2009 22:46:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

managed to build a complete opie-image with
openembedded. Read that my Fujitsu Siemens Pocket Loox is very similar
to HP Ipaq 4000. So i built system for this machine type. Unfortunately
the system does not start througth. It hangs after "freeing init
memory:88k", then some lines appear with some bluetooth informations.
That's all. System seems to run still, gives me some messages after i
did some inputs to the touchscreen, maybe basic initialisation fails or
there is something wrong with busybox?  Do you know what i can do to get
opie, anstrong running on my machine? is it possible to generate a
customized installation on openembedded for this kind of machines? 

Thank you for any tip.

Regards, harald. 



