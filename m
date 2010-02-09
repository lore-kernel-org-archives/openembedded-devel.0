Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NelTa-0002Bc-9M for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 09:29:45 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NelR9-0006cc-TW for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 09:27:11 +0100
Received: from APoitiers-259-1-58-223.w90-16.abo.wanadoo.fr ([90.16.145.223])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 09:27:11 +0100
Received: from bruno.chatignoux0016 by
	APoitiers-259-1-58-223.w90-16.abo.wanadoo.fr with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 09:27:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Bruno Chatignoux <bruno.chatignoux0016@orange.fr>
Date: Tue, 9 Feb 2010 08:26:50 +0000 (UTC)
Message-ID: <loom.20100209T091835-895@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 90.16.145.223 (Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.7) Gecko/20100106 Ubuntu/9.10 (karmic) Firefox/3.5.7)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: modphp_5.1.6
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
X-List-Received-Date: Tue, 09 Feb 2010 08:29:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello

I use Apache Server (apache2_2.2.14-r1.5_armv7a)

when i use package modphp_5.1.6-r3.1_armv7a.ipk from Angstrom site to display
phpinfo, i have the good display.

Now i compile modphp_5.1.6-r3.5_armv7a , i don't have error/warning. And if i
want to display phpinfo, 
i have a blankscreen,  and in the apache error log i have :

     [notice] child pid 2115 exit signal Segmentation fault (11)  

I don't find modphp_5.1.6.bb (r3.1).

It is somebody has already met this problem ?

Bruno




