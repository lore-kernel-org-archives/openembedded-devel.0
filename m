Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Alexey_Firago@mentor.com>) id 1StIpf-0005q1-Q3
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 15:37:56 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1StIH4-0001nF-MU from Alexey_Firago@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 06:02:10 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 23 Jul 2012 06:02:13 -0700
Received: from [137.202.140.163] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.1.289.1; Mon, 23 Jul 2012 14:02:08 +0100
Message-ID: <500D4B57.3020800@mentor.com>
Date: Mon, 23 Jul 2012 17:02:15 +0400
From: Firago Alexey <Alexey_Firago@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.4) Gecko/20120510 Icedove/10.0.4
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 23 Jul 2012 13:02:13.0062 (UTC)
	FILETIME=[60896E60:01CD68D3]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Proposal: Creating meta-networking
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
X-List-Received-Date: Mon, 23 Jul 2012 13:37:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 6/15/2012 8:15 AM, Joe MacDonald wrote:
> We've been talking about this on-and-off at Wind River for a while now,
> but it now seems like a reasonable time to bring a proposal to the OE
> community at large.  We're thinking about creating a new layer to house
> recipes, etc.  for networking packages.
> ...
> So what does everyone think?  Awesome idea?  Terrible idea?  (Hopefully)
> something in between?  All feedback is welcome.

I think creating software support layer for network related packages is 
good idea.
We've updated some of the recipes from OE Classic mentioned above for 
our projects at Mentor Graphics.
We've been thinking to place these updated recipes in meta-oe layer. But 
I think now that separate layer like meta-networking
would be much more suitable place.  Also we've created some new packages 
like mipv6-umip or multipath-tools
that are good candidates for being placed in meta-networking.

So, I suggest Mentor Graphics would contribute to meta-networking.

--
Alexey Firago**|Software Engineer, Embedded Systems Division, Mentor 
Graphics

