Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PCFQp-0002ba-8S
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 19:41:31 +0200
Received: (qmail 29081 invoked by uid 503); 30 Oct 2010 18:09:48 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 30 Oct 2010 18:09:47 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Oct 2010 19:40:41 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 30 Oct 2010 19:40:39 +0200
Message-ID: <4CCC5896.50904@eukrea.com>
Date: Sat, 30 Oct 2010 19:40:38 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288395329-10474-1-git-send-email-eric@eukrea.com>	<4CCB5DC0.3030607@eukrea.com>
	<20101030131745.GA6312@jama>
In-Reply-To: <20101030131745.GA6312@jama>
X-Ovh-Tracer-Id: 6383570997798153545
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
Subject: Re: [PATCH] busybox: remove unused versions
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
X-List-Received-Date: Sat, 30 Oct 2010 17:41:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 30/10/2010 15:17, Martin Jansa a écrit :
> On Sat, Oct 30, 2010 at 01:50:24AM +0200, Eric Bénard wrote:
>> Le 30/10/2010 01:35, Eric Bénard a écrit :
>>> keep the following versions :
>>> 1.2.1 (used by oplinux)
>>> 1.7.2 (used by nylon)
>>> 1.13.2 (used by angstrom, kaeilos and slugos)
>>> 1.17.1 (used by angstrom)
>>> 1.17.3 (latest one)
>
> not sure if it's because busybox config or added by latest version but
> with 1.17.3 I got 4 colisions:
>
> ln: creating symbolic link `/usr/bin/flock': File exists
> ln: creating symbolic link `/usr/bin/sha256sum': File exists
> ln: creating symbolic link `/usr/bin/sha512sum': File exists
> ln: creating symbolic link `/usr/bin/timeout': File exists
>
> I've patches for util-linux-ng (flock) and coreutils to use u-a on those, so
> I'll push it today.
>

thanks

Eric


