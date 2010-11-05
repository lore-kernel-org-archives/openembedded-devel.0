Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PEJAJ-0002Ee-Qp
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 11:05:00 +0100
Received: (qmail 14555 invoked by uid 503); 5 Nov 2010 10:08:40 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 5 Nov 2010 10:08:39 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Nov 2010 12:03:57 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 5 Nov 2010 12:03:55 +0200
Message-ID: <4CD3D68A.9040704@eukrea.com>
Date: Fri, 05 Nov 2010 11:03:54 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>	<20101104220649.GE28852@denix.org>
	<4CD3349D.6060904@eukrea.com>	<20101104224752.GH28852@denix.org>
	<20101105065240.GI3440@jama>	<4CD3CCDE.3080306@eukrea.com>
	<20101105094915.GM3440@jama>
In-Reply-To: <20101105094915.GM3440@jama>
X-Ovh-Tracer-Id: 15459450146787339593
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
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
X-List-Received-Date: Fri, 05 Nov 2010 10:05:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 05/11/2010 10:49, Martin Jansa a écrit :
>>> I know it could lower number of people using this future release branch
>>> during testing period before release, but still seems better then pushing 3
>>> weeks of commits from my local branch as soon as release is branched and
>>> master open for new recipes again.
>
>> That's the way linux, u-boot&  co are running and when the new merge window
>> opens several thousand of patches can be merged in a few days.
>
> And also why there is linux-next, but I agree that in our scale we can keep new
> recipes and features in local checkouts/out-of-tree branches without too
> much pain in merging them after 3 weeks.
>
a temporary next branch could be open to host new big patches and then merged 
to master once stable is out.
This way most peoples getting oe during the stabilization period will get 
master and will test it and developers will be able to follow their 
development in the next branch.
I think that during this stabilization weeks, developers have to do the effort 
to checkout the next branch if they want to work on it and user must get the 
master branch being stabilized as a default, but not the reverse.

Eric


