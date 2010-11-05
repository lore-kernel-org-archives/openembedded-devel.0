Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PEIWB-00046a-Dq
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 10:23:31 +0100
Received: (qmail 20640 invoked by uid 503); 5 Nov 2010 09:27:20 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 5 Nov 2010 09:27:20 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Nov 2010 11:22:40 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 5 Nov 2010 11:22:38 +0200
Message-ID: <4CD3CCDE.3080306@eukrea.com>
Date: Fri, 05 Nov 2010 10:22:38 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>	<20101104220649.GE28852@denix.org>
	<4CD3349D.6060904@eukrea.com>	<20101104224752.GH28852@denix.org>
	<20101105065240.GI3440@jama>
In-Reply-To: <20101105065240.GI3440@jama>
X-Ovh-Tracer-Id: 14762236629492542793
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
X-List-Received-Date: Fri, 05 Nov 2010 09:23:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 05/11/2010 07:52, Martin Jansa a écrit :
> what about branching future release those 2-3 weeks ago and keep master for
> active development?
>
Stabilizing the master branch is active development as this allows to have
stronger fundation for the next features you can introduce 2 or 3 weeks after 
the stabilization weeks starts.

> I know it could lower number of people using this future release branch
> during testing period before release, but still seems better then pushing 3
> weeks of commits from my local branch as soon as release is branched and
> master open for new recipes again.
>
That's the way linux, u-boot & co are running and when the new merge window
opens several thousand of patches can be merged in a few days.

If we don't do that, the idea of stable release which implies detecting and 
fixing potential failures introduced by previous big changes will fail.

Eric


