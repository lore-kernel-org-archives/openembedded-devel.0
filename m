Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1UTUeF-0004sI-TP
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Apr 2013 12:04:00 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1UTUMx-000ARn-2Z>; Sat, 20 Apr 2013 11:46:07 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1UTUMw-001LfX-TY>; Sat, 20 Apr 2013 11:46:06 +0200
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1UTUMv-0003rv-Qr
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Apr 2013 11:46:05 +0200
Date: Sat, 20 Apr 2013 11:46:05 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130420094605.GA13784@mi.fu-berlin.de>
References: <1366380143-12256-1-git-send-email-Martin.Jansa@gmail.com>
	<1366380143-12256-3-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1366380143-12256-3-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [meta-oe][PATCH 3/3] llvm2.9: try to fix thumb build and disable it after failure
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
X-List-Received-Date: Sat, 20 Apr 2013 10:04:05 -0000
X-List-Received-Date: Sat, 20 Apr 2013 10:04:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

sorry to say but arm support on 2.9 is broken in serval way. I put
it in mostly for testing purpose. Maybe with upcoming llvm 3.3 the arm situation
will be better.

Bye Henning


