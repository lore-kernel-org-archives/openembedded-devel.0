Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MSScT-0004oc-T4
	for openembedded-devel@openembedded.org; Sun, 19 Jul 2009 11:23:45 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MSSP7-0005Bp-3f
	for openembedded-devel@openembedded.org; Sun, 19 Jul 2009 09:09:57 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 19 Jul 2009 09:09:57 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jul 2009 09:09:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 19 Jul 2009 11:09:45 +0200
Message-ID: <h3unsp$1cs$1@ger.gmane.org>
References: <4A62DF07.8000804@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <4A62DF07.8000804@dresearch.de>
Sender: news <news@ger.gmane.org>
Subject: Re: do_qa_configure apr-util_1.3.4 fails
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
X-List-Received-Date: Sun, 19 Jul 2009 09:23:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-07-09 10:53, Steffen Sledz wrote:
> In the current dev branch:
>
> NOTE: Running task 1694 of 3083 (ID: 1540, /opt/openembedded/recipes/apr/apr-util_1.3.4.bb, do_qa_configure)
> ERROR: This autoconf log indicates errors, it looked at host includes.
> Rerun configure task after fixing this. The path was '/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/work/armv5te-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4'
> ERROR: Error in executing: /opt/openembedded/recipes/apr/apr-util_1.3.4.bb
> ERROR: Exception:<type 'exceptions.SystemExit'>  Message:1
> ERROR: Printing the environment of the function
> ERROR: Build of /opt/openembedded/recipes/apr/apr-util_1.3.4.bb do_qa_configure failed
> ERROR: Task 1540 (/opt/openembedded/recipes/apr/apr-util_1.3.4.bb, do_qa_configure) failed
>
> I'd a look into the configure log (see attached file) but couldn't find the autoconf problem which causes this error. :(

The error would be shown in ${S}/config.log

regards,

Koen



