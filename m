Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <openembedded@hrw.one.pl>) id 1GYpvH-0004ec-QS
	for openembedded-devel@openembedded.org; Sat, 14 Oct 2006 22:15:55 +0200
Received: (qmail 9052 invoked by uid 813007); 14 Oct 2006 20:09:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 14 Oct 2006 20:09:20 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Oct 2006 22:09:30 +0200
User-Agent: KMail/1.9.5
MIME-Version: 1.0
Message-Id: <200610142209.32403.openembedded@hrw.one.pl>
Subject: Review of revision cdf57334d92107e67da0a4fcde849921042f581a
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Oct 2006 20:15:56 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Can someone look at revision cdf57334d92107e67da0a4fcde849921042f581a to 
check my hack?

It change one syscall in libaio 0.3.106 so aiostress or reaim can be 
built. Without this patch I was getting undefined reference 
to '__io_getevents_0_4'.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

        Linux! -- Because a big world can not fit in small windows.




