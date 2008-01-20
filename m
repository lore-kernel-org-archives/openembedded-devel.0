Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JGjMP-00084I-M4
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2008 00:13:53 +0100
Received: from PROMETHEUS (e180137051.adsl.alicedsl.de [85.180.137.51])
	by drlauer-research.com (Postfix) with ESMTP id 712D4584BCB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2008 00:16:52 +0100 (CET)
Date: Mon, 21 Jan 2008 00:13:53 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1697236488.20080121001353@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1JGgkN-0004go-O8@linuxtogo.org>
References: <E1JGgkN-0004go-O8@linuxtogo.org>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev altboot: Add SVNR77
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
X-List-Received-Date: Sun, 20 Jan 2008 23:13:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

coredump2 commit wrote:
> altboot: Add SVNR77

> Author: coredump2@openembedded.org
> Branch: org.openembedded.dev
> Revision: 0ce1ec91df499539b43f53a80718a77449b22b6b
> ViewMTN:
> http://monotone.openembedded.org/revision/info/0ce1ec91df499539b43f53a80718a77449b22b6b
> Files:
> 1
> packages/altboot/altboot_1.1.1+wip-SVNR76.bb
> packages/altboot/altboot_1.1.1+wip-SVNR77.bb

Is there a good reason why you are not doing this by adding
altboot_1.1.1+wip-svn.bb and increasing the svn revision by using
conf/distro/include/sane-srcrevs? This seems to be the usual way of
dealing with fixed-revision svn packages nowadays in OE.



Regards,

:M:

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



