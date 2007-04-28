Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HhkJ6-0006xb-K6
	for openembedded-devel@openembedded.org; Sat, 28 Apr 2007 12:37:36 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HhkAH-0000FY-99
	for openembedded-devel@openembedded.org; Sat, 28 Apr 2007 12:28:29 +0200
Received: from f7301.f.ppp-pool.de ([195.4.115.1])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 28 Apr 2007 12:28:29 +0200
Received: from no2spam by f7301.f.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 28 Apr 2007 12:28:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 28 Apr 2007 12:28:20 +0200
Message-ID: <f0v7k5$k9c$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: f7301.f.ppp-pool.de
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
Sender: news <news@sea.gmane.org>
Subject: Re: perl 5.8.8 is ready
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Apr 2007 10:37:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jamie Lenehan wrote:
 > I'd like to get some reports from other people that it works for them 
before removing the
 > DEFAULT_PREFERENCE = "-1".

Thank you Jamie for working on this beast.

Here is my feedback (compile only) for collie/.dev/angstrom on a Via C3 
and Intel (Thinkpad X24).  As you can see there are some QA issues but 
the compilation completes fine.

NOTE: QA checking staging
ERROR: QA issue: libltdl.la failed sanity test (reference to workdir or 
installed)
ERROR: QA issue: libgettextsrc.la failed sanity test (reference to 
workdir or installed)
ERROR: QA issue: libgettextpo.la failed sanity test (reference to 
workdir or installed)
ERROR: QA issue: libglib.la failed sanity test (reference to workdir or 
installed)
ERROR: QA issue: libgmodule.la failed sanity test (reference to workdir 
or installed)
ERROR: QA issue: libgthread.la failed sanity test (reference to workdir 
or installed)
ERROR: QA issue: libglib-2.0.la failed sanity test (reference to workdir 
or installed)
ERROR: QA issue: libgmodule-2.0.la failed sanity test (reference to 
workdir or installed)
ERROR: QA issue: libgthread-2.0.la failed sanity test (reference to 
workdir or installed)
ERROR: QA issue: libgobject-2.0.la failed sanity test (reference to 
workdir or installed)
ERROR: QA issue: libfreetype.la failed sanity test (reference to workdir 
or installed)
ERROR: QA issue: libdbus-1.la failed sanity test (reference to workdir 
or installed)
ERROR: QA issue: libgdbm.la failed sanity test (reference to workdir or 
installed)
ERROR: QA issue: libdb-4.3.la failed sanity test (reference to workdir 
or installed)
ERROR: QA issue: libz.la failed sanity test (reference to workdir or 
installed)
ERROR: QA issue: libSDL.la failed sanity test (reference to workdir or 
installed)
ERROR: QA issue: libfakeroot.la failed sanity test (reference to workdir 
or installed)
NOTE: package perl-native-5.8.8-r0: task do_qa_staging: completed
NOTE: package perl-native-5.8.8-r0: task do_build: started
NOTE: package perl-native-5.8.8-r0: task do_build: completed
NOTE: package perl-native-5.8.8: completed
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be 
rerun and 0 failed.
NOTE: build 200704272216: completed

and for perl itself

NOTE: package perl-5.8.8-r7: task do_build: completed
NOTE: package perl-5.8.8: completed
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be 
rerun and 0 failed.
NOTE: build 200704272305: completed




