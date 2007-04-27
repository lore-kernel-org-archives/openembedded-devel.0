Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HhQwS-0006mk-G6
	for openembedded-devel@openembedded.org; Fri, 27 Apr 2007 15:56:56 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HhQni-0008Pq-5h
	for openembedded-devel@openembedded.org; Fri, 27 Apr 2007 15:47:54 +0200
Received: from f73bb.f.ppp-pool.de ([195.4.115.187])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 27 Apr 2007 15:47:54 +0200
Received: from no2spam by f73bb.f.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 27 Apr 2007 15:47:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 27 Apr 2007 15:47:43 +0200
Message-ID: <f0suu0$ij2$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: f73bb.f.ppp-pool.de
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
Sender: news <news@sea.gmane.org>
Subject: md5sum check fails for ffmpeg - how do we deal with situations like this?
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
X-List-Received-Date: Fri, 27 Apr 2007 13:56:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I tried to build ffmpeg and got the following:

NOTE: The MD5Sums did not match. Wanted: 
'700b66230a8322493c032c04372b8d74' and Got: 
'ea5587e3c66d50b1503b82ac4179c303'
NOTE: Task failed: Checksum of 
'http://downloads.sourceforge.net/ffmpeg/ffmpeg-0.4.9-pre1.tar.gz' failed

Is the entry in conf/checksums.ini wrong or has the file changed?  
Either way, how do we resolve situations like this in general?

Regards

Rolf



