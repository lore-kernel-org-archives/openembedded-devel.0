Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kq52w-0007sE-KG
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 14:00:10 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Kq4xy-0004uE-Ao
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 11:55:02 +0000
Received: from www.cellphysics.kth.se ([130.237.35.231])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 11:55:02 +0000
Received: from erland by www.cellphysics.kth.se with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 11:55:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Erland Lewin <erland@lewin.nu>
Date: Wed, 15 Oct 2008 11:52:37 +0000 (UTC)
Message-ID: <loom.20081015T114959-488@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 130.237.35.231 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.0.3) Gecko/2008092510 Ubuntu/8.04 (hardy) Firefox/3.0.3)
Sender: news <news@ger.gmane.org>
Subject: GIT server down?
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
X-List-Received-Date: Wed, 15 Oct 2008 12:00:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I'm having trouble using the git.openembedded.org server:

erl@sol:~/src/oe$ git clone git://git.openembedded.net/org.openembedded.dev
Initialized empty Git repository in /home/erl/src/oe/org.openembedded.dev/.git/
fatal: The remote end hung up unexpectedly

I can access the web interface fine (http://git.openembedded.net/).

Is the git server down? Any ETA as to when it will be up?

I'm trying to build the FSO distribution for the OpenMoko Freerunner.

Thanks,

Erland




