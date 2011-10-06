Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1RBjJA-0001Sa-Gl
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Oct 2011 10:28:00 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RBjDm-0003IS-W6>; Thu, 06 Oct 2011 10:22:27 +0200
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RBjDm-0007N8-Ty>; Thu, 06 Oct 2011 10:22:26 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by mail.imp.fu-berlin.de with esmtps (Exim 4.72) id 1RBjDL-0001sQ-M5
	(envelope-from <heinold@mi.fu-berlin.de>)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2011 10:22:11 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1RBjDG-0005r7-Hu
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2011 10:21:54 +0200
Date: Thu, 6 Oct 2011 10:21:54 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111006082154.GA21093@mi.fu-berlin.de>
References: <1317856310993021500@rkmorris.us>
MIME-Version: 1.0
In-Reply-To: <1317856310993021500@rkmorris.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Remote-IP: 160.45.42.84
X-Spam_Score: -3.4
X-exim-Spam_Score_Int: -33
X-exim-Spam_Bar: ---
X-Spam_Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.5 RP_MATCHES_RCVD Envelope sender domain matches handover relay
	domain * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Originating-IP: 160.45.117.149
Subject: Re: Getting Started
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
X-List-Received-Date: Thu, 06 Oct 2011 08:28:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 05, 2011 at 06:11:50PM -0500, Russell Morris wrote:
> Hi,
> 
> My apologies in advance for what is likely a stupid question, but I have been working with OpenEmbedded for a while, with some level of success (and some pain ... :-)), but it really seems that the current information on the Wiki site related to Getting Started (http://www.openembedded.org/wiki/Getting_started) is out of date.
> 
> I have checked out the git repository, and it really seems that the newer "core" and "meta" trees are being updated regularly (and not the old openembedded tree), but I'm not sure how to use them to get builds working. This is likely just ignorance on my part, but is there any info out there of how to work with the new structure?
> 
> Thanks in advance for any pointers that you have!
> 
> ... Russell

Hi Russel,

oe-core is described here too

http://www.openembedded.org/wiki/Oe-core

Bye Henning


