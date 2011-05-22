Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1QO5Xv-0000XQ-AT
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 12:06:06 +0200
Received: (qmail 27442 invoked from network); 22 May 2011 12:03:06 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 22 May 2011 12:03:06 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id gG+rYElpBkV4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 May 2011 12:02:54 +0200 (CEST)
Received: (Qmail 27340 invoked from network); 22 May 2011 12:02:54 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 22 May 2011 10:02:54 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1QO5Ur-0002ll-Vr
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 May 2011 12:02:54 +0200
Date: Sun, 22 May 2011 12:02:53 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110522100253.GA8166@mi.fu-berlin.de>
References: <1305997042.12054.71.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1305997042.12054.71.camel@mattotaupa>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: minimal-uclibc: pulseaudio: task compile fails with	`./.libs/libpulsecommon-0.9.22.so: undefined reference to	`backtrace_symbols'`
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
X-List-Received-Date: Sun, 22 May 2011 10:06:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Okay,

so it's need a patch to link against ubacktrace. Will do it later.

Bye Henning


