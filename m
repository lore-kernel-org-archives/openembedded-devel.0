Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NVBdm-0004jR-Nf
	for openembedded-devel@openembedded.org; Wed, 13 Jan 2010 23:24:42 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0DMIGoW004483
	for <openembedded-devel@openembedded.org>; Wed, 13 Jan 2010 22:18:17 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6PDXIIQoysgx for <openembedded-devel@openembedded.org>;
	Wed, 13 Jan 2010 22:18:16 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0DMI9n5004466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Wed, 13 Jan 2010 22:18:13 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jan 2010 22:22:17 +0000
Message-Id: <1263421337.3575.3.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: TSC Meeting 7/1/2010
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
X-List-Received-Date: Wed, 13 Jan 2010 22:24:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

[Ed: Sorry for the delay, the email client didn't send the first round
to all recipients, then I was travelling for a couple of days and needed
to round up the Acks.]

Report from the first TSC Meeting

The five of us all met on Thursday 7th January 2010 at 8pm and our main
priority was to start to establish some kind of procedures for the TSC
to operate effectively.


Meeting of the TSC
==================

We decided that having a regular timeslot we could all get together for
a meeting would be desirable. We agreed to do this on the first Thursday
of each month at ~8pm with the meeting agenda being announced the Monday
beforehand. No meeting will be held unless agenda items have been
proposed. This also does not rule out adhoc meetings should there be a
need.

The log of the first meeting is not worth publishing, this summary which
we've all agreed on is what we want to publish. Future meetings will
also be summarized.

None of us object to the principle of holding TSC meetings in public but
we do have concerns about not getting anywhere if we have lots of people
talking rather than just us. We don't expect a lot of technical
discussion in most cases as this should have already happened in public
on the mailing lists. If that isn't the case we may sent it to the
community for discussion. We concluded that allowing lurkers for the
meetings was good, inviting key people involved in any dispute to
represent their position would also be good if appropriate but that in
general people wanting things presented at the meeting would do so by
proxy through any TSC member(s) of their choice. We will try this format
for the next meeting (4th February) and then take feedback.


Remit of the TSC
================

The TSC are the arbitrators for OE's technical decisions and direction
and we concluded there were two main types of decision the TSC is
responsible for:

a) Dispute resolution between two parties in disagreement
b) Final approval of architectural direction for OE


Decision Making Process
=======================

We decided to create a moderated mailing list for the TSC escalation
process. If someone wants to ask the TSC for a decision on a dispute or
sign off on an architecture improvement an email would be sent to this
list in a standard format (TBA). These will have a subject line of a
specific format and contain information about what the dispute is,
between who, with links to both sides of a discussion most likely on
oe-devel about the issue with an attempt at resolving it. The TSC will
either accept the request or reject it with a reason such as more
community discussion required. Once accepted it will be listed in the
list archives. If the opposing side in the dispute wishes to reply to
the request this is acceptable.

The TSC will then make a decision to resolve the issue which will be
published as a reply to the request. It can do this via email/irc/jabber
discussion between its members informally and then voting via email. Any
TSC member can request this be deferred and discussed in a full meeting.
Resolutions from the TSC will list each members vote since we want
transparency. Each person has one vote and the decision is by majority.
Abstention from voting is frowned up, TSC members are expected to
investigate issues and form opinions. Votes can be pre-arranged for
meetings if a member can't make it for any reason.


TSC Elections
=============

We're aware no election was held as the number of candidates matched the
number of places. We are aware of the overwhelming need for OE to have a
decision making process so we want to get processes setup to allow this
to happen ASAP but consider ourselves an interim solution. We propose
asking for candidates in April and holding elections for a new TSC then
if we have some. After this, elections will be annual or when the
membership calls for them through the normal e.V. processes.


Current Issues
==============

We did discuss the IMAGE_BOOT issue. We decided that weak defaults (?=)
in the class where the variables are used is a good thing and that the
current structure is pretty much inline with that for image.bbclass. The
IMAGE_BOOT change could have been better thought out but we're stuck
with it now with no real options for changing it.

Commit messages were mentioned. It should be clear from reading the
commit message what the change applies to and why its necessary. The TSC
will start naming and shaming people making lousy commit messages and
reserve the right to impose sanctions against repeat offenders.

The QA issues are not something the TSC can really "rule" on. Yes
testing is good but we have no hardware or human resources we can assign
to this. Where a regression is identified as being from a particular
commit, it is expected the regression should be fixed though.

Patches were mentioned. The TSC is encouraging patches to have headers
with information about who wrote them, when, why and if taken from
somewhere else, where this was.

Anything else we didn't cover we propose be submitted to the new mailing
list to test the new processes which will be available soon.


Regards,

Your TSC

Graeme Gregory (XorA)
Koen Kooi
Chris Larson (kergoth)
Michael 'Mickey' Lauer (mickeyl)
Richard Purdie (RP)






