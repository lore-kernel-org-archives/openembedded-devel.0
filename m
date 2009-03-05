Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LfD4u-0006UD-2n
	for openembedded-devel@openembedded.org; Thu, 05 Mar 2009 13:53:32 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LfD0i-00020v-D4
	for openembedded-devel@openembedded.org; Thu, 05 Mar 2009 12:49:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 05 Mar 2009 12:49:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 05 Mar 2009 12:49:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 05 Mar 2009 13:49:00 +0100
Message-ID: <goohnu$kel$1@ger.gmane.org>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>	<1236182004-4523-70-git-send-email-openembedded@haerwu.biz>	<49AF4FBD.1010209@dls.net>	<20090305044711.GE26343@smtp.west.cox.net>
	<49AFC6A3.9070406@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <49AFC6A3.9070406@dls.net>
Sender: news <news@ger.gmane.org>
Subject: Re: I got the point - did everyone one else? [was: Re: [PATCH 70/70]...]
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
X-List-Received-Date: Thu, 05 Mar 2009 12:53:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05-03-09 13:33, Mike (mwester) wrote:

> 70 patches?  Come on, who's going to extract and apply 70 patches from
> email?  Not likely!

You're missing the point completely. Patches go to the mailinglist for 
review. You can choose to apply and test them if you wish. If you want 
to test the 69 patches, you pull the branch marcin provided.
This is done so that patches get many eyes on them without people needed 
to use git, and people wanting to test can do one of the following:

* pull the branch

or

* use patchwork to create a bundle

or

* apply patches by hand

regards,

Koen



