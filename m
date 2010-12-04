Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>)
	id 1POjRl-0007g9-Lx; Sat, 04 Dec 2010 05:10:06 +0100
Received: by gwj22 with SMTP id 22so3224590gwj.28
	for <multiple recipients>; Fri, 03 Dec 2010 20:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=Vd+/UvrVAhJW6tUeUsL4k0EjS7wcI9V8gPEsfj8Xkmc=;
	b=W+nxdQclGXeGwkb4rXB9P+DESZjC8MmMuXYH92VYgffSOZAyxcoAwWZv1OhEYoCwrU
	CHL9n6ycuuAhJuUd6epjiu9rCYUzK/9Kp83V3Nyr7X5A2zLkL8MhTydey/8jiqhlLXfi
	dmGTXHR7bh31fh0fTcnGyf464FxnElaEIvBwI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=vHr3I1IhM/7Ka6ub4Ss4maeo1tsu8B8TOJgbVIT6qzaqrjAVawfo5Vs9Y74+ZBPcnw
	rkCV0SmB7td8o2r5A2hPBO2GMGN/FlE/U9hYr1bxbJopBF7hYxk8LhyMmZSYUlFrE3Ra
	TQIYIwp8dfPbL5944FuzZpjvE0mbetLLeQht4=
Received: by 10.91.51.19 with SMTP id d19mr4237936agk.183.1291435720328; Fri,
	03 Dec 2010 20:08:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Fri, 3 Dec 2010 20:08:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Dec 2010 20:08:20 -0800
Message-ID: <AANLkTik0zjtfygu8taBf_bUAdgu_yCtkH_1ZaKb5WX0+@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	openembeded-users <Openembedded-users@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.83.41
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [ANNOUNCE]: OpenEmbedded 2010.12 released
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
X-List-Received-Date: Sat, 04 Dec 2010 04:10:06 -0000
Content-Type: text/plain; charset=UTF-8

On behalf of OpenEmbedded Commmunity, I am excited to announce 2010.12
release of OpenEmbedded.
This release was focussed on stabilizing the metadata and getting
various distro/machine/image
combinations to work. A lot of effort was put by community to make
this happen and a table of tested combination is available at

http://www.openembedded.org/index.php/Release-2010.12

In order to get the release using git

$ git clone git://git.openembedded.org/openembedded

$ cd openembedded

$ git checkout -b release-2010.12 release-2010.12

To download the release in form of tarballs

http://git.openembedded.org/cgit.cgi/openembedded/snapshot/release-2010.12.tar.bz2
http://git.openembedded.org/cgit.cgi/openembedded/snapshot/release-2010.12.tar.gz

BIG thanks to everyone who tested different combinations, took part in
stabilization effort, provided patches
and provided feedback for the release to make it happen

Enjoy !

-Khem


