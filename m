Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1TbuWV-0005QA-Dc
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 15:46:33 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TbuIs-001G7K-06>; Fri, 23 Nov 2012 15:32:26 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TbuIr-001Xr2-Uq>; Fri, 23 Nov 2012 15:32:25 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1TbuIq-0000fs-SG
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2012 15:32:24 +0100
Date: Fri, 23 Nov 2012 15:32:24 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121123143224.GB31470@mi.fu-berlin.de>
References: <50AF6C63.6080208@nedap.com>
MIME-Version: 1.0
In-Reply-To: <50AF6C63.6080208@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: openjdk-7-vm-jamvm
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
X-List-Received-Date: Fri, 23 Nov 2012 14:46:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 23, 2012 at 01:30:27PM +0100, Jaap de Jong wrote:
> Hi,
> how can I build openjdk-7-vm-jamvm?
> If I bitbake openjdk-7 it is not added, while openjdk-7-vm-zero is added.
> I'm building for arm.
> Thanks!
> Jaap

Add it to your image.

Bye Henning


