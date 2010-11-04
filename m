Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PE8NX-0000PJ-2B
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 23:33:55 +0100
Received: (qmail 25208 invoked by uid 503); 4 Nov 2010 23:02:50 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 4 Nov 2010 23:02:50 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Nov 2010 00:33:03 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 5 Nov 2010 00:33:02 +0200
Message-ID: <4CD3349D.6060904@eukrea.com>
Date: Thu, 04 Nov 2010 23:33:01 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
	<20101104220649.GE28852@denix.org>
In-Reply-To: <20101104220649.GE28852@denix.org>
X-Ovh-Tracer-Id: 3791467937030647113
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded Release 2010.12 --- needs your help!
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
X-List-Received-Date: Thu, 04 Nov 2010 22:33:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 04/11/2010 23:06, Denys Dmytriyenko a écrit :
> On Thu, Nov 04, 2010 at 09:04:43PM +0100, Leon Woestenberg wrote:
>> Hello all,
>>
>> at OEDEM we discussed the need for OpenEmbedded releases.
>>
>> - OpenEmbedded releases are planned in certain months, so that we can
>> plan stabilization efforts in the future.
>> - Each release is a point release in time.
>> - A release is a candidate branch point for a stable branch (which can
>> be maintained by those who use it).
>> - The next release is planned 2010.12, more specifically December 1st.
>> That's only four weeks from now.
>> - The 2010.12 release is hand-picked from a recent testing branch.
>
> - OpenEmbedded releases are planned to be time based and happen every 3 month
> (quarterly), starting with the first one on December 1st.
>
- what about a "no major change" freeze period for 2-3 weeks before each 
release to have a enough time to stabilize a little bit the beast ?

>> Now that our testing team has the process in place to gather test
>> results, please consider to build your
>> favorite set of distro/machine targets using tinderbox, and report your results.
>>
>> One requirement is to use bitbake 1.10, as the minimal requirement
>> will soon be 1.10 for the OpenEmbedded metadata.
>

Eric


