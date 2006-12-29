Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H05M4-0003Ek-TD
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Dec 2006 01:12:13 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H05LR-0005Su-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Dec 2006 11:11:34 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id 6D54D4AF20; Fri, 29 Dec 2006 11:11:30 +1100 (EST)
Date: Fri, 29 Dec 2006 11:11:29 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061229001129.GA5501@hezmatt.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.11
Subject: What's with the symlinks?
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
X-List-Received-Date: Fri, 29 Dec 2006 00:12:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Everywhere I go while assembling my OE build tree, I see admonishments not
to use a path that has symlinks in it.  For such a major problem, the only
real information on the actual problem is a fairly cryptic entry in the FAQ,
about a failure to build libtool-native.

Being an intensely curious kind of person, and not enjoying arbitrary
limits, I'm very interested to know what the *real* reason behind being so
strongly against the much-maligned symlink.  Can anyone enlighten me?

- Matt

-- 
English is about as pure as a cribhouse whore. We don't just borrow
words; on occasion, English has pursued other languages down alleyways
to beat them unconscious and rifle their pockets for new vocabulary."
	-- James D. Nicoll, resident of rec.arts.sf.written


