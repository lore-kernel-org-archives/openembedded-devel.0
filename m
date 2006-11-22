Received: from [66.249.82.230] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1GmgNz-0007uV-C4
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Nov 2006 01:54:47 +0100
Received: by wx-out-0506.google.com with SMTP id t14so45909wxc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Nov 2006 16:51:58 -0800 (PST)
Received: by 10.90.65.11 with SMTP id n11mr6325301aga.1164156718622;
	Tue, 21 Nov 2006 16:51:58 -0800 (PST)
Received: by 10.35.119.19 with HTTP; Tue, 21 Nov 2006 16:51:58 -0800 (PST)
Message-ID: <432beae0611211651g6b538150x518608f9c8b56dc0@mail.gmail.com>
Date: Tue, 21 Nov 2006 16:51:58 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4561C0E1.1030001@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <0EC479DC-CDAB-4F46-8910-E02AB1D9017B@inf.fu-berlin.de>
	<4561C0E1.1030001@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: ParseErrors, Continued
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
X-List-Received-Date: Wed, 22 Nov 2006 00:54:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/20/06, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> Holger Freyther schreef:
> > Hey,
> >
> > you have done a lot and we are at 459 parser errors and here is the
> > list. If you fix it you can officially punch me to finish the parser.
>
> Only 182 ones left in rcf74582c2f1f66b88ee6661c6cdf7de75b0df961
> :
>
> /Users/koen/Projects/OpenEmbedded/org.openembedded.dev/packages/images/e-image.bb:6

Is this an error? It has always worked just fine. I'm guessing that
the combination of export and += is causing the error. I just ran a
"peek" in bitbake -i and it seems to be working as expected.

-- 
Justin Patrin


