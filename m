Received: from [64.233.162.224] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1HdeGw-0006gU-9F
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2007 05:22:26 +0200
Received: by nz-out-0506.google.com with SMTP id m22so1306657nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2007 20:22:25 -0700 (PDT)
Received: by 10.114.127.1 with SMTP id z1mr2209988wac.1176780144152;
	Mon, 16 Apr 2007 20:22:24 -0700 (PDT)
Received: by 10.114.191.6 with HTTP; Mon, 16 Apr 2007 20:22:24 -0700 (PDT)
Message-ID: <f96d234e0704162022x25184389g5706a7323e7e6cf1@mail.gmail.com>
Date: Mon, 16 Apr 2007 23:22:24 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: "Marcin Juszkiewicz" <openembedded@hrw.one.pl>, 
	openembedded-devel@lists.openembedded.org
In-Reply-To: <200704130819.55884.openembedded@hrw.one.pl>
MIME-Version: 1.0
References: <200703042228.03665.openembedded@hrw.one.pl>
	<200704122035.03980.openembedded@hrw.one.pl>
	<461EB337.7020302@whitby.id.au>
	<200704130819.55884.openembedded@hrw.one.pl>
Subject: Re: RFC: Task-base rewrite
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2007 03:22:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/13/07, Marcin Juszkiewicz <openembedded@hrw.one.pl> wrote:
> Idea of splitting into separate packages comes from my discussions with
> Richard about differencies between Poky task-base and OE task-base.
> During last Easter I had more time to think about correct implementation
> and wanted to make small rootfs creation easier then it was before.
>
> And nslu2 rootfs is big - Cliff Brake created 1.7M rootfs for his Compulab
> board.
>
> Cliff: can you look at task-boot contents and tell does it need something
> removed/added to create minimal image?

Hi Marcin,

Looks great.  I'm hoping to merge my updater project into OE in the
next couple weeks so that we have a complete solution for JFFS2 on the
compulab module.  The new task base should be ideal for that.  I'll
let you know how it works out.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


