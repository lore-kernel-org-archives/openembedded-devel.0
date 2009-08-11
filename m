Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MatQj-0005le-4X
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 17:38:29 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C7800185F0D for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 17:22:09 +0200
Message-ID: <4A818C9F.7040604@atmel.com>
Date: Tue, 11 Aug 2009 17:22:07 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Checking out a branch?
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
X-List-Received-Date: Tue, 11 Aug 2009 15:38:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I am a bit confused right now with the branches.

I got the tree using
git clone git@git.openembedded.org:openembedded

I then want to create a local branch using
"git checkout -b local origin/remote"

"git branch -a" tells me there is

* org.openembedded.dev
  origin/HEAD
  ...
  origin/org.openembedded.angstrom-2007.12-stable
  origin/org.openembedded.dev
  origin/org.openembedded.documentation
  origin/org.openembedded.stable
  origin/origin/org.openembedded.dev
  ...

which one should I use?




-- 
Best Regards
Ulf Samuelsson



