Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLYcv-00008W-Ri
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 11:00:30 +0100
Received: (qmail 15315 invoked by uid 503); 25 Nov 2010 10:03:35 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 25 Nov 2010 10:03:35 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Nov 2010 11:59:11 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Nov 2010 11:59:10 +0200
Message-ID: <4CEE336E.9070306@eukrea.com>
Date: Thu, 25 Nov 2010 10:59:10 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimpVmdKm5PcXijkpVm7uDUoNrFOupzddth1gRsM@mail.gmail.com>
In-Reply-To: <AANLkTimpVmdKm5PcXijkpVm7uDUoNrFOupzddth1gRsM@mail.gmail.com>
X-Ovh-Tracer-Id: 3705899545429519689
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
Subject: Re: qwt 5.2.1 failed to build here (om-gta02 , SHR, X11)
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
X-List-Received-Date: Thu, 25 Nov 2010 10:00:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 25/11/2010 10:53, Sylvain Paré wrote:
> http://tinderbox.openembedded.org/packages/1087355/
>
> Does some one else has already succeded to build qwt 5.2.1 for X11 ?
>
only compile tested (angstrom-2010.x, armv6, oe head & bitbake parallel-parsing) :
NOTE: package qwt-5.2.1-r0: task do_compile: Succeeded
.../...
NOTE: package qwt-5.2.1-r0: task do_rm_work_all: Succeeded

Eric


