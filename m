Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Nkjpq-0008WS-Q9
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 20:57:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1PJsW9o012707
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 19:54:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12230-07 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 19:54:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1PJsOxg012701
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 19:54:24 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Feb 2010 19:54:21 +0000
Message-ID: <1267127661.4243.85.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=RDNS_DYNAMIC,TVD_RCVD_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: TSC feedback on reverts and personal conduct
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
X-List-Received-Date: Thu, 25 Feb 2010 19:57:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The TSC was asked to look into the console image commit and its
subsequent revert. Its taken us too long to respond for that I
personally feel bad and we *have* to get better at this. I will be
raising this at the next full TSC gathering (planned for next Tuesday).

The TSC has agreed the following:

1. The original commit was premature as the email thread did not reach a
particular conclusion and there were objections raised. The original
commit did not avoid breakage as well as it could have done and it would
have been possible to.

2. Despite the above, the revert was also premature, it should have
gained Acks. Reverts are one of the biggest sources of disagreement we
have for understandable reasons. Koen has been in this position before,
knows this and should have done more to set a good example of how to
revert something. This is particularly true given his membership of the
TSC where he needs to set an example.

3. A revert policy was discussed by the former OE Core team and agreed
upon but it was never communicated publicly despite some people thinking
it had been. Koen was well aware of that agreement.

4. We'd like to set a revert policy as follows, effective immediately:

"""
Reverting someone elses work is by far the greatest source of friction
in OE. As such, these need to be handled carefully, preferable on
technical grounds rather than personal ones.

Reverts may only be carried out with either
a) Acks from two TSC members not associated with original change.
b) An Ack from the original patch author.

This means you may revert your own mistakes.
"""


Personal conduct is not something the TSC feels is within its remit,
we're meant to be technical governance. As such we'd urge the e.V. board
to setup behaviour policy although if the board delegates this to the
TSC, we will do so. Adopting something similar to Ubuntu's, Debian's  or
some other project would be better than the current position.

Whilst its not within our remit we do feel the behaviour and language
used in some threads was not acceptable, particularly some comments from
Rolf.

Regarding the original commit, there were good reasons for making it and
we'd suggest that new proposals be put forward. The TSC will intervene
if agreement cannot be reached but the community needs to make an
attempt to properly discuss it first. It should be clear that name
calling and so forth is childish and not acceptable behaviour and we
want to see a technical discussion.

We're aware there is a bigger underlying problem here and there will be
discussions at the next full TSC meeting about this.



Regards,

Your TSC

Graeme Gregory (XorA)
Koen Kooi
Chris Larson (kergoth)
Michael 'Mickey' Lauer (mickeyl)
Richard Purdie (RP)




