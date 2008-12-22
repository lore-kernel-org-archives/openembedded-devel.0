Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LEs7b-0000Qr-Tt
	for openembedded-devel@openembedded.org; Mon, 22 Dec 2008 22:15:30 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081222211030.BWBE8485.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Dec 2008 16:10:30 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id uMAW1a00C1E665w04MAWkm; Mon, 22 Dec 2008 16:10:30 -0500
X-Authority-Analysis: v=1.0 c=1 a=Qh3QxNwTHsoA:10 a=b2ZvGRdsAAAA:8
	a=Hpb60wQp9c0GSOyrZq0A:9 a=MBfhVvIUzjN5zca7ya1oNDgYNWkA:4
	a=b8hG5vVbyAkA:10
X-CM-Score: 0.00
Date: Mon, 22 Dec 2008 14:10:49 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20081222211049.GB4287@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Please review trini/canadian-sdk branch
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
X-List-Received-Date: Mon, 22 Dec 2008 21:15:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all.  Can people please review the trini/canadian-sdk branch, in
terms of content?  If things are good at this point content-wise, I'll
split the commits up roughly along the lines of the original patches in
http://bugs.openembedded.net/show_bug.cgi?id=4664 but with checksums
added in each new commit.

Note that this isn't 100% just yet.  I'd like to, after getting the core
stuff merged in, add in at least gcc-4.2.4 and think about if there's a
good way to re-use the portions of meta-toolchain.bb that canadian-sdk.bb
lifts.

-- 
Tom Rini


