Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mattjreimer@gmail.com>) id 1HEyJz-0006hO-WE
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Feb 2007 02:43:36 +0100
Received: by ug-out-1314.google.com with SMTP id e2so345768ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Feb 2007 17:43:35 -0800 (PST)
Received: by 10.78.204.7 with SMTP id b7mr3560151hug.1170899015248;
	Wed, 07 Feb 2007 17:43:35 -0800 (PST)
Received: by 10.78.184.6 with HTTP; Wed, 7 Feb 2007 17:43:34 -0800 (PST)
Message-ID: <f383264b0702071743s3a37ae9dxfebadd9e88771dd3@mail.gmail.com>
Date: Wed, 7 Feb 2007 17:43:34 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f34f85580702070642n5c91bdc1xf907f18940ae45e4@mail.gmail.com>
MIME-Version: 1.0
References: <f34f85580702070514u42b2b887qf416466c5b7bf83d@mail.gmail.com>
	<1170854529.3226.1.camel@lieve>
	<f34f85580702070642n5c91bdc1xf907f18940ae45e4@mail.gmail.com>
Subject: Re: tzdata.bb
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
X-List-Received-Date: Thu, 08 Feb 2007 01:43:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/7/07, Todd Blumer <sdgvulpes@gmail.com> wrote:
> On 2/7/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> >
> > * don't use cp -a, that breaks on non-GNU buildsystems
> >
>
> Suggestions for replacement?

For FreeBSD "cp -pR" is close.

Matt


