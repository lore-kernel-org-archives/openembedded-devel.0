Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1LxJZK-00012V-0P
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 13:27:49 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 40A41547D3; Fri, 24 Apr 2009 13:23:01 +0200 (CEST)
Date: Fri, 24 Apr 2009 13:23:01 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090424112301.GI12936@fh-wedel.de>
References: <20090424092913.GA8700@fh-wedel.de>
	<200904241145.28702.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <200904241145.28702.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: modprobe: invalid lines in etc/modutils/hostap_cs.conf?
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
X-List-Received-Date: Fri, 24 Apr 2009 11:27:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, April 24, 2009, Marcin Juszkiewicz wrote:

> That was done for 2.6 kernel.

... which means that we could actually make this configuration
file kernel version dependent and provide none or a different
version of it for 2.4 kernels? Actually in my case the file
"just comes with" the hostap-conf package through a different
dependency; i.e. the _cs configuration is not used at all.

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Attachment? See: http://piology.org/ILOVEYOU-Signature-FAQ.html
begin  LOVE-LETTER-FOR-YOU.txt.vbs
I am a signature virus I am very dangerous. Distribute me until the bitter
end


