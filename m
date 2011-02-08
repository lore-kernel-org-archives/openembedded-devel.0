Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Pmoy2-0002HB-BS
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 15:54:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id E3260A55EE;
	Tue,  8 Feb 2011 14:53:56 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id IkwOnsZuk9AR; Tue,  8 Feb 2011 14:53:56 +0000 (GMT)
Received: from xora-build.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 5CAE7A55DC;
	Tue,  8 Feb 2011 14:53:56 +0000 (GMT)
Received: by xora-build.xora.org.uk (Postfix, from userid 500)
	id 6DAEF4060E; Tue,  8 Feb 2011 14:53:56 +0000 (GMT)
Date: Tue, 8 Feb 2011 14:53:56 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: Tom Rini <tom_rini@mentor.com>
Message-ID: <20110208145355.GF2050@xora-build.xora.org.uk>
References: <4D51566B.9060603@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D51566B.9060603@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Tue, 08 Feb 2011 14:54:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 08, 2011 at 07:42:51AM -0700, Tom Rini wrote:
> angstrom-2008.1 / angstrom-2010.x:
> hawkboard, mini2440, mini6410, beagleboard + console-image /
> qt4-x11-demo-image / qt4e-demo-image
> 
atngw100 should be added to angstrom 2008.1/2010.x this makes
us a little less arm centric :-)

atngw100 is uclibc so I only expect console-image to build without
error. 

Graeme



