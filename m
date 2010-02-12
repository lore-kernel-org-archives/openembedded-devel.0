Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ng0dB-0002FG-Fi for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 19:52:48 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ng0aa-00070d-DS for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 19:50:05 +0100
Received: from raba-002.raba.com ([66.16.10.2])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 19:50:04 +0100
Received: from mike by raba-002.raba.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 19:50:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: mike <mike@wodell.com>
Date: Fri, 12 Feb 2010 18:45:37 +0000 (UTC)
Message-ID: <loom.20100212T194323-304@post.gmane.org>
References: <200902131728.08634.openembedded@haerwu.biz>
	<878woae03q.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902130939m708ada3dn55be8cdeadacbfbb@mail.gmail.com>
	<871vu2chee.fsf@neumann.lab.ossystems.com.br>
	<c384c5ea0902131135v5797291t2955907944e27bb7@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 66.16.10.2 (Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.1.4) Gecko/20091016 Firefox/3.5.4 (.NET CLR 3.5.30729))
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: checksums situation
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
X-List-Received-Date: Fri, 12 Feb 2010 18:52:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I followed you up till:
> The filename ALONE is used as the key into the file database.

I'm having trouble understanding how this will work with names like 
"Main.java" currently in the checksums.  Is there another discussion about
naming collisions?

Cheers!
Mike







