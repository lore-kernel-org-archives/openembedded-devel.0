Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kjgbd-0004gm-Na
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Sep 2008 22:41:34 +0200
Received: from [92.117.146.220] (helo=[10.161.146.220])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KjgXt-0001Fz-8V
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Sep 2008 22:37:42 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Sep 2008 22:37:19 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200809272237.22810.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.146.220
Subject: git conversion and what is missing?
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
X-List-Received-Date: Sat, 27 Sep 2008 20:41:34 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

I wonder what is missing until we finally switch to git? From my point of view 
it is:

	- Finishing this table [1]
	- Maybe fixing the script to get this one rev importer properly
	- Run the conversation...

comments?
	z.

PS: In the OM tree I changed base.bbclass to handle git repo's (almost) 
properly for the welcome message.

[1] http://wiki.openembedded.net/index.php/Talk:Monotone_to_Git_ID_mapping


