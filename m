Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4CCEE72551
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2014 21:21:57 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id 29so3809223yhl.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2014 13:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=9kwjMkLewoxOB9BLp3S7vVrBSy/bZyo+/Ii4MJ/VeSo=;
	b=kPUC1ICZFkSICBuB6RiJRt6NGqdAlv4O5ENulrqATa8+L0n0Hsrx4110BoCu76x3wK
	De/IIQASoGTHG7nRz2a6oxMEj0tdAgVGuM48cNq2xUIvex6VyY7tHTXxxQpd7wM+68fE
	Pw3yaXOHh2Ne+1JidT1+sKHSw1S6Md04T3g8b1ls4WD6OrPNGj3xiL0ncyDXy8HSwsrT
	IjWkBQhJKFADBsIxaNCuyKH+2ThnjCCJMDU3StANWZyzZiSi25SQqvNtuopa3vMBUtvV
	0fo5kqMLFGur2STDmA2f9SLI2D+fcY1IJiR0RcFdaFtHa6Ac2s8Er4g3G01d54dmW7Id
	vM9g==
MIME-Version: 1.0
X-Received: by 10.170.60.87 with SMTP id c84mr26743394ykc.99.1419369718534;
	Tue, 23 Dec 2014 13:21:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Tue, 23 Dec 2014 13:21:58 -0800 (PST)
In-Reply-To: <1419237023-27713-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1419237023-27713-1-git-send-email-qianl.fnst@cn.fujitsu.com>
Date: Tue, 23 Dec 2014 19:21:58 -0200
X-Google-Sender-Auth: 3XNc-8dZugU4z_ss_ZlZURrrXqo
Message-ID: <CAP9ODKpRc=t3MLbACCfxJ8hy=_9RseX1kGy_mcSPeckY49nsVg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fedora-initscripts: Add new recipe
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
X-List-Received-Date: Tue, 23 Dec 2014 21:21:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 22, 2014 at 6:30 AM, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:
> The initscripts package contains the basic system scripts used to boot your
> Red Hat or Fedora system, change runlevels, and shut the system down cleanly.
> Initscripts also contains the scripts that activate and deactivate most
> network interfaces.
>
> Port from Fedora 20.
>
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>

Could you explain why you wish to have this included? What is missing
on the standard init scripts?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

