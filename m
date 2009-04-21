Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwKpA-0004aW-8c
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 20:36:04 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LwKkr-0004Eg-Jc
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 18:31:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 18:31:37 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 18:31:37 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 20:31:20 +0200
Message-ID: <gsl3do$sov$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
Sender: news <news@ger.gmane.org>
Subject: Cleaning out patchwork queue
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
X-List-Received-Date: Tue, 21 Apr 2009 18:36:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

http://patchwork.openembedded.org/project/openembedded/list/ currently 
lists a lot of patches that have been applied/rejected/approved etc.

Could people look through it and update the patch status for each patch? 
I'm going to archive all patches that have the 'new' state and are older 
than one week next week.

If you don't have access to patchwork, poke Philip (crofton) on IRC to 
update your patchwork account.

If you have outstanding patches and no commit access (hi Roman!) ping 
them again on this list and pester people in IRC to apply them.

Applying a patchwork patch is easy:

cd /OE/openembedded ; contrib/pw-am.sh 359 351 ; git push

that will apply and push http://patchwork.openembedded.org/patch/359/ 
and http://patchwork.openembedded.org/patch/351/

If you ack or nack a patch on this mailinglist please update the 
patchwork status as well.

After next week patchwork should give a true reflection of the status of 
all outstanding patches. The maintainers of the stable branch are doing 
a good job with patchwork currently, so please do so as well.

regards,

Koen



