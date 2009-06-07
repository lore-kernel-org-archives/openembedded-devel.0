Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MDJKI-00075k-BZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 16:26:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 9A05D1422AA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2009 16:17:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZsv9UmiXzo0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2009 16:17:37 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 5D33614171A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2009 16:17:37 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244366174.4412.11.camel@daniel-laptop>
References: <1244366174.4412.11.camel@daniel-laptop>
Date: Sun, 07 Jun 2009 16:16:59 +0200
Message-Id: <1244384219.4431.46.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: e2fsprogs-libs failed on latest org.openembedded.dev	branch
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
X-List-Received-Date: Sun, 07 Jun 2009 14:26:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Daniel.Li wrote:
> Hi List,
> 
> What's wrong with this? How can I fix the problem?
> 
> $ bitbake e2fsprogs-libs
> ERROR: 	0048:		basedir = os.path.join(os.path.dirname(root))

I was hoping that it was fixed by this commit:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3ac37564039127c80eb5cf109fddf23a8e438bf8

Can you confirm, that you have a newer snapshot?


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



