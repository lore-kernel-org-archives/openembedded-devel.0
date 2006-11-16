Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GkquN-0002UP-Nj
	for openembedded-devel@openembedded.org; Fri, 17 Nov 2006 00:44:39 +0100
Received: (qmail 6110 invoked by uid 813007); 16 Nov 2006 23:42:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 16 Nov 2006 23:42:20 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2006 00:42:28 +0100
User-Agent: KMail/1.9.5
MIME-Version: 1.0
Message-Id: <200611170042.29062.openembedded@hrw.one.pl>
Subject: RFC: /removal.txt - list of metadata planned for removal
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
X-List-Received-Date: Thu, 16 Nov 2006 23:44:40 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


During this week I'm fetching sources for whole 'world' and noticed many 
unfetchable things. Because just dropping them from metadata is not best 
way I was thinking about creating file with informations which parts of 
metadata will be removed. File will be named 'removal.txt' and will 
reside in / of repository.

Proposed format:

Package Name:	plinciv
Removal Date:	2006-11-20
Maintainer:	none
Reason:		Unfetchable version from 2003 year.


What do you think about it?

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               Don't personalize computers. They hate that.




