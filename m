Received: from [87.194.255.144] (helo=honeysuckle.london.02.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1N6DKt-0001uI-BU
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 02:09:58 +0100
Received: from shodan.localnet (93.96.131.185) by honeysuckle.london.02.net
	(8.5.016.1)
	id 4A23EDE605A87B73 for openembedded-devel@lists.openembedded.org;
	Fri, 6 Nov 2009 01:07:35 +0000
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 6 Nov 2009 01:07:33 +0000
User-Agent: KMail/1.12.2 (Linux/2.6.31-14-generic; KDE/4.3.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200911060107.33807.bluelightning@bluelightning.org>
X-SA-Exim-Connect-IP: 87.194.255.144
X-SA-Exim-Mail-From: bluelightning@bluelightning.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: sqlite 3.6.20 requires tcl-native
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
X-List-Received-Date: Fri, 06 Nov 2009 01:09:59 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

It seems that the recently added SQLite 3.6.20 requires tcl-native, but the 
recipe doesn't depend on it. Should the recipe be fixed?

Cheers,
Paul


