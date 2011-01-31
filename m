Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pk14L-0001UZ-D4
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 22:13:53 +0100
Received: (qmail 23318 invoked by uid 503); 31 Jan 2011 21:50:42 -0000
Received: from b9.ovh.net (HELO mail21.ha.ovh.net) (213.186.33.59)
	by 31.mail-out.ovh.net with SMTP; 31 Jan 2011 21:50:42 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 31 Jan 2011 23:12:59 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 31 Jan 2011 23:12:57 +0200
Message-ID: <4D4725D9.4060409@eukrea.com>
Date: Mon, 31 Jan 2011 22:12:57 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: coolaj86@gmail.com
References: <1296332602-28899-1-git-send-email-coolaj86@gmail.com>
	<AANLkTincDsBpwV1JUc7qDFmUFABJD7KLQR_KfvqCdqw1@mail.gmail.com>
In-Reply-To: <AANLkTincDsBpwV1JUc7qDFmUFABJD7KLQR_KfvqCdqw1@mail.gmail.com>
X-Ovh-Tracer-Id: 2727211049869225438
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] nodejs: updated recipe to v0.2.6
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
X-List-Received-Date: Mon, 31 Jan 2011 21:13:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi AJ,

On 29/01/2011 21:21, AJ ONeal wrote:
> I wasn't sure which format would be most preferred so I did it both ways.
>
you v2 seems good, but it's missing your signed-off
You can add it by using the option "-s" when generating the patch

http://wiki.openembedded.org/index.php/GitPhraseBook#Create_patches_suitable_for_the_mailing_list

Eric


