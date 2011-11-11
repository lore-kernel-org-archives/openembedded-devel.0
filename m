Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1ROnlJ-0002Ux-9l
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 10:51:05 +0100
Received: from [192.168.1.250] (91-65-246-230-dynip.superkabel.de
	[91.65.246.230])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 8C8201B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 09:43:00 +0000 (UTC)
Message-ID: <4EBCEE8B.10802@freyther.de>
Date: Fri, 11 Nov 2011 10:44:43 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20111010 Iceowl/1.0b2 Icedove/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EBBE67F.20300@freyther.de>
	<j9gufv$35d$1@dough.gmane.org>	<20111110185732.GC20602@denix.org>
	<j9hbvk$b8u$2@dough.gmane.org> <20111110210133.GD20602@denix.org>
In-Reply-To: <20111110210133.GD20602@denix.org>
Subject: Re: RFC Creation of a meta-telephony repository
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
X-List-Received-Date: Fri, 11 Nov 2011 09:51:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/10/2011 10:01 PM, Denys Dmytriyenko wrote:

>> I haven't seen enough reason to place the burden for this layer on the OE
>> admin team instead of doing 'self' hosting on gitorious/github/etc/
> 
> Well, first of all, when we had constrained resources at oe.org, we were 
> trying to limit the number of commercial layers, assuming that the company 
> behind such layer is well capable of providing hosting for their product. 
> That would mean BSP layers from semis, like Intel, TI, Freescale etc. or 
> commercial distro layers from OSVs, such as Mentor, Montavista etc.
> We always welcomed community layers on oe.org, even BSP layers for platforms 
> that had no official commercial support, but also distro, apps and other 
> layers, as long as they had "supported by community" status.

Okay,

i don't mind hosting this myself (either gitorious or really myself). The
reason to ask for hosting it on OE was making it easier to collaborate with OE
members and making it more easy to find the repository.

cheers
	holger

PS: sorry for reposting... postfix +subject and mailman don't know each
other... thunderbird is of not much help either.


