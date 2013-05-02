Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UXuFK-0004Ti-UN
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 16:12:31 +0200
Received: from [10.1.14.186] (83-64-248-68.inzersdorf.xdsl-line.inode.at
	[83.64.248.68]) by ptmx.org (Postfix) with ESMTPSA id 7DC1E29223
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 May 2013 15:54:39 +0200 (CEST)
Message-ID: <5182701F.5030605@pseudoterminal.org>
Date: Thu, 02 May 2013 15:54:39 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <2924564.6VWmlqGvL5@helios>
In-Reply-To: <2924564.6VWmlqGvL5@helios>
Subject: Re: Please submit your unindexed layers
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
X-List-Received-Date: Thu, 02 May 2013 14:12:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2013 03:27 PM, Paul Eggleton wrote:
> Hi all,
>
> Even a cursory search of github reveals that there are a growing number of
> layers being worked on in the community that aren't currently listed in the OE
> layer index. I don't think it would be right for us to just add all of these
> in bulk as we don't necessarily have all the needed information to do so, and
> it's not clear if some of them are forks, or if they will continue to be
> published in the same place, etc. So, what we really need is for the
> maintainers of these layers to submit them to the layer index themselves, or
> have someone else do it on their behalf.
>
> If you're maintaining a publicly accessible layer that already does something
> useful and is not currently in the OE layer index, please submit it so that
> other folks in the community can find it easily. The submission form doesn't
> need a login and is pretty straightforward to fill in:
>
>    http://layers.openembedded.org/layerindex/submit/
>
> If you have any problems or concerns please let me know.
>
> Thanks!
>
> Paul
>

While I do have a layer for GStreamer 1.0 , I did not want to add it to 
the index. My guess was that OE core developers might have been 
preparing recipes for GStreamer 1.0 for later OE core versions already, 
so the layer would then eventually be in conflict with OE core.

So, should I add it now?


