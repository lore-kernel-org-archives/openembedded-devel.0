Received: from caiajhbdcaid.dreamhost.com ([208.97.132.83]
	helo=homiemail-a11.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NzqF5-0005um-Vp
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 13:49:53 +0200
Received: from sspaeth.de (unknown [195.190.188.219])
	by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPA id BE8AD194058
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 04:46:16 -0700 (PDT)
Received: by sspaeth.de (sSMTP sendmail emulation);
	Thu, 08 Apr 2010 13:46:13 +0200
From: "Sebastian Spaeth" <Sebastian@SSpaeth.de>
To: Openembedded Development List <openembedded-devel@lists.openembedded.org>
Date: Thu, 08 Apr 2010 13:46:13 +0200
Message-ID: <871veqkvzu.fsf@SSpaeth.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 208.97.132.83
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Removal of obsolete connman recipes
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
X-List-Received-Date: Thu, 08 Apr 2010 11:49:53 -0000
Content-Type: text/plain; charset=us-ascii

Dear all,

I am looking into upgrading connnman from 0.46 to current 0.51 and found
extremely old recipes ranging back to connman 0.8. If there are no
complaints, I will remove all <=0.1* recipes from the dev branch and the
patch files that become unused then.

Let me know if that is not ok with someone.

spaetz


