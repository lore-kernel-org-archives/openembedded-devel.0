Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1JJOge-0004Rm-Uu
	for openembedded-devel@openembedded.org; Mon, 28 Jan 2008 08:45:49 +0100
Received: (qmail 29020 invoked by uid 813007); 28 Jan 2008 07:45:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 28 Jan 2008 07:45:54 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@openembedded.org
Date: Mon, 28 Jan 2008 08:45:39 +0100
User-Agent: KMail/1.9.7
X-PRIORITY: 2 (High)
Priority: urgent
MIME-Version: 1.0
Message-Id: <200801280845.40636.openembedded@haerwu.biz>
Subject: Official list of OE monotone servers?
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
X-List-Received-Date: Mon, 28 Jan 2008 07:45:49 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


During problems with DNS (which I really hope were last time) Mickeyl(?) 
made use of openembedded.net domain. This gave nasty problem for me. 

I was pulling from monotone.openembedded.net and pushing to it. The 
problem is that this machine was *not* synchronizing changes back to 
other servers.

We need a list of *OFFICIAL* monotone servers which synchronize each 
other. And as a list I think of:

1. Server IP 
2. Server Name 
3. Server maintainer (name + email) 
4. Server fingerprint (used by monotone)

If someone know how to force monotone to not allow to pull/push against 
not listed servers please share that knowledge too.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                  Take my advice, I don't use it anyway.




