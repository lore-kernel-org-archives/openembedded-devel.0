Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lw1Lq-0000zK-6S
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 23:48:30 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090420214405.HPMA22254.fed1rmmtao106.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 17:44:05 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id hxk41b00K4dMFYL04xk4EQ; Mon, 20 Apr 2009 17:44:06 -0400
X-Authority-Analysis: v=1.0 c=1 a=wpJ-lJ1ofboA:10 a=Tqv_pNNaqBUA:10
	a=Q4-j1AaZAAAA:8 a=4HVRqb_MAAAA:8 a=22pK5S-mAAAA:8
	a=7aR8due0lZMCuoknc6cA:9
	a=CIPBv1m0B1uCjVqvSboA:7 a=wVZckJH7z-aHfF37eWkYvpWaybYA:4
	a=UcWZWmDdwLsA:10 a=k-kO48AawpMA:10
X-CM-Score: 0.00
Date: Mon, 20 Apr 2009 14:44:04 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090420214404.GE17629@smtp.west.cox.net>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-3-git-send-email-marcin@juszkiewicz.com.pl>
	<gsi83l$ec5$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gsi83l$ec5$2@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [STABLE][PATCH 1/1] tracker: added libgnomecanvas to	dependencies
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
X-List-Received-Date: Mon, 20 Apr 2009 21:48:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2009 at 06:32:52PM +0200, Koen Kooi wrote:

> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Tom Rini <trini@embeddedalley.com>

>
>
> On 20-04-09 17:24, Marcin Juszkiewicz wrote:
>> From: Marcin Juszkiewicz<hrw@openembedded.org>
>>
>> ---
>>   recipes/tracker/tracker_0.5.4.bb |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/tracker/tracker_0.5.4.bb b/recipes/tracker/tracker_0.5.4.bb
>> index 4753280..e1a94b7 100644
>> --- a/recipes/tracker/tracker_0.5.4.bb
>> +++ b/recipes/tracker/tracker_0.5.4.bb
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION = "Tracker is a tool designed to extract information and metadata about your personal data so that it can be searched easily and quickly."
>>   LICENSE = "GPLv2"
>> -DEPENDS = "file gtk+ gstreamer gamin libgmime dbus poppler libexif libgsf"
>> +DEPENDS = "file gtk+ gstreamer gamin libgmime dbus poppler libexif libgsf libgnomecanvas"
>>
>>   PR = "r3"
>>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Tom Rini


