Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L8AyX-0000iL-Fe
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 10:58:26 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L8Av5-0005dO-TD
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 09:54:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 09:54:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 09:54:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Dec 2008 10:54:41 +0100
Message-ID: <gh89d2$qn8$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081125 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: Xorg and input devices summary
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
X-List-Received-Date: Thu, 04 Dec 2008 09:58:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

A while ago Graeme and I were looking at xf86-input-tslib and it's HAL 
magic to register itself to Xorg, which made me wonder how Xorg handles 
input devices nowadays. Peter Hutterer (of MPX fame) made a nice write 
up on how a current Xorg handles input devices and HAL:

http://who-t.blogspot.com/2008/12/evdev-xorgconf-hal-and-other-fud.html

And this should make a lot of people working on phones and PDAs happy:

http://lists.freedesktop.org/archives/xorg/2008-December/041115.html

regards,

Koen



