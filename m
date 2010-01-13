Received: from mxa.rambler.ru ([81.19.66.231])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NUxOx-00080i-B0
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 08:12:26 +0100
Received: from mcgi30.rambler.ru (mcgi30.rambler.ru [81.19.67.201])
	by mxa.rambler.ru (Postfix) with ESMTP id 2A736AA48E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 10:10:15 +0300 (MSK)
Received: from mcgi30.rambler.ru (localhost.rambler.ru [127.0.0.1])
	by mcgi30.rambler.ru (Postfix) with ESMTP id 77FFB1144B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 10:10:12 +0300 (MSK)
Received: from [77.52.208.230] by mcgi30.rambler.ru with HTTP (mailimap);
	Wed, 13 Jan 2010 10:10:09 +0300
From: Perepelica Alexander <alexondi@rambler.ru>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jan 2010 10:10:09 +0300
MIME-Version: 1.0
Message-Id: <490981633.1263366609.160668084.15032@mcgi30.rambler.ru>
X-Mailer: Ramail 3u, (untone), http://mail.rambler.ru
X-SA-Exim-Connect-IP: 81.19.66.231
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Correct way continue build after error
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
X-List-Received-Date: Wed, 13 Jan 2010 07:12:26 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; format="flowed"

Hello!
I look in docs but didn't find answer for subj. Problem is if build is 
failed then I change receipt or configs and then what must I do to 
continue?
If I must recompile last stage (with configuring and/or unpacking) are 
some ways to do that?


--
Thank you.
Perepelica Alexander


