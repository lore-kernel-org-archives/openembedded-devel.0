Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KuQK1-0002jn-GD
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 12:31:45 +0100
Received: from andromeda.vanille.de (e180160026.adsl.alicedsl.de
	[85.180.160.26])
	by drlauer-research.com (Postfix) with ESMTP id 1594D584BB8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2008 12:44:49 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Oct 2008 12:30:55 +0100
User-Agent: KMail/1.9.10
References: <ge211u$h4r$1@ger.gmane.org> <4905A264.9050509@klever.net>
In-Reply-To: <4905A264.9050509@klever.net>
MIME-Version: 1.0
Message-Id: <200810271230.56134.mickey@vanille-media.de>
Subject: Policies vs. Guidelines vs. Requirements (was: Reverting recent openmoko commit)
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
X-List-Received-Date: Mon, 27 Oct 2008 11:31:45 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Guys,

to me these "policies" were always more guidelines than strict requirements. 
We are not a beaurocratic institute here or a closed company (where you can 
feel free to impose them if you want), but rather a bunch people working 
together on a somewhat common goal.

As such it's _completely unacceptable_ to revert a whole lot of valuable work 
just because some of the guidelines were not enforced 100%. Completely 
unacceptable. Also unacceptable is a one-man-show revertion without a 
consensus, but that's something the core team has to discuss.

Nearbye, _if_ the core team can find a majority to make these kind of policies 
strict requirements, then the ones in favour of this solution should come up 
with git commit hooks, so that the commits violating the policy can not be 
commited in the first place.

In the meantime I'd be very happy if Holger would reapply his changes.
-- 
:M:


