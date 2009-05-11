Received: from [74.125.46.155] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M3bxr-0007YS-L7
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 22:19:07 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1840208ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 13:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=h522QqG1CJOHp3/apcl1H+9CxIkP5LkZZgubfT/nqqA=;
	b=F031nL+g34B/7ql9IBy1+zsHi1D0TLYYsQPqMFMlrP0xuCoUhjn832DMZ/s0xs7Ii7
	skmFmZ3XcANqo96a06ocpwcgVt0voRRxv21CGIF9MJ5Aa1FL9NJLO5WMXVaOODK+DX8M
	doKcPjKPfdPMD/NpyPCaSVyE4vg4wwPiBV3vQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=k6j/EcQkwqkPuaWqwZkGikOINNX3aa3Jft9KbnXD8PEeOamT6lvsMV9UkHFGmBqirg
	UMxOVwysIRdrhqFYADBgNQi487GcKgRhIzeZKmml9PYT1LNXT9jsN7jdDhtmC0Ren2qx
	ZmUcBjoge/ykhoi9dN2rpyE6CPgoHleKlx6v4=
MIME-Version: 1.0
Received: by 10.151.132.4 with SMTP id j4mr13803097ybn.192.1242072754209; Mon, 
	11 May 2009 13:12:34 -0700 (PDT)
Date: Mon, 11 May 2009 16:12:34 -0400
Message-ID: <f96d234e0905111312s5680b3fendcef84f2b4918460@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: zfeepc stable?
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
X-List-Received-Date: Mon, 11 May 2009 20:19:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello.

I'm helping someone put OE on a machine that is very similar to the
zfeepc (486, no FPU).  We are seeing illegal instructions when
starting midori and enlightenment.  GDB is also acting a bit strange.
Things seem to run pretty well on a geode board with the same build,
with the exception that GDB still acts a bit strange -- apps that
don't fault, will fault when run under gdb.

I'm just curious if any of these problems have been observed on the zfeepc?

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


