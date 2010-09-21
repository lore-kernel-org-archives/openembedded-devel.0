Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Oy5J2-0003dY-U0
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 18:02:57 +0200
Received: from [192.168.42.217] (unknown [92.117.88.188])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id A9A171B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 16:05:28 +0000 (UTC)
Message-ID: <4C98D71E.2050608@freyther.de>
Date: Wed, 22 Sep 2010 00:02:38 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100908 Fedora/3.1.3-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: TSC Meeting Minutes for September I
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
X-List-Received-Date: Tue, 21 Sep 2010 16:02:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I am late and we are waiting to summarize the second meeting. I wonder if
someone would be interested to play secretary (well, I'm the closest to that)
like the board has one at FreeBSD.

TSC Meeting of 2nd of September 2010

NOTE: The ending stopped before every topic was discussed, there will
be another meeting to continue on Tuesday the 7th 15:00 UTC.


TOPICS:
  Outstanding issues with the TSC
  Future Items
  Giving Direction to OE
  Pace of removal
  OEDEM and ELC-E
  Infrastructure and the maintainers of it
  TSC escalation procedure
  base.bbclass: SOC_FAMILY
  testing branch, quality concerns in general
  Previous Minutes (missing ones)
  Feedback over last TSC issue


== Outstanding issues with the TSC ==

The list of outstanding issues can be found here[1]. For manageable tasks we
have found volunteers within the TSC, for bigger tasks it didn't seem to be
practical to assign someone. The policies are on the agenda and will be
discussed later.

We have assigned the following:
	insane.bbclass assigned to pb_
	master branch create the alias to holger
	packaged-staging assigned to kergoth

Unpractical to assign a single person:
	recipe cleanup
	staging removal

== Future Items ==
Not discussed yet.

== Giving Direction to OE ==
Not discussed yet.

== Pace of removal ==
Not discussed yet.

== OEDEM and ELC-E ==
TODO:


== Infrastructure and the maintainers of it ==
Not discussed yet.

== TSC escalation procedure ==
Not discussed yet.

== base.bbclass: SOC_FAMILY ==
Not discussed yet.

== testing branch, quality concerns in general ==
Not discussed yet.

== Previous Minutes (missing ones) ==
Not discussed yet.

== Feedback over last TSC issue ==

The TSC got a request to make a statement about the pace of removing
recipes. In this case actively used recipes were removed without giving
enough time to review, creating build issues and issues in the binary
feed. The TSC has asked to reduce the speed of removal and most importantly
allow enough time to review. We have proposed to either use a branch or
to use the removal.txt to indicate which recipes will be deleted.

The TSC did not inform the requester about the outcome of the issue. In
the future we will put a anonymous statement on the TSC page and will
inform the requester.





[1]
http://wiki.openembedded.net/index.php/TSC#Outstanding_items_.28sorted_by_occurence.29


