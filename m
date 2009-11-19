Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NB69T-0007Ia-4U for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 13:30:22 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NB685-0000L3-He
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 13:28:53 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 13:28:53 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 13:28:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 19 Nov 2009 13:28:39 +0100
Message-ID: <he3dlo$8lb$1@ger.gmane.org>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 12:30:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-11-09 21:11, Otavio Salvador wrote:
> Hello,
>
> I've been thinking about how difficult will be when we start stable/2010.
>
>  From my POV the best alternative is, before we start changing a lot of
> stuff in dev we do a merge of stable/2009 into dev to allow easy
> merging from outside "forks" made by users.

What would be the point of that? Stable/2009 only received changes that 
were already in .dev. If there are differences then that's due to 
needing to account for differences in classes, config files and old(er) 
bitbake releases.

It bothers me that everybody seems to have an opinion of stable/2009 but 
only very few people actually contribute to it. The OP is a great 
example of people not knowing what they are talking about. I can only 
imagine the amount of headdesks Marcin did at OEDEM when reading the 
hilarious summary of the stable branch discussion.

regards,

Koen



