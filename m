Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LrDbq-00070K-KR
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 17:53:34 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1LrDYz-0005l0-9M
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 16:50:13 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1LrDYz-0001M7-58
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 16:50:13 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d1b08f940904070841y3d7ca01erae4a50625faff158@mail.gmail.com>
References: <49DA2F2C.60008@bolloretelecom.eu>
	<19c1b8a90904061449s1cc1c4e6pb1c04f2c71cc6beb@mail.gmail.com>
	<1239096233.16991.525.camel@mill.internal.reciva.com>
	<d1b08f940904070841y3d7ca01erae4a50625faff158@mail.gmail.com>
Date: Tue, 07 Apr 2009 16:50:13 +0100
Message-Id: <1239119413.8617.4.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make "LDFLAGS ignored" QA errors fatal
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
X-List-Received-Date: Tue, 07 Apr 2009 15:53:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-04-07 at 17:41 +0200, Andrea Adami wrote:
> libgtkstylus:
> non dev contains .so, libgtkstylus,
> /work/armv5te-angstrom-linux-gnueabi/libgtkstylus-0.3-r5/install/libgtkstylus/usr/lib/gtk-2.0/2.10.0/modules/libgtkstylus.so

This is a bogus error.  The package is behaving correctly, the error
just needs to be suppressed.

p.




