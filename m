Received: from [212.227.126.186] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <robert@linuxdevelopment.de>) id 1H9REc-0004Nq-RE
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jan 2007 20:23:10 +0100
Received: from [85.212.167.5] (helo=[10.0.0.7])
	by mrelayeu.kundenserver.de (node=mrelayeu5) with ESMTP (Nemesis),
	id 0ML25U-1H9REZ38OA-0005Eb; Tue, 23 Jan 2007 20:23:10 +0100
Message-ID: <45B6609B.5080909@linuxdevelopment.de>
Date: Tue, 23 Jan 2007 20:23:07 +0100
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 1.5.0.8 (X11/20060911)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45B40165.6000506@whitby.id.au>	<45B4EDCD.1060609@dominion.kabel.utwente.nl>	<45B50D16.8060001@whitby.id.au>	<45B518A5.8000500@dominion.kabel.utwente.nl>	<45B5528F.3050108@whitby.id.au>
	<45B59FD0.1000207@whitby.id.au>
In-Reply-To: <45B59FD0.1000207@whitby.id.au>
X-Provags-ID: kundenserver.de abuse@kundenserver.de
	login:3a738c603c23670681f156cc7e748d26
Subject: Re: Removal of the proprietary Intel IXP ethernet driver (ixp4{00, 25}-eth, ixp-osal, ixp4xx-csr) from OE
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
X-List-Received-Date: Tue, 23 Jan 2007 19:23:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby schrieb:
> For a long time, the only way to use the internal ethernet port for
> ixp4xx devices was to use the proprietary intel driver.  The driver
> could not be linked with the kernel, and tainted the kernel.
>
> Thankfully, that has now changed with the development of the open source
> ixp npe kernel driver, which is GPL and can be freely linked with the
> kernel.  Note that the microcode firmware blob (ixp4xx-npe) which needs
> to be loaded by the driver is still Intel Proprietary and requires a
> click-through license on any firmware image that includes it.
>   
Dear Rod

Im not having such hardware but i am  interested in this drivers setup.
Do you think this code can be of any example ? I am in a similar
situation where i am confronted with a propriatory hardware driver.
Maybe that intel code as such is able to show me an good example of a
"firmware loading gpl module" and i could alter my code in such similar
way . Maybe the manufacturer looks at this and can go free with it also .
Could you explain to me the "click-through" license ?  Does one need to
agree on that on every module load or when will this come to play ?

kind regards
rob_w


