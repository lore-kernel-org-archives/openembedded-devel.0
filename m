Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MdzCX-0002b1-Pf
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 06:24:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id E96FC52D9CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 00:07:22 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03043-01 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 20 Aug 2009 00:07:22 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id C3D6A4FA003
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 00:07:22 -0400 (EDT)
Date: Thu, 20 Aug 2009 00:07:22 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
Message-ID: <Pine.LNX.4.64.0908200004070.3621@juice.ott.cti.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Patchwork XML-RPC interface
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
X-List-Received-Date: Thu, 20 Aug 2009 04:24:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi,

Is there any chance of getting the XML-RPC interface enabled in Patchwork?

It'd take "ENABLE_XMLRPC = True" in local_settings.py.

I'm thinking it might be possible to troll the last month or so of 
commits, generate patchwork hashes for each, and then use the XML-RPC 
interface to search by hash and mark anything matching as Applied if it's 
not already.

Mike


