Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1HNzNR-00066p-93
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 23:40:25 +0100
Received: by an-out-0708.google.com with SMTP id c5so1105464anc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2007 14:40:24 -0800 (PST)
Received: by 10.114.52.1 with SMTP id z1mr1024010waz.1173048023992;
	Sun, 04 Mar 2007 14:40:23 -0800 (PST)
Received: by 10.115.91.8 with HTTP; Sun, 4 Mar 2007 14:40:23 -0800 (PST)
Message-ID: <432beae0703041440qbc49d4et27ec858ec3f5dffa@mail.gmail.com>
Date: Sun, 4 Mar 2007 14:40:23 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1BCC2700-6848-45BC-8A5E-4CA7295A66B6@selfish.org>
MIME-Version: 1.0
References: <3812EAEB-7EFE-40F3-8311-1047D0540BD6@selfish.org>
	<20070304175316.GA4152@hovland.org>
	<1BCC2700-6848-45BC-8A5E-4CA7295A66B6@selfish.org>
X-Mailman-Approved-At: Mon, 05 Mar 2007 15:47:12 +0100
Subject: Re: Recent wordpress attacks and md5sum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Mar 2007 22:40:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 3/4/07, Holger Freyther <zecke@selfish.org> wrote:
>
> Am 04.03.2007 um 18:53 schrieb Erik Hovland:
>
> > On Sun, Mar 04, 2007 at 05:54:08PM +0100, Holger Freyther wrote:
> >> PPS: Yeah md5 is cracked, so is the sha family, any other options?
> >
> > Use sha256sum? NIST strongly encourages users to switch to sha-256 now
> > until they finish their hash competition.
> >
> > sha256sum does come with modern versions of coreutils. SHA-256 should
> > not be compromised yet...
>
> Hi Erik,
>
> not being a crypto expert I heard complains of inbreed of the whole
> sha family. But I think sha256 is totally fine for our purpose (only
> the sums are so long...)
>

I'm not sure where you heard that but some very in the know crypto
people (at the Monotone Summit no less) are planning on moving from
SHA-1 to SHA-256. SHA-1 has not been entirely broken as of now as you
can't get a useful collision out of it. However, it is close. SHA-256
doesn't have this problem.

-- 
Justin Patrin


