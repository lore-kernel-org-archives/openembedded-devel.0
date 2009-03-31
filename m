Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lohcl-0000Au-NT
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 19:19:44 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090331171728.RGWW27308.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 31 Mar 2009 13:17:28 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id ZtHT1b00c4dMFYL04tHTH1; Tue, 31 Mar 2009 13:17:27 -0400
X-Authority-Analysis: v=1.0 c=1 a=tEB_QHKmcVkA:10 a=8KSt4i8VptIA:10
	a=GNEw3xDRAAAA:8 a=gjwl7mjef9WLD2x9IvIA:9
	a=r4s-JFh9cNPithrr_-GPwIbTRJkA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 31 Mar 2009 10:17:27 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090331171727.GK14278@smtp.west.cox.net>
References: <200903311837.28324.marcin@juszkiewicz.com.pl>
	<gqti8d$6qs$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gqti8d$6qs$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Tue, 31 Mar 2009 17:19:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2009 at 07:00:59PM +0200, Koen Kooi wrote:
> On 31-03-09 18:37, Marcin Juszkiewicz wrote:
>>
>> Hi
>>
>> I would like to announce creation of new branch: stable/2009 in
>> OpenEmbedded repository. It was branched few days ago, build tested and
>> got some bugfixes which were added to .dev tree (and back to
>> stable/2009).
>>
>> What was in build test? Distro "angstrom-2008.1", machines: qemuarm
>> (armv5te), at91sam9263ek (armv5te), beagleboard (armv7a), qemux86 (i586)
>> and vortex86sx (486sx). I tested building of next images: console,
>> console-base, x11, beagleboard-demo for each of those machines. So far
>> only glibc builds were tested, uclibc one is queued.
>>
>> I also imported BitBake 1.8.12 (last release) into "stable/2009" branch
>> as this is minimal stable version which works with this repository.
>>
>> Feel free to clone and do tests. I will write more later.
>
> Great!
>
> I already have a few patches queued up for the stablebranch:
>
> http://dominion.thruhere.net/koen/OE/for-stable/
>
> What's the proper procedure for getting those in?

And please answer in the form of a link to a wiki page :)

-- 
Tom Rini


