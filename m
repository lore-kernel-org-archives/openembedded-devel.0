Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <freyther@gmx.net>) id 1HHmvc-0001y5-BB
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Feb 2007 21:10:08 +0100
Received: (qmail invoked by alias); 15 Feb 2007 20:10:03 -0000
X-Provags-ID: V01U2FsdGVkX185QTYW9mQ5lX7v6D9go1ZtyrmBKs3oDO98sTeOgc
	nJKw==
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <D6451D38-A509-45C3-834F-228514CA32BA@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Thu, 15 Feb 2007 21:09:58 +0100
To: bitbake-dev <bitbake-dev@lists.berlios.de>
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Cc: openembedded-users@lists.openembedded.org,
	Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: BitBake 1.6.4 packaging issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2007 20:10:13 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit

Hey pals,

BitBake 1.6.4 has a packaging bug due a wrong MANIFEST. Thanks to  
Patrick Steiner for pointing me to this error.

Use BitBake 1.6.5 from svn or wait for BitBake 1.6.6 which will be  
released by tomorrow

h.


