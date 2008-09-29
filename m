Received: from [208.84.147.47] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hacker@klever.net>) id 1KkNWq-0001xK-LY
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Sep 2008 20:31:28 +0200
Received: from pd953af89.dip0.t-ipconnect.de ([217.83.175.137] ident=hacker)
	by rhodos.klever.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hacker@klever.net>) id 1KkNSy-0004Zm-0V
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Sep 2008 20:27:29 +0200
Message-ID: <48E11E00.9080906@klever.net>
Date: Mon, 29 Sep 2008 20:27:12 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200809272237.22810.zecke@selfish.org>	<48DE9EE0.8090000@balister.org>
	<48DEA994.2030607@gmx.de>	<48DEAE43.5090407@balister.org>	<87od299ptz.fsf@neumann.lab.ossystems.com.br>	<20080929124518.GE27647@sirena.org.uk>
	<48E0E408.80805@klever.net> <20080929151413.GI27647@sirena.org.uk>
In-Reply-To: <20080929151413.GI27647@sirena.org.uk>
Subject: Re: git conversion and what is missing?
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
X-List-Received-Date: Mon, 29 Sep 2008 18:31:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Commit '4232c25232afeb1e9c40200800577a6eb00246a3' by Laibsch. Perhaps, 
Rolf's got the patch from you on IRC?

Love,
H

Mark Brown wrote:
> On Mon, Sep 29, 2008 at 04:19:52PM +0200, Michael Krelin wrote:
>> Mark Brown wrote:
> 
>>>> Yes; it is used during conversion to properly set commits to the right
>>>> author names however I believe we can't hold it forever. We need to
>>>> set a deadline and if someone didn't fill it... so sorry. 
> 
>>> If they miss the deadline they could still be added to .mailmap later
>>> which would fix up most of the interesting cases (eg, git log output).
> 
>> That should've been "we", not "they", no? :-)
> 
>>     ""                   : (["broonie"], ""),
> 
> Hrm, looks like that was me.  No idea why my e-mail address got dropped
> from the commit...
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


