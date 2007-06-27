Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1I3YVv-0003oU-Md
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2007 16:28:59 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 3856D411AFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2007 09:24:38 -0500 (CDT)
Message-ID: <018001c7b8c6$b06605a0$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2007 09:23:10 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Notice: New version of the madwifi drivers
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
X-List-Received-Date: Wed, 27 Jun 2007 14:29:00 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Unless anyone has objections, I intend to update the madwifi-ng drivers to
the 20070626 version.  I'll commit the .bb file no sooner than tomorrow (24
hours or more).  IIRC, those sensitive to these changes (such as SlugOS)
agreed to define a preferred version in the appropriate conf file, so this
change should have no effect for those who don't wish to see it.

This update is required by SlugOS in order to build with the 2.6.21 kernel.
I've tested it (basic testing only) with SlugOS/BE using WPA; it seems to
work better than most of the other recent version did.

Thanks,
Mike (mwester)




