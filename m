Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MCZXT-0002FV-HU
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 15:32:56 +0200
Received: (qmail 29654 invoked by uid 813007); 5 Jun 2009 13:23:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Jun 2009 13:23:45 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri,  5 Jun 2009 15:24:29 +0200
Message-Id: <1244208273-14048-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Subject: Next set of EP93xx patches
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
X-List-Received-Date: Fri, 05 Jun 2009 13:32:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Here I am with another set of patches to make EP93xx cpus working better
in OpenEmbedded.

This time I merged glibc 2.6.1 and binutils 2.18 patches done by Hasjim
Williams and changed a bit Ångström configs for building with Maverick
tuning enabled.

After rebuilding whole rootfs I got system which works and even gives
proper output from 'openssl speed md5' command.





