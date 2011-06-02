Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QS755-0002c4-8w
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 14:32:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id C09E61417191;
	Thu,  2 Jun 2011 14:32:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BhBmdhkzAk8C; Thu,  2 Jun 2011 14:32:56 +0200 (CEST)
Received: from [10.20.5.32] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 518671416BA8;
	Thu,  2 Jun 2011 14:32:55 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1306939924.23523.20.camel@oct.suse.cz>
References: <1306930030.4315.63.camel@mattotaupa>
	<1306939924.23523.20.camel@oct.suse.cz>
Date: Thu, 02 Jun 2011 14:29:44 +0200
Message-ID: <1307017784.23523.29.camel@oct.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] lynx: fix checksums
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
X-List-Received-Date: Thu, 02 Jun 2011 12:32:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrote:

> I had this recipe in my experimental repo for some time and it seems
> that they silently changed (downgraded?) the main tarball in time
> between. I can confirm your checksum with the fresh download.
> 
> It looks pretty strange. The new tarball misses one security update.
> Maybe they did a mistake.

Here is the answer:
http://lists.nongnu.org/archive/html/lynx-dev/2011-06/msg00003.html

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



