Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QPbkQ-0003dC-JS
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 May 2011 16:41:19 +0200
Received: (qmail 12114 invoked by uid 1003); 26 May 2011 14:38:04 -0000
Received: from unknown (HELO ?192.168.0.15?)
	(philip@opensdr.com@75.136.226.183)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	26 May 2011 14:38:03 -0000
Message-ID: <4DDE65C5.7050605@balister.org>
Date: Thu, 26 May 2011 10:37:57 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [2011.03-maintenance] Pull request
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
X-List-Received-Date: Thu, 26 May 2011 14:41:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Tom,

Can you pull the following fixes from:

git://github.com/balister/openembedded.git
branch: balister/2011.3-maintenance/pull-1

Patrik Dahlström (1):
       firefox: add correct CFLAGS and LIBS of libIDL-2.0

Philip Balister (3):
       libosip2 : Upgrade from version 3.1 to 3.5
       ortp : Upgrade from version 0.13.1 to 0.16.5.
       uhd : Upgrade from 003.000.001 to 003.001.000.

Roderick Taylor (1):
       system-tools-backends: don't use build machine's automake-1.7


These are all cherry-picks from .dev.

Thanks,

Philip


