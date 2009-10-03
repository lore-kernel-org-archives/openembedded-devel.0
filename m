Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mu1eH-00081t-5W
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Oct 2009 12:15:36 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 058A21B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2009 10:22:19 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 3 Oct 2009 12:14:21 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.31; KDE/4.3.1; i686; ; )
References: <fd72b8f50910020840r55927655h94deabff2e4da7cb@mail.gmail.com>
In-Reply-To: <fd72b8f50910020840r55927655h94deabff2e4da7cb@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200910031214.22067.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: libmikmod_3.2.0-beta2, build error
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
X-List-Received-Date: Sat, 03 Oct 2009 10:15:36 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 02 October 2009 17:40:53 mail mail wrote:
> Log file here:
> NOTE: Running task 1371 of 2265 (ID: 1561,
> /home/derek/mini2440/oe/openembedded/recipes/libmikmod/
> libmikmod_3.2.0-beta2.bb, do_package)
> ERROR: QA Issue with libmikmod: No GNU_HASH in the elf binary:
> '/home/derek/mini2440/oe/tmp/work/armv4t-angstrom-linux-gnueabi/libmikmod-3
> .2.0-beta2-r0/install/libmikmod/usr/lib/libmikmod.so.3.0.0' ERROR: QA run
>  found fatal errors. Please consider fixing them.


Did you consider doing the above? The libmikmod buildsystem is ignoring the OE 
LDFLAGS...

z.


