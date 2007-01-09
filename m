Received: from [65.170.132.200] (helo=EXCHANGEVS1.comtechtel.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <vladislav.grinchenko@comtechmobile.com>)
	id 1H4KHi-0005Un-3a for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jan 2007 17:57:14 +0100
Received: from 10.5.0.222 ([10.5.0.222]) by EXCHANGEVS1.comtechtel.com
	([10.10.0.15]) via Exchange Front-End Server
	mail.comtechtel.com ([10.10.0.168]) with Microsoft Exchange
	Server HTTP-DAV ; Tue,  9 Jan 2007 16:55:31 +0000
Received: from zorro.comtechtel.com by mail.comtechtel.com;
	09 Jan 2007 11:56:01 -0500
From: Vladislav Grinchenko <vladislav.grinchenko@comtechmobile.com>
To: openembedded Mailing List <openembedded-devel@lists.openembedded.org>
Date: Tue, 09 Jan 2007 11:56:01 -0500
Message-Id: <1168361761.23671.36.camel@zorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 (2.6.3-1.fc5.5) 
Subject: Q: build/install gpe-image from dev branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2007 16:57:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I successfully built 'gpe-image' target against development branch,
'org.openembedded.dev'. The $builddir/tmp/deploy/images holds the
following files:

gpe-image-collie-20070108224738.rootfs.jffs2
gpe-image-collie-20070108224738.rootfs.tar.bz2
modules-2.6.18-collie.tgz
zImage-2.6.18-collie-20070108224738.bin

Q1: what controls the way zImage is built in terms of Xmemory/Ystorage
ratio? I'd like 64-0, but I can't find how to set it.

Q2: How do I install modules-2.6.18-collie.tgz? I'm using 'altboot'. Do
I need to copy it to my CF card along with zImage? Or, do I have to
install it by hand to (I would imaging) /usr/lib/?

thanks,
-Vlad


