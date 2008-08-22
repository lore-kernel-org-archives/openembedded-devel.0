Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KWYxL-0003BB-4n
	for openembedded-devel@openembedded.org; Fri, 22 Aug 2008 17:53:43 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KWYw5-0003eL-Vj
	for openembedded-devel@openembedded.org; Fri, 22 Aug 2008 15:52:25 +0000
Received: from wlan141148.mobiel.utwente.nl ([130.89.141.148])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 22 Aug 2008 15:52:25 +0000
Received: from k.kooi by wlan141148.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 22 Aug 2008 15:52:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 22 Aug 2008 17:52:18 +0200
Message-ID: <g8mnbi$a5i$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan141148.mobiel.utwente.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
Sender: news <news@ger.gmane.org>
Subject: Moving working stuff to nonworking, exactly why?
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
X-List-Received-Date: Fri, 22 Aug 2008 15:53:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

NOTE: package libexif-0.6.16: completed
NOTE: Tasks Summary: Attempted 547 tasks of which 541 didn't need to be 
rerun and 0 failed.

koen@bitbake:/OE/angstrom-dev/deploy/glibc$ find ipk/ -name "libexif*"
ipk/armv7a/libexif-locale-pl_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif-locale-sk_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif-dbg_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif12_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif-doc_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif-dev_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif-locale-cs_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif-locale-de_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif-locale-es_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif-locale-fr_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif-locale-ru_0.6.16-r0_armv7a.ipk
ipk/armv7a/libexif-locale-vi_0.6.16-r0_armv7a.ipk

koen@bitbake:~/OE/monotone/org.openembedded.dev/packages/libexif$ mtn diff .
#
# no changes
#

So, why?



