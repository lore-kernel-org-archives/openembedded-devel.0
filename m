Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OCMOz-0000YF-4U
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 02:35:50 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OCMLD-00087f-9J for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 20:31:55 -0400
Date: Wed, 12 May 2010 20:31:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.00.1005122030010.2471@lynx>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: current error: fetching enlightenment
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
X-List-Received-Date: Thu, 13 May 2010 00:35:50 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  just did a "git pull" followed by a bitbake fetchall and ...

...
NOTE: Update
svn://svn.enlightenment.org/svn/e/trunk;module=e;proto=http
svn: Failed to add directory 'src': an unversioned directory of the
same name already exists
NOTE: Task failed: Fetch failed: Fetch command export
HOME=/home/rpjday; export SSH_AUTH_SOCK=/tmp/keyring-Ll3M8v/ssh;
export
PATH=/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/sbin:/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/bin:/home/rpjday/oe/angstrom-dev/cross/armv7a//bin:/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/sbin:/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games;
/usr/bin/env svn update -r 48775 failed with signal 1, output:
svn: Failed to add directory 'src': an unversioned directory of the
same name already exists

ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/rpjday/oe/openembedded/recipes/e17/e-wm_svn.bb
do_fetch failed
ERROR: Task 439 (/home/rpjday/oe/openembedded/recipes/e17/e-wm_svn.bb,
do_fetch) failed
NOTE: Tasks Summary: Attempted 1331 tasks of which 1331 didn't need to
be rerun and 1 failed.
ERROR: '/home/rpjday/oe/openembedded/recipes/e17/e-wm_svn.bb' failed

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


