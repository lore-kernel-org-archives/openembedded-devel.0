Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MP6Bw-0001It-Ei
	for openembedded-devel@openembedded.org; Fri, 10 Jul 2009 04:50:28 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MP5zV-0007J1-0Z
	for openembedded-devel@openembedded.org; Fri, 10 Jul 2009 02:37:37 +0000
Received: from ip-122-152-136-23.asianetcom.net
	([ip-122-152-136-23.asianetcom.net])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 10 Jul 2009 02:37:37 +0000
Received: from kwanlc by ip-122-152-136-23.asianetcom.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 10 Jul 2009 02:37:37 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Kwan <kwanlc@singnet.com.sg>
Date: Fri, 10 Jul 2009 02:37:25 +0000 (UTC)
Message-ID: <loom.20090710T022617-446@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 122.152.136.23 (Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0))
Sender: news <news@ger.gmane.org>
Subject: Setting screen size
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
X-List-Received-Date: Fri, 10 Jul 2009 02:50:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all,

My device has a screen size of 800x480, but when I try to run the OE gpe-image 
I compiled, the screen size stays at 640x480 no matter how I set it. I changed 
the /etc/X11/XServer file to supply an argument of "-screen 800x480" to Xfbdev 
but seems like it does not take effect. Is there other configuration file 
somewhere that I could set?

Regards,
Kwan.




