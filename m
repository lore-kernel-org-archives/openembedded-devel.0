Received: from [217.146.130.193] (helo=chlothar.bnv-bamberg.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LesgZ-000762-RY
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 16:07:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bnv-bamberg.de; s=mail2008; h=Subject:From:To:Content-Type:
	Date:Message-Id:Mime-Version:Content-Transfer-Encoding; bh=Iov9m
	lVgDxyA95JWpIb81zlRIh8yQmjY/UPa6wJo72w=; b=GAwfoIdbfzv1wlT9WCPHi
	m83a95luFDnA5m9K3qw/SrE0Uvh/7t97qej+mYxmwKrqRx1BhZXQFYMPCT5GOZNs
	ZrebSxI0c4F6y27P6VL5RmXzro2sqhOgrKv7QRSGeIyfgdUDDo+s1qGsjL2C7QXi
	DBhkEMm+1njF4YBzcemt38=
Received: from localhost ([127.0.0.1] helo=chlothar.bnv-bamberg.de)
	by chlothar.bnv-bamberg.de with esmtp id 1LescW-0006Uz-Cz 
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 16:02:52 +0100
Received: from w0659.w.pppool.de ([89.58.6.89] helo=[192.168.2.3])
	by chlothar.bnv-bamberg.de with esmtpa (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LescV-0006Oq-MI
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 16:02:52 +0100
From: harald <ba0547@bnv-bamberg.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 04 Mar 2009 16:02:47 +0100
Message-Id: <1236178967.4249.7.camel@debian.dorg.org>
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
X-List-Received-Date: Wed, 04 Mar 2009 15:07:04 -0000
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



