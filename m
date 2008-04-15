Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jlghx-0004GG-Um
	for openembedded-devel@openembedded.org; Tue, 15 Apr 2008 10:40:09 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Jlghu-0007dT-Kq
	for openembedded-devel@openembedded.org; Tue, 15 Apr 2008 08:40:02 +0000
Received: from 62-237-10-64.dial.tdcsong.fi ([62.237.10.64])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 15 Apr 2008 08:40:02 +0000
Received: from szaka by 62-237-10-64.dial.tdcsong.fi with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 15 Apr 2008 08:40:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Szabolcs Szakacsits <szaka@ntfs-3g.org>
Date: Tue, 15 Apr 2008 08:36:42 +0000 (UTC)
Message-ID: <loom.20080415T082706-746@post.gmane.org>
References: <E1JlNXj-0008DF-Mt@daffy.sipo.nl> <48038AFE.2030904@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 62.237.10.64 (Mozilla/4.0 (compatible; MSIE 5.5; Windows 98;
	YComp 5.0.2.6))
Sender: news <news@ger.gmane.org>
Subject: Re: union fs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Apr 2008 08:40:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Mike (mwester <mwester <at> dls.net> writes:
> 
> Unslung is the only distro AFAIK that is still based on a 2.4 kernel; 
> and unionfs is not very useful (the obvious use, which is to use ntfs-3g 
> to replace the buggy Linksys proprietary ntfs driver is not write-safe, 
> and thus isn't useful).
> 
> I would suspect that we can simply drop the modules build from unionfs. 
>   (But perhaps leave the recipe present in case someone else wants very 
> much to try to get ntfs-3g working on unslung.)

What do you mean ntfs-3g is not write safe? Nobody ever told us.

It's certainly used and certified on several ARM and MIPS embedded devices 
regularly.

Regards,  Szaka

--
NTFS-3G: http://ntfs-3g.org





