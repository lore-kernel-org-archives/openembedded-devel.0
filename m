Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LokZR-0000tN-QM
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 22:28:30 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090331202612.HLYF10385.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 31 Mar 2009 16:26:12 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id ZwSA1b00A4dMFYL04wSAHU; Tue, 31 Mar 2009 16:26:13 -0400
X-Authority-Analysis: v=1.0 c=1 a=2KqX4tJIiHoA:10 a=EUJYz0z2JPoA:10
	a=yB261aP5OZQCHHPpD9UA:9 a=Ewp_qUKO7OGwJMxqNzWyVPzDNf0A:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 31 Mar 2009 13:26:10 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090331202610.GL14278@smtp.west.cox.net>
References: <49D27952.6060806@gmx.net> <gqttl9$kdj$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gqttl9$kdj$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [stable] floating revisions or _svn/_git/_cvs recipes
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
X-List-Received-Date: Tue, 31 Mar 2009 20:28:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2009 at 10:15:37PM +0200, Koen Kooi wrote:
> On 31-03-09 22:13, Robert Schuster wrote:
>> Hi,
>> the new stable branch has been created. Soon we will see an influx of
>> $BIG_COMPANY making use it. ;)
>>
>> All great. :)
>>
>> However I see a problem with those recipes which do not have a fixed
>> version. I mean those that have _svn, _git or _cvs as the version number
>> and are configured to autorev.
>
> There are *no* recipes like that, if there are, they should get deleted.

Or locked down :)

-- 
Tom Rini


