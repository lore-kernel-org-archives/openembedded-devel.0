Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HhOGv-00012G-E7
	for openembedded-devel@openembedded.org; Fri, 27 Apr 2007 13:05:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HhO8C-0006DN-3c
	for openembedded-devel@openembedded.org; Fri, 27 Apr 2007 12:56:52 +0200
Received: from f73bb.f.ppp-pool.de ([195.4.115.187])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 27 Apr 2007 12:56:52 +0200
Received: from no2spam by f73bb.f.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 27 Apr 2007 12:56:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Followup-To: gmane.comp.handhelds.openembedded
Date: Fri, 27 Apr 2007 12:56:29 +0200
Message-ID: <4631D6DD.2060000@nospam.arcornews.de>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: f73bb.f.ppp-pool.de
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
Sender: news <news@sea.gmane.org>
Cc: openzaurus-users@lists.sourceforge.net,
	openzaurus-devel@lists.sourceforge.net
Subject: FYI: OZ bugs after angstrom transition
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
X-List-Received-Date: Fri, 27 Apr 2007 11:05:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

today I sent the following comment to all bugs in the OE bug tracker 
with version OpenZaurus*

== start comment ==
OpenZaurus is being phased out and replaced by angstrom which supports 
all Z models, except SL-A300 as usual.  Furthermore, angstrom extends 
support to quite a few non-Zaurus devices.  See 
http://www.angstrom-distribution.org for more information.

Therefore we ask all reporters of openzaurus bugs to verify if their bug 
is fixed in angstrom and if not replace the version field in the bug 
tracker with angstrom.  Images are available at 
http://www.angstrom-distribution.org/unstable/images/  Be sure to read 
the installation instructions 
http://www.angstrom-distribution.org/taxonomy/term/2 If there is 
anything unclear, be sure to either ask here or in #angstrom in IRC

You should be aware that of course by flashing your device all 
information not backed up to external media will be irrevocably lost.
== end comment ==

This is to give the reporters an opportunity to test whether angstrom 
fixed the bug (likely in the case of those nasty, old, impossible to fix 
2.4 kernel issues) or migrate the bug.  All bugs without reaction are 
going to be marked as WONTFIX in about two weeks.

Regards

Rolf


PS: This mail is sent to four groups.  F'up and Reply-To are set to 
oe-devel.



