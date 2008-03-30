Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JfxUA-0006Pz-UK
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Mar 2008 15:22:11 +0200
Received: by an-out-0708.google.com with SMTP id b33so329097ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2008 06:22:02 -0700 (PDT)
Received: by 10.100.140.1 with SMTP id n1mr12733539and.70.1206883321991;
	Sun, 30 Mar 2008 06:22:01 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sun, 30 Mar 2008 06:22:01 -0700 (PDT)
Message-ID: <c384c5ea0803300622p72792646uc0f84190c878454b@mail.gmail.com>
Date: Sun, 30 Mar 2008 14:22:01 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Distro maintainers: consider switching from util-linux to util-linux-ng
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
X-List-Received-Date: Sun, 30 Mar 2008 13:22:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

consider switching to util-linux-ng, util-linux-ng is the maintained fork of
util-linux, whereas the latter is now dead AFAIK.

http://userweb.kernel.org/~kzak/util-linux-ng/

I have committed it a while ago, and tested it to work ok for me. Needs more
testers, so I propose to switch over.

The Changelist:

http://git.kernel.org/?p=utils/util-linux-ng/util-linux-ng.git;a=blob;f=docs/v2.14-ReleaseNotes;h=c8ca19de79947d21dfbb16b1db4393881a93e47f;hb=915b80830b61264d4b3d3e52797054078595a003

whichs shows me that 2.14 has arrived. Volunteers?

Regards,
-- 
Leon

