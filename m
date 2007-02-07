Received: from [64.233.184.224] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <sdgvulpes@gmail.com>) id 1HEnzx-0007L6-LM
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Feb 2007 15:42:13 +0100
Received: by wr-out-0506.google.com with SMTP id i20so214485wra
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Feb 2007 06:42:12 -0800 (PST)
Received: by 10.114.111.1 with SMTP id j1mr1835360wac.1170859331317;
	Wed, 07 Feb 2007 06:42:11 -0800 (PST)
Received: by 10.114.180.7 with HTTP; Wed, 7 Feb 2007 06:42:11 -0800 (PST)
Message-ID: <f34f85580702070642n5c91bdc1xf907f18940ae45e4@mail.gmail.com>
Date: Wed, 7 Feb 2007 09:42:11 -0500
From: "Todd Blumer" <sdgvulpes@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1170854529.3226.1.camel@lieve>
MIME-Version: 1.0
References: <f34f85580702070514u42b2b887qf416466c5b7bf83d@mail.gmail.com>
	<1170854529.3226.1.camel@lieve>
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
X-List-Received-Date: Wed, 07 Feb 2007 14:42:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/7/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>
> * don't use cp -a, that breaks on non-GNU buildsystems
>

Suggestions for replacement?

> * don't rely on /usr/bin/zic being present, but provide a zic-native
> recipe

Yeah, I knew that... it was laziness. :-/

--
Todd


