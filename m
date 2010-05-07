Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OAVqJ-000468-7R
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 00:16:23 +0200
Received: by fxm11 with SMTP id 11so1134501fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 15:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Wvc1+4P0gBoK7rqMRuXj+qb+0/KUGQ0BXLyIX1JFm+s=;
	b=UAuWxM+ifGLBukpVLEm5j1JMF7WSI4ffJxRVEYSZBUt8S7DWP11KgD+p/Vck3dt5HA
	TvJA4Ph+/aFBP+y29LJRk3VZoGr3JdMNeFQA35AgHiqKKJboxgHQSLkc7II3b3LEYOBY
	rz5cQOvUTjnngc0NpJ+qK5wsj3B9uk+i3PPKA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TlGyka5ByMPy43r1WmGyTVVe0vEPBCnxmuZuVuPQCnuXLFmAP8RyuXd3Q5elWR4XAs
	jYdmo82qnBAqPCYySbFjHWFfMchCwNNwiaqTLo1XySuSF0CPvYgziKbwnD2B9ceYPLAG
	735bNNSa0AJpHRUcvr0KtNdxmVcldP2XArnSg=
MIME-Version: 1.0
Received: by 10.239.187.71 with SMTP id k7mr61821hbh.11.1273270353380; Fri, 07 
	May 2010 15:12:33 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Fri, 7 May 2010 15:12:33 -0700 (PDT)
In-Reply-To: <g2kd1b08f941005071457ud7949e4cx295b79bf0bfe1fd2@mail.gmail.com>
References: <1273102999.5743.49.camel@rex>
	<1273104883.457.56.camel@trini-m4400>
	<1273175555.457.296.camel@trini-m4400>
	<s2g19c1b8a91005061817i5719e011z51260b5361e708e7@mail.gmail.com>
	<1273248787.457.324.camel@trini-m4400>
	<p2pd1b08f941005071437o2f204e22jdf93ac2db58d6572@mail.gmail.com>
	<g2kd1b08f941005071457ud7949e4cx295b79bf0bfe1fd2@mail.gmail.com>
Date: Sat, 8 May 2010 00:12:33 +0200
Message-ID: <j2xd1b08f941005071512jb2e8fbe2x7b1b5a8d9af4735a@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Fri, 07 May 2010 22:16:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Sorry, these are all occurrences (console image + opie image
+x11-image). Bad do_install ?

69:cp: cannot stat
`/oe/build/tmp/work/i686-linux/stagemanager-native-0.0.1-r12/sysroot-destdir//oe/build/tmp/*':
No such file or directory
778:cp: cannot stat
`/oe/build/tmp/work/i686-linux/quilt-native-0.48-r0/sysroot-destdir//oe/build/tmp/*':
No such file or directory
6276:cp: cannot stat
`/oe/build/tmp/work/i686-linux/cmake-native-2.6.4-r2/sysroot-destdir//oe/build/tmp/*':
No such file or directory
6649:cp: cannot stat
`/oe/build/tmp/work/i686-linux/tcl-native-8.4.19-r4/image/*': No such
file or directory
28082:cp: cannot stat
`/oe/build/tmp/work/c7x0-angstrom-linux-gnueabi/task-boot-1.0-r52/image/*':
No such file or directory
29410:cp: cannot stat
`/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/opie-libqrsync-1.2.4-r0/image/*':
No such file or directory
33418:cp: cannot stat
`/oe/build/tmp/work/c7x0-angstrom-linux-gnueabi/task-opie-1.0-r13/image/*':
No such file or directory
33468:cp: cannot stat
`/oe/build/tmp/work/c7x0-angstrom-linux-gnueabi/task-base-1.0-r89/image/*':
No such file or directory
35204:cp: cannot stat
`/oe/build/tmp/work/all-angstrom-linux-gnueabi/angstrom-libc-fixup-hack-1.0-r0/image/*':
No such file or directory
38173:cp: cannot stat
`/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/xscrnsaverh-1.0-r0/image/*':
No such file or directory
39753:cp: cannot stat
`/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/matchbox-0.9.1-r1/image/*':
No such file or directory
43115:cp: cannot stat
`/oe/build/tmp/work/all-angstrom-linux-gnueabi/angstrom-gpe-task-settings-1.0-r35/image/*':
No such file or directory
43223:cp: cannot stat
`/oe/build/tmp/work/c7x0-angstrom-linux-gnueabi/angstrom-gpe-task-base-1.0-r40/image/*':
No such file or directory
43315:cp: cannot stat
`/oe/build/tmp/work/c7x0-angstrom-linux-gnueabi/angstrom-x11-base-depends-1.0-r43/image/*':
No such file or directory


Andrea


