Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OML0V-0004yH-Ml
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 15:07:56 +0200
Received: from [123.192.240.117] (123-192-240-117.dynamic.kbronet.com.tw
	[123.192.240.117])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 80CF51B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 13:03:26 +0000 (UTC)
Message-ID: <4C0F9119.3000909@freyther.de>
Date: Wed, 09 Jun 2010 21:03:21 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-3.fc13 Lightning/1.0b1
	Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: TSC Meetings for the meeting of June
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
X-List-Received-Date: Wed, 09 Jun 2010 13:07:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

we didn't really have much to talk....



== Renaming the org.openmebdded.dev branch ==

We were carrying the org.openembedd.dev branch name from the monotone
era into the git era and the TSC was asked to consider renaming it to
'master' which is the git default for the main development tree. Now the
actual change on the server will be minor what is of a bigger concern
are the existing users and documentation.

The TSC would like to make the following proposal:

  a.) Contributor's will be asked to push to master, a git-hook
      will prevent pushes to the old branch name.
  b.) The default branch will be changed to 'master' and the
      documentation will be updated.
  c.) To ease this for existing users and to reduce the amount of
      support org.openembedded.dev will track master and remains
      available for a limited but long amount of time.


The TSC is not sure on how to implement c.) and this will determine when
we will be able to switch over and the schedule of doing so.



