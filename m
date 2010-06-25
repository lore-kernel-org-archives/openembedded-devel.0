Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OS32E-00025y-5l
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 09:09:11 +0200
Received: (qmail invoked by alias); 25 Jun 2010 07:04:31 -0000
Received: from p50885A04.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.90.4]
	by mail.gmx.net (mp026) with SMTP; 25 Jun 2010 09:04:31 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+iC4UZKoSiK9MMcBY4NLU2TNLQItWqCoU4oauSc5
	XzGKQM7wMoyJEi
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 09:01:37 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201006250901.38077.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: MeeGo support in OE
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
X-List-Received-Date: Fri, 25 Jun 2010 07:09:11 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

My investigations for a 'colorful' embedded environment lead me to Meego (http://meego.com/).

On the webpage we learn that this is a platform independent environment but there are only few platforms supported (Nokia N900 / Beaglebord / few Intel netbooks).

To have full platform-independency I would like to have Meego (maybe parts of it only) within OE and started already with easiest part uxlaunch (very tiny dm - see 
git://gitorious.org/meego-os-base/uxlaunch.git). This is already tested with xfce environment but before posting a patch here I would like to do some further tests with gnome/enlightenment and 
see what happens in case another dm is found in the image. 

Next step planned is mutter. Here I would like to use the original gnome sources and check the diffs to meego branch.

Now my questions:

- Are there any objections including meego parts (licensing / don't like Intel/Nokia..) in OE
- Are there already proceedings related to mutter ongoing? Or is there a reason that mutter is not in OE other than nobody has done so far?

Andreas


