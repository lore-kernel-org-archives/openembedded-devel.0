Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1HN1Gy-0002vr-55
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2007 07:29:44 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id D4AC241246D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2007 00:29:43 -0600 (CST)
Message-ID: <07ee01c75c94$15472dd0$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Mar 2007 00:29:08 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: fuse package broken?
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
X-List-Received-Date: Fri, 02 Mar 2007 06:29:45 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Is anyone using the fuse packages currently?

The latest version in OE doesn't build correctly for me (it immediately
starts building fuse-module -- which is no longer necessary since the fuse
kernel module is in recent kernels already -- but worse it attempts to build
an older version of the module than the utilities).

I'd like to fix it so that we have the userspace fuse utilities to go along
with the kernel module, but before I do so I'd like to discuss the approach
with whomever might be using them at present.

Regards,
Mike (mwester)




