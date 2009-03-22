Received: from [76.96.30.17] (helo=QMTA10.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1LlDK3-0006jt-N9
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 03:22:00 +0100
Received: from OMTA04.emeryville.ca.mail.comcast.net ([76.96.30.35])
	by QMTA10.emeryville.ca.mail.comcast.net with comcast
	id Vwh11b0030lTkoCAA2Lljo; Sun, 22 Mar 2009 02:20:45 +0000
Received: from [192.168.1.116] ([71.198.120.50])
	by OMTA04.emeryville.ca.mail.comcast.net with comcast
	id W2Lk1b00F15LFXK8Q2LkYP; Sun, 22 Mar 2009 02:20:45 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Mar 2009 19:20:43 -0700
Message-Id: <1237688443.23799.4.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: rootfs directory broken symlinks
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
X-List-Received-Date: Sun, 22 Mar 2009 02:22:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Is it normal after doing a build to find a bunch of broken sym links in
the build/tmp/rootfs directory?
	linuxrc
	broken links in bin and sbin

I did a console-image build on the at91-L9260 machine and the build
completed with no failures.

Thanks
Ed



