Received: from maild.rambler.ru ([81.19.66.33])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NYnuM-0003zu-Pd
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 22:52:45 +0100
Received: from [127.0.0.1] (unknown [109.86.169.209])
	(Authenticated sender: alexondi@rambler.ru)
	by maild.rambler.ru (Postfix) with ESMTP id 8091584415
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 00:50:25 +0300 (MSK)
Message-ID: <4B5B6F19.1030208@rambler.ru>
Date: Sat, 23 Jan 2010 23:50:17 +0200
From: Perpelica Alexander <alexondi@rambler.ru>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; ru;
	rv:1.9.1.5) Gecko/20091204 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 81.19.66.33
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Variable override warning
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
X-List-Received-Date: Sat, 23 Jan 2010 21:52:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!
Can  I get some warnings about replacing variables which I set in 
local.conf.
Maybe bitbake must have such mode when he can write to console some info 
about what he did:
1. Variable is unset so I set to this value  (?=) in file ...
2. Variable is defined but I replace with new value (=) in file ...
3. Variable was changed with prefix(postfix) in file ...

For new users (for my :) ) is unclear where and who change and what change.





