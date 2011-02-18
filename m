Received: from 3.26.mail-out.ovh.net ([46.105.60.9] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PqXUh-0002ov-5H
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 22:04:11 +0100
Received: (qmail 29425 invoked by uid 503); 18 Feb 2011 20:03:44 -0000
Received: from b9.ovh.net (HELO mail95.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 18 Feb 2011 20:03:44 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Feb 2011 22:36:07 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 18 Feb 2011 22:36:06 +0200
Message-ID: <4D5ED835.7040800@eukrea.com>
Date: Fri, 18 Feb 2011 21:36:05 +0100
From: Eric Benard <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
In-Reply-To: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
X-Ovh-Tracer-Id: 15579639962529082697
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Fri, 18 Feb 2011 21:04:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/2011 20:26, Tom Rini wrote:
> In order to make the user experience better we now use bb.warn
> on non-fatal QA errors and bb.error on fatal errors.
>
> Signed-off-by: Tom Rini<tom_rini@mentor.com>
Acked-by: Eric Benard <eric@eukrea.com>


