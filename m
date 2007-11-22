Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eha@doredevelopment.dk>) id 1IvI0s-0006Mf-Mu
	for openembedded-devel@openembedded.org; Thu, 22 Nov 2007 20:47:02 +0100
Received: from [192.168.2.90] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id lAMJiZmb012105
	for <openembedded-devel@openembedded.org>;
	Thu, 22 Nov 2007 20:44:40 +0100
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@openembedded.org
In-Reply-To: <47450371.9050005@trolltech.com>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<4743201F.8000202@am.sony.com> <617697824.20071121042405@gmail.com>
	<4743C5B8.4030209@whitby.id.au>
	<774364350.20071122023548@vanille-media.de>
	<47450371.9050005@trolltech.com>
Organization: Dore Development ApS
Date: Thu, 22 Nov 2007 09:14:50 +0100
Message-Id: <1195719290.20614.0.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Thu, 22 Nov 2007 19:47:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, 2007-11-22 at 14:20 +1000, Lorn Potter wrote:
> Michael 'Mickey' Lauer wrote:
> 
> > Guilty as charged. Lets try not to force these people to use OE -- we
> > can do this by releasing prebuilt toolchains. I'm going to start with
> > releasing an OpenMoko toolchain next week.
> 
> 
> FYI, We have had a toolchain released when we first released Qtopia for 
> Neo tech preview, built with CROSS_DIR = "/opt/toolchains/arm920t-eabi". 
> I put it there because that is where the greenphone toolchain lived.
> 
> It would be nice if we were to use the same location for toolchains. So 
> perhaps you could use our location? :)

And prevent people from installing both toolchains on the same machine
without fiddling with paths?

/Esbn

-- 
Esben Haabendal
Embedded Software Consultant, Dore Development ApS
Phone: +45 5192 5393  Email: eha@doredevelopment.dk



