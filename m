Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LyRmO-0002LD-7o
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 16:25:56 +0200
Received: (qmail 6911 invoked from network); 27 Apr 2009 14:20:52 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 27 Apr 2009 07:20:52 -0700
Date: Mon, 27 Apr 2009 07:20:52 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090427142052.GH18788@smtp.west.cox.net>
References: <49F59B68.1010208@balister.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF793@hiob.intern.dresearch.de>
	<20090427134352.GE18788@smtp.west.cox.net>
	<gt4ekt$ba2$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gt4ekt$ba2$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org
Subject: Re: gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
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
X-List-Received-Date: Mon, 27 Apr 2009 14:25:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2009 at 04:14:52PM +0200, Koen Kooi wrote:
> On 27-04-09 15:43, Tom Rini wrote:
>> On Mon, Apr 27, 2009 at 03:37:25PM +0200, Sledz, Steffen wrote:
>>>>> At the moment we are not able to make a build out of the
>>>>> .dev tree. :(
>>>>
>>>> For what machine and distro?
>>>
>>> hipox and angstrom
>>>
>>> But does this problem really depends on them? I thought it's a problem in the gcc-4.2.4 recipe.
>>
>> It's in all gcc versions, really.
>
> No, it isn't:
>
> NOTE: package gcc-4.3.3-r0: task do_build: completed

Hmm, I'd swear I saw it fail in 4.3.x too, but OK.

-- 
Tom Rini


