Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N8IAk-0002Me-W8
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 19:44:06 +0100
Received: (qmail 13358 invoked by uid 1003); 11 Nov 2009 18:42:39 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 11 Nov 2009 18:42:39 -0000
Message-ID: <4AFB059E.50801@balister.org>
Date: Wed, 11 Nov 2009 13:42:38 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1257953228-2353-1-git-send-email-Martin.Jansa@gmail.com>	<20091111154511.GA2761@denix.org>
	<20091111174317.GB11484@jama>
In-Reply-To: <20091111174317.GB11484@jama>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] bitbake.conf: SRCPV always upgradeable paths for git recipes
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
X-List-Received-Date: Wed, 11 Nov 2009 18:44:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2009 12:43 PM, Martin Jansa wrote:
> On Wed, Nov 11, 2009 at 10:45:11AM -0500, Denys Dmytriyenko wrote:
>> On Wed, Nov 11, 2009 at 04:27:08PM +0100, Martin Jansa wrote:
>>> * Holger Hans Peter Freyther<zecke@openmoko.org>  did for the OM git
>>>    tree that was never merged back into OE.
>>> * Taken from xora/angstrom-srcpv branch where it rot for long enough
>>
>> We also discussed it during the OEDEM...
>
> RP said you did on #oe
> 16:25:45<  RP>  JaMa|Wrk: I can't sanction that, needs to be proposed on
> list but I'd ack it
> 16:26:18<  XorA>  JaMa|Wrk: got my Ack
> 16:26:46<  RP>  It was mentioned informally at OEDEM and nobody I talked
> to objected...
>
> Mickey acked too on #openmoko-cdevel
> 16:47:28<  JaMa|Wrk>  mickey|office: ack for SRCPV?
> 16:50:47<  mickey|office>  ya
>
> So that's at least 3 ACKs, if there is no objection today I'll push it.

Can people please get in the habit of using proper acks for patches? 
This fishing though the random forms people are using is getting tiresome.

For me: Acked-by: Philip Balister <philip@balister.org>

Patchwork will pick these up, so it makes tracking things much easier. 
Even if you agree to ack something in irc, please follow up with the 
proper ack on the mailing list.

Philip



