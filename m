Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id E2E056A467
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 17:51:44 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 5001)
	id C68243B3416B; Fri, 17 Jan 2014 18:51:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from nirvana.localnet (p5B2C127D.dip0.t-ipconnect.de [91.44.18.125])
	by gravedo.de (Postfix) with ESMTPSA id 5C8123B34110
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 18:51:42 +0100 (CET)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2014 18:51:40 +0100
Message-ID: <2040901.xScSF211cV@nirvana>
User-Agent: KMail/4.11.3 (Linux/3.11.0-15-generic; KDE/4.11.3; x86_64; ; )
In-Reply-To: <CAP71Wjw=izSkOfwTHpLG_OZpX=4tUHeKgiZboT-2rg3jStNYog@mail.gmail.com>
References: <CAP71WjydArvSEYRdK0NRWs5tTS_KuYBjZena8nas9eE0tHbv6g@mail.gmail.com>
	<20140116235245.GK3742@jama>
	<CAP71Wjw=izSkOfwTHpLG_OZpX=4tUHeKgiZboT-2rg3jStNYog@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: qt5 and virtualbox
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2014 17:51:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 January 2014 11:46:54 Nicolas Dechesne wrote:
> On Fri, Jan 17, 2014 at 12:52 AM, Martin Jansa <martin.jansa@gmail.com> 
wrote:
> > Check .bbappends in
> > https://github.com/webos-ports/meta-webos-ports
> > 
> > there is branch also for 5.2.0 and if you check webos-ports wiki you'll
> > even find VirtualBox appliance build to test it without building it
> > yourself.
> i could run the appliance. this is awesome stuff. pretty much exactly
> what i needed. we don't use the wayland QPA, but eglfs, but I don't
> see any specific reason why this could be a problem. this stuff is
> very nicely designed... a good example of what can be done with OE!

Thanks a lot! We're building currently three different target machines (one is 
qemux86 based and for virtualbox) from the same tree and it's working very 
well :) Every target has the same core system with just some changed runtime 
configuration. 

If you have any questions about how to configure the setup feel free to ask :)

regards,
Simon

