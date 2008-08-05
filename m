Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KQP93-0004Pu-IS
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Aug 2008 18:12:21 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KQP91-0003UT-9S
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Aug 2008 17:12:19 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1KQP91-0003o7-3t
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Aug 2008 17:12:19 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 05 Aug 2008 17:12:18 +0100
Message-Id: <1217952738.24777.175.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: enabling objc in gcc
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
X-List-Received-Date: Tue, 05 Aug 2008 16:12:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

At the moment, Objective-C seems to be disabled in
gcc-configure-common.inc.  Is there any particular reason for this, or
alternatively are there any objections to enabling it?

p.




