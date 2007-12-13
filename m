Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1J2j7e-0004MJ-EO
	for openembedded-devel@openembedded.org; Thu, 13 Dec 2007 09:08:46 +0100
Received: by nf-out-0910.google.com with SMTP id c7so481770nfi.20
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Dec 2007 00:04:22 -0800 (PST)
Received: by 10.82.171.16 with SMTP id t16mr4230078bue.11.1197533062145;
	Thu, 13 Dec 2007 00:04:22 -0800 (PST)
Received: by 10.82.120.17 with HTTP; Thu, 13 Dec 2007 00:04:22 -0800 (PST)
Message-ID: <74d0deb30712130004v11453c5x109386d74997d6b0@mail.gmail.com>
Date: Thu, 13 Dec 2007 09:04:22 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47606910.9000505@zirak.it>
MIME-Version: 1.0
References: <47606910.9000505@zirak.it>
Cc: openembedded-devel@openembedded.org
Subject: Re: bash-completion for bitbake
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
X-List-Received-Date: Thu, 13 Dec 2007 08:08:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Dec 13, 2007 12:04 AM, Filippo Basso <filippo@zirak.it> wrote:
> For everybody interested,
>     I'm attaching here a small bash-completion script that I'm using.
> (other scripts will be sent soon)
> if somebody will make any improvements, plz send to me too...
>
> (maybe somebody else already did... but I haven't found, can be useful
> to put it in the website? you OE guys see, if there is no way to put
> there, I'll upload in a personal page about my work on OE...?
> suggestions well accepted)
>
> thanx,
>     phy

Very nice! Can't we put this somewhere in OE/contrib?
I think it would be nice if bitbake could provide this information itself,
maybe making use of the cache. This would also allow to add
versions and virtual providers to the autocompletion.

regards
Philipp


