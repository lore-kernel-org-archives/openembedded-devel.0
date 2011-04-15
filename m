Received: from moutng.kundenserver.de ([212.227.17.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1QAqzO-0007tj-43
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 23:55:46 +0200
Received: from [192.168.1.34] (p57B40E19.dip0.t-ipconnect.de [87.180.14.25])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0MQA1H-1QG3kN0MJX-005LLq; Fri, 15 Apr 2011 23:53:24 +0200
Message-ID: <4DA8BE4F.5050008@koblersystems.de>
Date: Fri, 15 Apr 2011 23:53:19 +0200
From: Jan Kobler <eng1@koblersystems.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20110120 Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: V02:K0:u7+h27FWHypgN/P2oewePTDATDM3LYjmCraP7VybwEk
	JG1Ooyhmol/SJ1RD1/fKOqvKfQgydzI41ZRcaX2EjcjoMiR+8V
	fyDQfGHvWz9CBQnzygWDQmbZOCnx6F5166PixqIUrWmsAyTHmH
	ohsuWRdypEi9clPnSSQHwihMmQSkllttzbX8CR+VKaqhc1maeD
	KfaaSE5WnIqXqkRp+XzVQ==
Subject: efreet: changeset_trunk_r57435.patch in DOS Format, wrong line number
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
X-List-Received-Date: Fri, 15 Apr 2011 21:55:47 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

the file recipes/efl1/efreet/changeset_trunk_r57435.patch
is in DOS format, i.e. the line endings are CR-NL.

The patch changeset_trunk_r57435.patch failed on my Linux system.
After changing the line endings to NL, i.e. Unix file format, it worked.

The line number 1206 in the patch file is the line number 1368 in the
file efreet/src/lib/efreet_desktop.c.

I think the line number in the patch is wrong.

I am not sending a patch of the patch file, because I am not sure if the
different line endings are preserved.

Best regards

Jan



