Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZ0s3-0000xT-T5
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 10:34:09 +0100
Received: by fg-out-1718.google.com with SMTP id e12so1849205fga.0
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 02:32:11 -0700 (PDT)
Received: by 10.86.50.8 with SMTP id x8mr1316449fgx.30.1205227931426;
	Tue, 11 Mar 2008 02:32:11 -0700 (PDT)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id e20sm10255607fga.1.2008.03.11.02.32.09
	(version=SSLv3 cipher=OTHER); Tue, 11 Mar 2008 02:32:10 -0700 (PDT)
Date: Tue, 11 Mar 2008 11:32:56 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080311113256.461ad5d1@widy.localdomain>
In-Reply-To: <47D64717.3050804@gmail.com>
References: <200803110807.11368.zecke@selfish.org> <47D64717.3050804@gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 09:34:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 11 Mar 2008 09:47:19 +0100
Esben Haabendal <EsbenHaabendal@gmail.com> wrote:

[]

> > comments? agreement?
> >   
> Without going into the specifics of the SCM tools discussion, I would
> just like to say that I would REALLY REALLY love to see branches being
> used actively in OE development, 

Oh really? Because I would think that loving to see them makes little
sense. It makes sense only to use them. And who will use them?
Because if people wanted to use them, they would do that already.
Actually, people who want, do.

> especially for feature development
> (such as sysroot, packaged-staging, and so on) and for release
> engineering.
> 
> For OE to really reach it's potential we have to be able add even more
> features while at the same time delivering stable releases/branches
> for distro and product developers to work from.
> 
> When Joe-average-embedded-product-developer comes along, shopping for
> which embedded Linux tool to use for his embedded product, he really
> should be able to checkout a stable version of OE and be able to
> build a toolchain and a simple image for all supported targets. And
> this is certainly not the situation right now.

Typical mistake. There's stable branch in OE, and based on the
experience with the previous branches, best-practices change control
procedure was applied to it. Now, based on 2.5 month existence of that
branch, I have following observations:

1. People don't know about that branch.
2. Once made known, people still pretend that there's none, and
continue to complain about stability.
3. Most of the rest of people don't put slightest effort into
maintenance of that branch.
4. Those who try, complain that the change control procedure is ...
complex! But it is only a separate branch + pre-review of changes + "all
changes are merged from main branch" rule of thumb.


Having more branches is not going to help with this at all. 

> 
> /Esben

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


