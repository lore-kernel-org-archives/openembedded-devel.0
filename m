Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1N8X1H-0001XJ-39
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 11:35:18 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 110CA1100226
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 11:33:58 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 130331100223
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 11:33:57 +0100 (CET)
Received: from rhein.familie-heinold.de (unknown [78.52.239.229])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 11:33:57 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 73DFD3C109; Thu, 12 Nov 2009 11:33:56 +0100 (CET)
Date: Thu, 12 Nov 2009 11:33:56 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091112103356.GA30768@rhein.zuhause.netz>
References: <4AFBC85D.2000204@cs.put.poznan.pl>
MIME-Version: 1.0
In-Reply-To: <4AFBC85D.2000204@cs.put.poznan.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patches procedure
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
X-List-Received-Date: Thu, 12 Nov 2009 10:35:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2009 at 09:33:33AM +0100, Przemyslaw Wesolek wrote:
> Hi,
> 
> On 5 November I posted two patches considering boost. None of them has
> been applied to git.
> 
> As I'm a novice here, am I breaking some social contract or missing some
> procedural steps to get patches applied? Shall I ask for Ack's and
> commits directly, or simply sending patches is enough?
> 
> I don't want to sound rude, I just don't understand the "machinery" and
> wiki doesn't explain anything beyond my current knowledge.
> 
> Przemek

The problem is time and man power. And as I said earlier I only have the time to fix the
packages with the latest version. The best solution I can think of is, that you apply
for write access. So you have to write an email to the dev list with pointers
to your patches and ask for write access. If 3 devs or 2 from core(steering comitee now?) 
give there ack you have to send your ssh-key to the admins.

Bye Henning


