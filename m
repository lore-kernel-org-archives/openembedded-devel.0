Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IJ3tQ-0004ND-Cg
	for openembedded-devel@openembedded.org; Thu, 09 Aug 2007 11:01:21 +0200
Received: (qmail 31413 invoked by uid 813007); 9 Aug 2007 08:58:38 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 9 Aug 2007 08:58:37 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Date: Thu, 9 Aug 2007 10:58:37 +0200
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200708091058.38815.openembedded@hrw.one.pl>
Subject: disapproval of revision '87f4964e99b725f1fc7dfcdb6feb62a3b3b0cd12'
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
X-List-Received-Date: Thu, 09 Aug 2007 09:01:25 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


OPIE_CVS_PV is defined ONLY in opie.bbclass which is NOT inherited in any 
opie recipe.

87f4964e99b725f1fc7dfcdb6feb62a3b3b0cd12 revision generated parse errors 
which means that no builds will be done as BitBake stops when they 
occure.

For future: please do build before push.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         You can close your eyes to reality, but not to memories.




