Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H3zBT-00049O-JK
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 19:25:23 +0100
Received: by nf-out-0910.google.com with SMTP id l24so8754598nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2007 10:23:43 -0800 (PST)
Received: by 10.49.41.12 with SMTP id t12mr10536479nfj.1168280623824;
	Mon, 08 Jan 2007 10:23:43 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id x24sm107906297nfb.2007.01.08.10.23.42;
	Mon, 08 Jan 2007 10:23:43 -0800 (PST)
Date: Mon, 8 Jan 2007 20:23:51 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <47203419.20070108202351@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45A2892E.5030906@dominion.kabel.utwente.nl>
References: <200701081618.46665.openembedded@hrw.one.pl>
	<f96d234e0701080819q7a8017d3q922b055670163c54@mail.gmail.com>
	<45A26FE1.9050705@dominion.kabel.utwente.nl>
	<1168278774.5605.127.camel@localhost.localdomain>
	<45A2892E.5030906@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: Status of ARM machines in OE
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
X-List-Received-Date: Mon, 08 Jan 2007 18:25:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Monday, January 8, 2007, 8:10:54 PM, you wrote:

[]

> Note that you can run eabi on strongarm by forcing
> -no-thumb-interwork, which requires
> some glibc hacking to remove -Werror from various makefiles. This doesn't buy you much,
> since you still need seperate feeds for armv4, armv4t, armv5te and armv6 (and powerpc,
> x86, etc).

  But that's not an issue, as Angstrom  already maintains bunch of
feeds, and adding "armv4" won't be lots of trouble, right?

  So, I just hope that SA machine people (or someone else) will hack
in EABI support eventually to gcc/glibc/etc. ...

> regards,

> Koen


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



